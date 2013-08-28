#include <iostream>
#include <test_header.h>

using namespace std;

int main()
{
    cout << inline_func() << endl;

    Test a;

    cout << a.test_inline() << endl;
    return 0;
}
