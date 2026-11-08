#include<stdio.h>

int main(){
    int n1,n2,n3;
    
    scanf("%d%d%d", &n1, &n2, &n3);
    
    
    
    printf("%d == %d is %d\n",n1, n2, n1 == n2);  // printf("%d",n1 == n2) == kısmıyla bu eşitliğin doğru mu (0) yoksa yanlış mı(1) olduğunu kontrol eder. 
    printf("%d == %d is %d\n",n1, n3, n1 == n3);
    
    printf("%d > %d is %d\n", n1, n2, n1 > n2);
    printf("%d > %d is %d\n", n1, n3, n1>n3);
    
    printf("%d < %d is %d\n", n1, n2, n1 < n2);
    printf("%d < %d is %d\n", n1, n3, n1< n3);
    
    printf("%d != %d is %d\n", n1, n2, n1 != n2);
    printf("%d != %d is %d\n", n1, n3, n1 != n3);
    
    printf("%d >= %d is %d\n", n1, n2, n1 >= n2);
    printf("%d >= %d is %d\n", n1, n3, n1 >= n3);
    
    printf("%d <= %d is %d\n", n1, n2, n1 <= n2);
    printf("%d <= %d is %d\n", n1, n3, n1 <= n3);
    return 0;
}