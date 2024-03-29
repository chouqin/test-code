#include <stdio.h>

void function_with_pointer_args(int * p);
void function_with_array_args(int a []);

int main()
{
    /*int i = 5, *p;*/

    /*p = &i;*/

    /*printf("p[0] is %d\n", p[0]);*/
    /*p[0] is equal to *p*/

    /*int a[] = {1, 2, 3};*/
    /*a = p; [>this line is illegal<]*/
    /*printf("a[0] is %d\n", a[0]);*/

    /*int a[] = {1, 2, 3};*/
    /*[>const int *p = a;<]*/
    /*int *p = a;*/
    /*p[0] = 5;*/
    /*printf("p[0] is %d\n", p[0]);*/

    /*char amessage[] = "now is the time"; [> an array <]*/
    /*char *pmessage = "now is the time"; [> a pointer, has warning in cpp<]*/

    /*printf("pmessage is %s\n", pmessage);*/
    /*[>pmessage[0] = 'N'; [> segment fault<]<]*/
    /*amessage[0] = 'N';*/
    /*printf("pmessage is %s\n", amessage);*/

    /*
     *所以array和pointer的区别是array不能被赋值，
     *而pointer不能通过p[i]修改(这个是否只对于string类型适用？是的，因为只有string才能声明字符串常量，
     *其他类型的不能直接声明常量数组，常量字符串不是保存在栈中的，所以修改它会造成segment fault,
     *因此在C++中强制声明指向字符串常量的指针是const的)
     */

    int a[] = {1, 2, 3, 4, 5};
    int *p = &a[1];

    function_with_array_args(a);
    function_with_pointer_args(p);
    /*
     *从这两个函数可以看出函数的参数被声明为指针和数组是完全一样的，
     *除了指针可以被声明为常量之外，没有什么不一样。
     */

    return 0;
}

void function_with_pointer_args(int * p)
{
    printf("p[0] is %d\n", p[0]);
    int a = 5;
    p = &a;
    printf("p[0] is %d\n", p[0]);
}

void function_with_array_args(int a [])
{
    printf("a[0] is %d\n", *a);
    int t = 5;
    a = &t;
    printf("a[0] is %d\n", *a);
}
