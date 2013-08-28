#include <stdio.h>
#include <string.h>

struct tab
{
    int id;
    float amount1;
    double amount;
    char name[30];
    char *description;
};

struct sdshdr {
    long len;
    long free;
    char buf[];
};

union data {
    int i;
    float f;
    char str[20];
};

int main()
{
    struct tab t;

    printf("%d %d %d %d %d\n",
            sizeof(t.id),
            sizeof(t.amount1),
            sizeof(t.name),
            sizeof(t.description),
            sizeof(t));
    /* 4 8 30 4 48*/

    printf("%d\n", sizeof(struct sdshdr));
    printf("%d\n", sizeof(union data));


    /*char * str;*/
    /*printf("%d\n", sizeof(str));*/

    /*str = "hello world!";*/
    /*printf("%d\n", sizeof(str));*/

    /*char str[20];*/
    /*printf("%d\n", sizeof(str));*/
    /*printf("%s\n", str); [>gabage value<]*/

    /*str = "hello world!";*/
    /*printf("%d\n", sizeof(str));*/

    /* 测试中文 */
    char *str = "中文中文";
    printf("%s %d %d\n", str, strlen(str), sizeof(str)); /*结果：中文中文*/

    unsigned int a;
    short b;
    long c;
    printf("%d %d %d\n", sizeof(a), sizeof(b), sizeof(c));
    /* 4 2 4*/

    return 0;
}
