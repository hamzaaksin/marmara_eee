    #include <stdio.h>
    int main(){
        int i,numberofelements;
        float sum=0.0 , average;

        scanf("%d",&numberofelements );

        float numbers[numberofelements];//önce kümenin eleman sayýsýný aldým daha sonra kümeyi[eleman sayýsýyla] tanýmladým.

        for(i=0; i< numberofelements; ++i ){
            scanf("%f",&numbers[i]);
            sum= numbers[i]+sum;
        }
        average= sum/numberofelements;
        printf("%.1f", average);

        return 0;
    }
