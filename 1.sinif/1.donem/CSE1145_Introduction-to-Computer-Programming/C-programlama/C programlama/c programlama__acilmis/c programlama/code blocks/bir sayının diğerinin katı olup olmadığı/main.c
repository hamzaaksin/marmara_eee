#include <stdio.h>
#include <stdlib.h>

int main()
{

    int a,b;

    printf("Sirasiyla buyuk ve kucuk sayilari giriniz\n");
    scanf("%d %d", &a, &b);

    //c= a / b ;

//c kaç katý olduðunu
//d tam bölünüp bölünmediðini
if(a % b == 0){
    printf("bu  sayilar birbirinin tam katidir");
    }
else {
    printf("kati degildir");
    }

    return 0;
}
