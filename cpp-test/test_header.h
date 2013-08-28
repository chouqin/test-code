#ifndef TEST_HEADER_H
#define TEST_HEADER_H

inline int inline_func()
{
    return 1;
}

class Test {
    public:
    int test_inline() const;
};

inline int Test::test_inline() const
{
    return 5;
}


#endif
