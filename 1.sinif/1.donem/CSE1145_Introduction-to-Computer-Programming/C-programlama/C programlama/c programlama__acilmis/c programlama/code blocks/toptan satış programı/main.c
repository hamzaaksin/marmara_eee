#include <stdio.h>
#include <stdlib.h>

int main()
{

  //0-150 tane = 1.5 TL
   // 151-250 tane = 1 TL
  // 251-400 tane = 0.75 TL
   //401-  tane =0.25 TL
   int number;
   float price;
   printf("Almak istediginiz adedi giriniz: ");
   scanf("%d", &number);


   if(number>400) {
    price = 0.25;

    }

   else if(number<=400 && number>250){
    price = 0.75;

   }
    else if(number<=250 && number>150){
    price = 1;

    }
   else if (number<=150 && number>0){
    price = 1.5;

   }
   else{
    printf("Please enter valid number\n");
   }



printf("Your number is %d, Price is %.1f TL", number, number*price);

    return 0;
}
