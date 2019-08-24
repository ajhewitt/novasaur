/* ***********************************************************************
**
**  Copyright (C) 2006  Jesper Hansen <jesper@redegg.net> 
**
**
**  Simple MMC/SD card example
**
**  File sd_breakout_demo.c
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

#include <avr/io.h>
#include <inttypes.h>
#include <stdio.h>
#include <ctype.h>

#include "uart.h"
#include "mmc_if.h"



void dump(uint8_t * p, uint16_t len)
{
    int i,j;

    for (i=0;i<len/16;i++)
    {
        printf("%04x  ",i*16);
        for (j=0;j<16;j++)
            printf("%02x ",p[i*16+j]);
        printf("  ");
        for (j=0;j<16;j++)
            printf("%c", isalpha(p[i*16+j]) ? p[i*16+j] : '.');
        printf("\n");
    }
}



int main(void)
{
    uint32_t sector = 0;
    uint8_t sectorbuffer[512];

    //
    // init the uart
    //
    uart_init();

    //
    // setup callbacks for stdio use
    //
    fdevopen(uart_putchar,uart_getchar,0);

    //
    // say hello
    //
    printf("\n\n**  mmc_demo is alive. **\n");

    //
    // init mmc card and report status
    //
    printf("mmc_init returns %d\n", mmc_init() );

    //
    // main loop
    //  
    while (1)
    {
        printf("\nsector %ld\n",sector);        // show sector number
        mmc_readsector(sector,sectorbuffer);    // read a data sector
        dump(sectorbuffer,512);                 // dump sector contents
    
        //
        // get user keypress
        //
        switch (getchar())
        {
            case '-' :              // if '-' key
                if (sector > 0)     // and sectornumber > 0
                    sector--;       // decrement sectornumber   
                break;

            case '+' :              // if '+' key
                sector++;           // increment sector number
                break;
        }
    }

}

