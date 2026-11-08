#include <stdio.h>
#include <stdlib.h>

int main()
{
    char name[20];
    printf("Enter your name: ");

    //boþluktan sonra okuma yapmadýðý için "scanf" fonskiyonunu kullanmadýk.
    fgets(name, 20, stdin);

    printf("Your name is %s ", name);
    //"fgets" fonksiyonu'%s'den sonra herhangi bir þey yazýldýðýnda aþaðý yeni bir satýrda yazdýrýr"

    /*
    printf("Your name is %s klm", name);
    */
    return 0;
}
