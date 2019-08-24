/* ***********************************************************************
**
**  Copyright (C) 2006  Jesper Hansen <jesper@redegg.net> 
**
**
**  Interface functions for MMC/SD cards
**
**  File mmc_if.h
**
*************************************************************************
**
**  This program is free software; you can redistribute it and/or
**  modify it under the terms of the GNU General Public License
**  as published by the Free Software Foundation; either version 2
**  of the License, or (at your option) any later version.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License
**  along with this program; if not, write to the Free Software Foundation, 
**  Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
**
*************************************************************************/

#ifndef __MMC_IF_H__
#define __MMC_IF_H__


#define SPI_PORT    PORTB
#define SPI_DDR     DDRB
#define SPI_PIN     PINB

#define MMC_CS_PORT PORTB
#define MMC_CS_DIR  DDRB


#define SD_SCK      1   
#define SD_CMD      2
#define SD_DAT0     3
#define SD_DAT3     4
#define SD_DAT1     5
#define SD_DAT2     6
#define SD_CARD     7


#if defined(__AVR_ATmega8__) || defined(__AVR_ATmega48__) || defined(__AVR_ATmega88__) || \
    defined(__AVR_ATmega16__) || defined(__AVR_ATmega32__) || defined(__AVR_ATmega162__) 

#define MMC_SCK     5
#define MMC_MOSI    3
#define MMC_MISO    4
#define MMC_CS      2

#elif defined(__AVR_ATmega64__)  || defined(__AVR_ATmega128__) 

#define MMC_SCK     1
#define MMC_MOSI    2
#define MMC_MISO    3
#define MMC_CS      0

#else
//
// unsupported type
//
#error "Processor type not supported in mmc_if.h !"
#endif




struct u16bytes
{
    uint8_t low;    
    uint8_t high;   
};

union u16convert
{
    uint16_t value;         
    struct u16bytes bytes;  
};

struct u32bytes
{
    uint8_t byte1;  
    uint8_t byte2;  
    uint8_t byte3;  
    uint8_t byte4;  
};

struct u32words
{
    uint16_t low;       
    uint16_t high;      
};

union u32convert 
{
    uint32_t value;         
    struct u32words words;  
    struct u32bytes bytes;  
};






int mmc_readsector(uint32_t lba, uint8_t *buffer);


uint8_t mmc_init(void);

#endif
