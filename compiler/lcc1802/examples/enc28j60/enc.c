 //february 28 2013 change to packet receive because incoming data is little-endian
 void enableChip () {
  digitalWrite(sck,LOW); //make sure the clock is low
  asm("	req	;0 on Q activates ethernet chip\n"); //digitalWrite(encss,LOW); //activate the chip select
}

 void disableChip () {
  asm("	seq	;1 on Q de-activates ethernet chip\n"); //digitalWrite(encss,HIGH); //deactivate the chip select
}

 void SetBank (uint8_t address) {
  if ((address & BANK_MASK) != Enc28j60Bank) {
    writeOp(ENC28J60_BIT_FIELD_CLR, ECON1, ECON1_BSEL1|ECON1_BSEL0);
    Enc28j60Bank = address & BANK_MASK;
    writeOp(ENC28J60_BIT_FIELD_SET, ECON1, Enc28j60Bank>>5);
  }
}
uint8_t xferSPI(uint8_t value){
  int i;

  for(i=0;i<8;i++){
    digitalWrite(mosi,(value&0x80));      //by setting mosi for each bit
    value=(value<<1)|digitalRead(miso);;
    digitalWrite(sck,HIGH);              //then pulsing the clock
    digitalWrite(sck,LOW);
  }
  return value;
}

uint8_t readOp(uint8_t op,uint8_t address){
  uint8_t result;
  enableChip();
  xferSPI(op | (address & ADDR_MASK));
  if (address & 0x80)
    result=xferSPI(00);  //dummy byte if needed
  result=xferSPI(0x00); //then read the result
  disableChip();
  return result;
}
void writeOp(uint8_t op, uint8_t address, uint8_t data){
  int i;
  uint8_t temp, result;//code for econ1
  enableChip();
  xferSPI(op|(address& ADDR_MASK));
  xferSPI(data);
  disableChip();
}

 uint8_t readRegByte (uint8_t address) {
    SetBank(address);
    return readOp(ENC28J60_READ_CTRL_REG, address);
}
 void writeRegByte (uint8_t address, uint8_t data) {
    SetBank(address);
    writeOp(ENC28J60_WRITE_CTRL_REG, address, data);
}

 void writeReg(uint8_t address, uint16_t data) {
    writeRegByte(address, data);
    writeRegByte(address + 1, data >> 8);
}
 void writePhy (uint8_t address, uint16_t data) {
    writeRegByte(MIREGADR, address);
    writeReg(MIWR, data);
    while (readRegByte(MISTAT) & MISTAT_BUSY)
        ;
}


uint8_t ethbegin (const uint16_t size) {
	//printf(" ethbegin ");
  return encinitialize(size, mymac);
}
void encinitSPI () {
    digitalWrite(mosi, HIGH);
    digitalWrite(mosi, LOW);
    digitalWrite(sck, LOW);
}

uint8_t encinitialize (uint16_t size, const uint8_t* macaddr) {
    bufferSize = size;
    //printf(" encinitialize ");
    encinitSPI();
    disableChip();

    writeOp(ENC28J60_SOFT_RESET, 0, ENC28J60_SOFT_RESET);
    //printf(" writeop done ");

    while (!readOp(ENC28J60_READ_CTRL_REG, ESTAT) & ESTAT_CLKRDY)
        ;

    gNextPacketPtr = RXSTART_INIT;
    writeReg(ERXST, RXSTART_INIT);
    writeReg(ERXRDPT, RXSTART_INIT);
    writeReg(ERXND, RXSTOP_INIT);
    writeReg(ETXST, TXSTART_INIT);
    writeReg(ETXND, TXSTOP_INIT);
    writeRegByte(ERXFCON, ERXFCON_UCEN|ERXFCON_CRCEN|ERXFCON_PMEN);
    writeReg(EPMM0, 0x303f);
    writeReg(EPMCS, 0xf7f9);
    writeRegByte(MACON1, MACON1_MARXEN|MACON1_TXPAUS|MACON1_RXPAUS);
    writeRegByte(MACON2, 0x00);
    writeOp(ENC28J60_BIT_FIELD_SET, MACON3,
                        MACON3_PADCFG0|MACON3_TXCRCEN|MACON3_FRMLNEN);
    writeReg(MAIPG, 0x0C12);
    writeRegByte(MABBIPG, 0x12);
    writeReg(MAMXFL, MAX_FRAMELEN);
    writeRegByte(MAADR5, macaddr[0]);
    writeRegByte(MAADR4, macaddr[1]);
    writeRegByte(MAADR3, macaddr[2]);
    writeRegByte(MAADR2, macaddr[3]);
    writeRegByte(MAADR1, macaddr[4]);
    writeRegByte(MAADR0, macaddr[5]);
    writePhy(PHCON2, PHCON2_HDLDIS);
    SetBank(ECON1);
    writeOp(ENC28J60_BIT_FIELD_SET, EIE, EIE_INTIE|EIE_PKTIE);
    writeOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_RXEN);

    return readRegByte(EREVID);
}
uint16_t encpacketReceive() {
	struct {
		uint8_t nextPacketL,nextPacketH; //having to do this because the data from the enc seems to be little-endian!
		uint8_t byteCountL,byteCountH;
		uint8_t statusL,statusH;
	} header;
	uint16_t headernextPacket,headerbyteCount;
    uint16_t len = 0;
    if (readRegByte(EPKTCNT) > 0) {
        writeReg(ERDPT, gNextPacketPtr);
        //printf("\n gNextPacketPtr=%d\n",gNextPacketPtr);
        readBuf(sizeof header, (uint8_t*) &header);
        //hexDump((uint8_t*)&header,sizeof header);
        headernextPacket=header.nextPacketL+(header.nextPacketH<<8); //assemble next packet pointer
        headerbyteCount=header.byteCountL+(header.byteCountH<<8); //assemble byte count
        //printf("got a packet with nextPacketL=%X and nextPacketH=%X\n",header.nextPacketL,header.nextPacketH);
        //printf("got a packet with nextPacket=%d and byteCount=%d\n",headernextPacket,headerbyteCount);
        gNextPacketPtr  = headernextPacket;
        //printf("(header.statusL & 0x80)=%x\n",(header.statusL & 0x80));
        len = headerbyteCount - 4; //remove the CRC count
        if (len>bufferSize-1)
            len=bufferSize-1;
        if ((header.statusL & 0x80)==0)
            len = 0;
        else
            readBuf(len, buffer);
        buffer[len] = 0;
        if (gNextPacketPtr - 1 > RXSTOP_INIT)
            writeReg(ERXRDPT, RXSTOP_INIT);
        else
            writeReg(ERXRDPT, gNextPacketPtr - 1);
        writeOp(ENC28J60_BIT_FIELD_SET, ECON2, ECON2_PKTDEC);
    }
    return len;
}
 void readBuf(uint16_t len, uint8_t* data) {
    uint8_t x;
    enableChip();
    xferSPI(ENC28J60_READ_BUF_MEM);
    while (len--) {
        x=xferSPI(0x00);
        *data++ = x;
    }
    disableChip();
}
 void writeBuf(uint16_t len, const uint8_t* data) {
    enableChip();
    xferSPI(ENC28J60_WRITE_BUF_MEM);
    while (len--)
        xferSPI(*data++);
    disableChip();
}

void encpacketSend(uint16_t len) {
	//printf("sending a packet of length %d\n",len);
	//hexDump(buffer,len);
    while (readOp(ENC28J60_READ_CTRL_REG, ECON1) & ECON1_TXRTS)
        if (readRegByte(EIR) & EIR_TXERIF) {
            writeOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_TXRST);
            writeOp(ENC28J60_BIT_FIELD_CLR, ECON1, ECON1_TXRST);
        }
    writeReg(EWRPT, TXSTART_INIT);
    writeReg(ETXND, TXSTART_INIT+len);
    writeOp(ENC28J60_WRITE_BUF_MEM, 0, 0x00);
    writeBuf(len, buffer);
    writeOp(ENC28J60_BIT_FIELD_SET, ECON1, ECON1_TXRTS);
}
int isLinkUp() {
    return (readPhyByte(PHSTAT2) >> 2) & 1;
}
 uint16_t readPhyByte (uint8_t address) {
    writeRegByte(MIREGADR, address);
    writeRegByte(MICMD, MICMD_MIIRD);
    while (readRegByte(MISTAT) & MISTAT_BUSY)
        ;
    writeRegByte(MICMD, 0x00);
    return readRegByte(MIRD+1);
}


