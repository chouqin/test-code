#include <stdio.h>

int main()
{
    int a = 10;

    int b = a ?: 6;

    printf("%d\n", b);

    return 0;
}
