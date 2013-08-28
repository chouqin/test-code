#include <iostream>

using namespace std;

enum e {
    x = 1,
    y = 2,
    z = 4,
    w = 8,
};

int main()
{
    e flag = e(5);

    switch(flag) {
    case x:
        cout << "flag = x" << endl;
        break;
    case y:
        cout << "flag = y" << endl;
        break;
    case z:
        cout << "flag = z" << endl;
        break;
    case w:
        cout << "flag = w" << endl;
        break;
    default:
        cout << "flag = no of those enum" << endl; //go to this branch
    }

    int i = flag;
    cout << "i = " << i << endl;

    return 0;
}
