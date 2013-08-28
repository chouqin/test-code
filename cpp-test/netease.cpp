#include <iostream>

//test function overload
void foo(const int * a)
{
    std::cout << "call foo" << std::endl;
}

//void g(int i)
//{
    //foo(i);
//}

void foo(double )
{
    std::cout << "call foo 2" << std::endl;
}

int main()
{
    foo(NULL); //会出现错误，因为从NULL到int*的转换和从0到double的等级转换一样的

    return 0;
}

// still error: call foo(0) is ambiguous(compile)
//




//test reference variable
//
//void foo(const int & a)
//{
    //std::cout << "here" << std::endl;
//}

//int main()
//{
    //foo(0);

    //return 0;
//}

// compile error: if don't `const`
// can't cast rvalue to non-const reference
//




//test char '\0'
//

//void foo(const char * p)
////non-const pointer to const pointer: no warning
////const ==> non-const has warning
//{
    //std::cout << p[5] << std::endl;
//}

//int main()
//{
    //const char *p = "12345";
    ////char *p = "12345"; //string constant to 'char *' has warning
    //foo(p);
    ////std::cout << '\0' << std::endl;

    //return 0;
//}
