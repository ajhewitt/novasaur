#include <nstdint.h>
#include <olduino.h>
#include <nstdlib.h>
#include <hspi2.h>
#include <hspi2Lcd.h>
#include "tinyFAT.h"
#include "mmc.h"
#define nofloats

char *verboseError(byte err)
{
	switch (err)
	{
	case ERROR_MBR_READ_ERROR:
		return "Error reading MBR";
		break;
	case ERROR_MBR_SIGNATURE:
		return "MBR Signature error";
		break;
	case ERROR_MBR_INVALID_FS:
		return "Unsupported filesystem";
		break;
	case ERROR_BOOTSEC_READ_ERROR:
		return "Error reading Boot Sector";
		break;
	case ERROR_BOOTSEC_SIGNATURE:
		return "Boot Sector Signature error";
		break;
	default:
		return "Unknown error";
		break;
	}
}
void animate(unsigned char * image,unsigned int first,unsigned int last){
			//image location, 1st line to roll, last line to roll
	unsigned int line,offset;
	for (offset=0;offset<84;offset++){
		for (line=first;line<=last;line++){
			gotoXY(0,line); //position to 1st line to animate
			digitalWrite(lcdcmd,LCD_D); //get out of command mode
			LcdWriteN(image+line*84+offset,84-offset);
			if (offset>0){
				LcdWriteN(image+line*84,offset);
			}
		}
	}
}
void main(){
	unsigned int rc,i,result;
	char textBuffer[81];
	_directory_entry mainDE;
	char gfile[]="SANTA.BIN";
	PIN4=0;

	printf("tinyFat/LCD demo\n");
	construct_tinyFat();
	rc=tF_initFAT(42); //speed param is meaningless
  	if (rc!=NO_ERROR){
		printf("***** ERROR: %d\n",rc);
		printf("%s\n",verboseError(rc));
		while (true) {};
	}

	printf("looking for graphic file %s\n",gfile);
  	if (tF_exists(gfile))
  	{
    rc=tF_openFile(gfile, FILEMODE_BINARY);
    if (rc==NO_ERROR)
    {
	  printf("reading file\n");
	  result=tF_readBinary();
	  printf("displaying file on LCD\n");
	  setqon();
	  LcdInitialise();
	  setqoff();
	  LcdClear();
	  LcdWriteN(buffer,504);
	  delay(1000);
	  while(1)
	  	animate(buffer,0,4);

      tF_closeFile();
    }
    else
    {
      switch(rc)
      {
        case ERROR_ANOTHER_FILE_OPEN:
          printf("** ERROR: Another file is already open...");
          break;
        default:
          printf("** ERROR: ");
          printf("%x\n",rc);
          break;
      }
    }
  }
  else{
    printf("** ERROR: %s is not on the card...",gfile);
  }
  printf("\nAnd we're done\n");
}
#include <olduino.c>
#include <nstdlib.c>
#include "mmc.c"
#include <hspi2.c>
#include <hspi2Lcd.c>
#include "tinyFat.c"
