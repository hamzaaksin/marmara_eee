#include <stdio.h>
void printArray(int a[], int size);
int main () {
    int i, n[100];
    int numOfElements;
    scanf("%d", &numOfElements);
    n[0]=1;
    for(i=1; i<numOfElements; i++)
        n[i]=n[i-2]*2;
    printArray(n, numOfElements);


    return 0;
}
void printArray(int a[], int size){
    int j;
    for (j=0; j<size; j++ )
        printf("%d ", a[j]);
}
