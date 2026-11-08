#include <stdio.h>
#include <stdlib.h>
//30 tane tam sayý tutan dizi
//1000-2000 arasýnda bir deðer atanacak
// yüzler basamaðý  3 veya 5 olan sayýlarýn toplamý ve adeti
int main()
{
   int sayilar[30];
   int i;
   int toplam=0;
   int sayac=0;

    srand(time(NULL));  // her çalýþtýrmamýza farklý sayýlar seçmemizi saðlýyor


   for(i=0;i<30;i++){
     sayilar[i]= rand() % 1001;
     printf("%d ", sayilar[i]);


        if((sayilar[i] % 1000) / 100 == 3 ||  (sayilar[i] % 1000) / 100 == 5);
        toplam = toplam + sayilar[i];
        sayac++;
   }

   printf("\n%d tane sayinin toplami: %d",sayac ,toplam);
       return 0;
}
