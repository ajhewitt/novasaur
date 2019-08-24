//from tinyFat for arduino adapted for lcc1802/olduino by Bill Rowe Nov 2013
//this code was adapted for LCC1802/Olduino November 2013 by Bill Rowe
//mostly a matter of replacing mmc::xxx with mmc_xxx and tinyFat::xxx with tF_xxx
//credit to the author as below, all faults are mine.
//dec 22 removing sdhc support
/*
	tinyFAT.cpp - Arduino library support FAT16 on SD cards
	Copyright (C)2010-2011 Henning Karlsen. All right reserved

	You can find the latest version of the library at
	http://www.henningkarlsen.com/electronics
*/
#include "mmc.h"
#include <hspi2.h>
#include <olduino.h>
#define spiRec() spixfer(0xff)

static void spiSendLong(uint32_t data)
{
	union
	{
		unsigned long l;
		unsigned char c[4];
	} long2char;

	long2char.l = data;

	spiSend(long2char.c[0]);  //i have reversed these as a test!
	spiSend(long2char.c[1]);
	spiSend(long2char.c[2]);
	spiSend(long2char.c[3]);
}

uint8_t waitNotBusy(uint16_t timeoutMillis)
{
	uint16_t t0 = 255; //fixed count of tries for timeout
	do
	{
		if (spiRec() == 0XFF)	return true;
	}
	while (t0--);
	return false;
}

uint8_t mmc_cardCommand(uint8_t cmd, uint32_t arg)
{
	uint8_t status_,i;
	uint8_t crc = 0xFF;

	digitalWrite(SD_SS,LOW);
	(void)waitNotBusy(300);
	spiSend(cmd | 0x40);
	spiSendLong(arg);

	if (cmd == GO_IDLE_STATE)	crc = 0x95;  // correct crc for CMD0 with arg 0
	if (cmd == SEND_IF_COND)	crc = 0x87;  // correct crc for CMD8 with arg 0X1AA
	spiSend(crc);

	for (i = 0; ((status_ = spiRec()) & 0X80) && i != 0XFF; i++);
	return status_;
}

uint8_t mmc_cardAcmd(uint8_t cmd, uint32_t arg)
{
	(void)mmc_cardCommand(APP_CMD, 0);
	return mmc_cardCommand(cmd, arg);
}

uint8_t mmc_waitStartBlock(void)
{
	uint8_t status_;

	uint16_t t0 =255; //explicit cycle count for timeout
	while ((status_ = spiRec()) == 0XFF)
	{
		if (!(t0--))
		{
			mmc__errorCode = SD_CARD_ERROR_READ_TIMEOUT;
			goto fail;
		}
	}
	if (status_ != STATUS_START_BLOCK)
	{
		mmc__errorCode = SD_CARD_ERROR_READ;
		goto fail;
	}
	return true;

fail:
	digitalWrite(SD_SS,HIGH);
	return false;
}

uint8_t setSckRate(uint8_t _speed)
{
	//whatever - olduino can't change spi clock speed
	return true;
}

uint8_t mmc_initialize(uint8_t speed)
{
	uint16_t t0 =10; //explicit retry count
	uint32_t arg;
	uint8_t status_,i;
	digitalWrite(SD_SS, HIGH); // set sd card's slave select high
	for (i = 0; i < 10; i++) spiSend(0XFF);	//send clocks to put it in spi mode

	digitalWrite(SD_SS, LOW); // set sd card's slave select low
	while ((status_ = mmc_cardCommand(GO_IDLE_STATE, 0)) != STATUS_IN_IDLE)
	{	//printf("%d\n",t0);
		if (!(t0--))
		{
			mmc__errorCode = SD_CARD_ERROR_CMD0;
			goto fail;
		}
	}

	mmc__card_type = SD_CARD_TYPE_SD1;	// check SD version

	// initialize card
	arg=0;
	t0=255;	//restart timeout
	while ((status_ = mmc_cardAcmd(SD_SEND_OP_COND, arg)) != STATUS_READY)
	{
		// check for timeout
		if (!(t0--))
		{
			mmc__errorCode = SD_CARD_ERROR_ACMD41;
			goto fail;
		}
	}
	digitalWrite(SD_SS, HIGH); // set sd card's slave select high

	return setSckRate(speed);;

fail:
	digitalWrite(SD_SS, HIGH); // set sd card's slave select high
	return mmc__errorCode;
}

byte mmc_readSector(byte *buffer, uint32_t sector)
{
	uint8_t status_, tries;
	uint16_t i;
	//printf("Sector %ld...\n",sector);
	if (mmc__card_type != SD_CARD_TYPE_SDHC)	sector <<= 9;

	tries=0;
	status_ = mmc_cardCommand(READ_SINGLE_BLOCK, sector);

	while ((status_) && (tries<SD_READ_RETRIES))
	{
		status_ = mmc_cardCommand(READ_SINGLE_BLOCK, sector);
	}
	if (status_)
	{
		mmc__errorCode = SD_CARD_ERROR_CMD17;
		goto fail;
	}

	status_ = mmc_waitStartBlock();
	if (!status_)
	{
		mmc__errorCode=status_;
		goto fail;
	}

	spiReceiveN(buffer,512); //read the block into the buffer

	digitalWrite(SD_SS,HIGH);
	//printf("...Read\n");

	return RES_OK;

fail:
	digitalWrite(SD_SS,HIGH);
	return mmc__errorCode;
}

byte mmc_writeSector(const byte *buffer, uint32_t sector)
{
	uint8_t status_; uint16_t i;

	if (mmc__card_type != SD_CARD_TYPE_SDHC) sector <<= 9;

	if (mmc_cardCommand(WRITE_BLOCK, sector))
	{
		mmc__errorCode = SD_CARD_ERROR_CMD24;
		goto fail;
	}

	spiSend(DATA_START_BLOCK);

	for (i = 0; i < 512; i += 2)
	{
		spiSend(buffer[i]);
		spiSend(buffer[i+1]);
	}


	spiSend(0xff);  // dummy crc
	spiSend(0xff);  // dummy crc

	status_ = spiRec();
	if ((status_ & DATA_RES_MASK) != DATA_RES_ACCEPTED)
	{
		mmc__errorCode = SD_CARD_ERROR_WRITE;
		goto fail;
	}

	// wait for flash programming to complete
	if (!waitNotBusy(SD_WRITE_TIMEOUT))
	{
		mmc__errorCode = SD_CARD_ERROR_WRITE_TIMEOUT;
		goto fail;
	}
	// response is r2 so get and check two bytes for nonzero
	if (mmc_cardCommand(SEND_STATUS, 0) || spiRec())
	{
		mmc__errorCode = SD_CARD_ERROR_WRITE_PROGRAMMING;
		goto fail;
	}
	digitalWrite(SD_SS,HIGH);
	return RES_OK;

fail:
	digitalWrite(SD_SS,HIGH);
	return mmc__errorCode;
}

void mmc_setSSpin(const uint8_t _pin)
{
//whatever - olduino can't change pins	_SS=_pin;
}
