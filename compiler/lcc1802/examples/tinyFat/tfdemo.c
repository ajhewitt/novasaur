#include <nstdint.h>
#include <olduino.h>
#include <nstdlib.h>
#include <hspi2.h>
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

void main(){
	unsigned int rc,i,result;
	char textBuffer[81];
	_directory_entry mainDE;
		//char filename[9];
		//char fileext[4];
		//byte attributes;
		//uint16_t time;
		//uint16_t date;
		//uint16_t startCluster;
		//uint32_t fileSize;

	printf("tinyFat demo\n");
	construct_tinyFat();
	rc=tF_initFAT(42); //speed param is meaningless
  if (rc!=NO_ERROR)
  {
    printf("***** ERROR: %d\n",rc);
    printf("%s\n",verboseError(rc));
    while (true) {};
  }
//list all files on card
    printf("Listing Files...\n");
    rc = tF_findFirstFile(&DE);
    if (rc==NO_ERROR)
    {
  	printf("%s",DE.filename);
  	printf(".");
  	printf("%s",DE.fileext);
  	printf("   Size: ");
  	printf("%ld\n",DE.fileSize);
    }
    else
    {
  	printf("No files found...\n");
    }
    while (rc==NO_ERROR)
    {
  	rc = tf_findNextFile(&DE);
  	if (rc==NO_ERROR)
  	{
  	  printf("%s",DE.filename);
  	  printf(".");
  	  printf("%s",DE.fileext);
  	  printf("   Size: ");
  	  printf("%ld\n",DE.fileSize);
  	}
    }
    printf("\n");
//print contents of testfile.txt
	printf("examining testfile.txt\n");
  	if (tF_exists("testfile.txt"))
  	{
    rc=tF_openFile("testfile.txt", FILEMODE_TEXT_READ);
    if (rc==NO_ERROR)
    {
      result=0;
      while ((result!=EOF) && (result!=FILE_IS_EMPTY))
      {
        result=tF_readLn(textBuffer, 80);
        if (result!=FILE_IS_EMPTY)
        {
          if (result==BUFFER_OVERFLOW)
            printf("%s",textBuffer);
          else
            printf("%s\n",textBuffer);
        }
        else{
          printf("** ERROR: File is empty...\n");
		}
      }
      printf("\n");

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
    printf("** ERROR: 'testfile.txt' is not on the card...");
  }
  printf("\nAnd we're done\n");
}
#include <olduino.c>
#include <nstdlib.c>
#include "mmc.c"
#include "hspi2.c"
#include "tinyFat.c"
