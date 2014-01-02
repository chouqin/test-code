#include <iostream>


/**
 * Part 1: test using out of namespace
 */


//using std::cout;
//using std::endl;

//namespace Test {
    //// 如果在外面声明的using，在里面能够被调用
    //// 但是必须要保证在namespace声明之前
    //void print() {
        //cout << "using cout out of namespace" << endl;
    //}
//}

//int main() {
    //Test::print();

    //return 0;
//}


/**
 * Part 2: test using in namespace and call out of space
 */

namespace Test {
    using std::cout;
    using std::endl;
}

void print() {
    // 能够成功运行，在namespace里面的using的名称会被传到当前的namespace
    // 相当于当前的namespace有了这个名称。
    // 同样的，也必须在print函数声明之前声明using
    Test::cout << "using cout in namespace" << Test::endl;
}

int main() {
    print();

    return 0;
}


/**
 * Part 3：注意lookup rule, 这里就不测试了
 */
