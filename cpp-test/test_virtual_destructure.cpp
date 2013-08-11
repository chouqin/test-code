#include <iostream>
using namespace std;

class Base {

    private:
    int a;

    public:

    Base()
    {
        cout << "Constructing Base" << endl;
        a = 3;
    }

    virtual void print()
    {
        cout << "Call print on base: " << a << endl;
    }

    virtual ~Base()
    {
        cout << "Destroying Base" << endl;
    }
};

class Derived : public Base {

    private:
    int b;

    public:

    Derived(): Base()
    {
        cout << "Constructing Derived" << endl;
        b = 4;
    }

    void print()
    {
        Base::print();
        cout << "Call print on derived: " << b << endl;
    }

    ~Derived() { cout << "Deconstructing Derived" << endl; }

};


int main()
{

    Base * arr = new Derived[10];

    arr[0].print();
    arr[1].print(); //runtime error

    delete []arr; // runtime error

    return 0;
}
