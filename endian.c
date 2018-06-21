/*
 * Check endianness of machine
 * CS 240 (Fall 2016)
 * Author: Vihar Patel
 * 
*/

#include <stdio.h>

int isLittleEndian() {
 int a = 0x05;
  char * p = (char *) &a;
   if (*p==0x05) {
      return 1;
   }
        return 0;
}

main()
{
   if (isLittleEndian()) {
     printf("Machine is Little Endian\n");
     }
     else {
       printf("Machine is Big Endian\n");
	  }
 }
