#include <stdio.h>
#include <string.h>

int main () {

   char str1[20] = "Hello";
   char str2[20] = "World";
   char str3[]="";
   int  len;

   // copy str1 into str3
   strcpy(str3, str1);

   printf("The copied str3 is: %s\n", str3);


   // concatenate str1 and str2 and assign result to str3
   // note that str3 has already contents of str1
    strcat(str3, str2);

   printf("The concatenated str3 is: %s\n", str3);

   // print total length of str3 after concatenation
   len = strlen(str3);
   printf("The length of str3: %d\n", len);

   return 0;
}
