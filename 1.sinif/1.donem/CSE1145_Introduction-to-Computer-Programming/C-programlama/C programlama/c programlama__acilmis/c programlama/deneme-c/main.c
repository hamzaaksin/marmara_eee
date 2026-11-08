#include <stdio.h>
#include <stdlib.h>

int main()
{
  char(nereden)[30]="Merhaba Ankara";
  char(nereye)[30]="";

  strncpy(nereye,nereden,9);
  printf("%c", nereye);



    return 0;
}
