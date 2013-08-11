#include<iostream>
using namespace std;

int main()
{
    int i = 0;
    int & r = i;
    int j = 1;
    r = j;

    return 0;
}
