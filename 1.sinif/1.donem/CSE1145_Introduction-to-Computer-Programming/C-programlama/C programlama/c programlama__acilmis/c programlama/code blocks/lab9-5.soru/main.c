#include <stdio.h>
int main(){

    int i;
    int kume[5];

    for(i=0;i<5;++i){// "bu kodda" burada i++ kullansakta sonuç deðiþmeyecek ancak döngünün sonunda i deðeri farklý çýkacaktý. i++ kullansaydýk i deðeri, döngü sonunda 6 olacaktý. þimdi ise 5.
//diziler genellikle 0 dan baþladýðý için, bu döngü "i"yi 0 dan baþlatarak kullanýcýnýn
//girdiði deðerleri"küme" dizisine sýrasýyla atar
        scanf("%d", &kume[i]);
    }
    for(i=1; i<5; ++i){

            if(kume[0] < kume[i]) //küme[0] demek kümenin ilk elemaný anlamýna geliyor.
            kume[0] = kume[i]; // kümenin ilk elemanýyla "küme[0]"; i yi artýrarak sýrasýyla , 2.elemaný"küme[1]" ...
    } // bu döngü ise "küme"dizisinin en büyük elemanýný bulmak için kullanýlýr
    //ilk elemaný zaten"küme[0]" olarak belirlediðimiz için, bu döngü 'i' yi 1'den baþlatýr ve dizinin geri kalan elemanlarýný kontrol eder.
    printf("%d", kume[0]);

    return 0;
}
