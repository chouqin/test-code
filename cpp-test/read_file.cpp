#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;

int main() {
    //char * arr = new char[15];
    //memset(arr, 0, 15);
    //strcpy(arr, "This is a test");
    //string str;
    ////  You can also assign directly to a string.
    //str = arr;
    //delete [] arr;
    //cout << str << endl;
    //return 0;
    //
    //
    //ofstream out("test.txt");
    //out.seekp(100);
    //string text = "Text";
    //const char *p = text.c_str();
    //out.write(p, text.size());
    //out.close();
    //
    //
    ifstream in("test.txt");
    string str;
    in.seekg(100);
    char * buffer = new char[4];
    in.read(buffer, 4);
    str = buffer;
    delete []buffer;
    cout << str << endl;
}
