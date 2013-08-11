#include <stdio.h>

int main()
{
    int n = 1;
    printf("%d\n", *(char *)&n);
    if (*(char *)&n == 1) {
        printf("Big Endian!\n");
    } else {
        printf("Little Endian!\n");
    }
}
