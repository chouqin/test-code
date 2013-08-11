#include <stdio.h>

int main()
{
    int x = 1;

    {
        int x;
        x = 2;
        printf("x is %d\n", x);
    }

    printf("x is %d\n", x);

    return 0;
}

//所以C也有块级作用域，只是不能在循环中声明变量罢了
