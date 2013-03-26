#include <stdio.h>
#include <string.h>

void int_to_float();

int main()
{
    char str[5];
    int i = 0;

    for (; i < 5; ++i) {
        str[i] = i - 0 + '0';
    }

    printf("the str is %s\n", str);

    int j = 0; /*just to test if this declaration is legal*/
    printf("j is %d\n", j);

    int_to_float();

    return 0;
}

void int_to_float()
{
    int a = 1;
    float b;

    b = a;

    b = 3.4;
    a = b;

    /*没有编译的warning和运行的warning
     *说明它们之间会隐式进行转换，至于变成什么值，应该很容易知道。
     */
}
