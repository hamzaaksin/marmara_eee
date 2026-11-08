#include <stdio.h>

int main()
{
    void printreverselongest(char str[]);
    char str[100];

    fgets(str, sizeof(str),stdin );

    printreverselongest(str);



    return 0;
}
