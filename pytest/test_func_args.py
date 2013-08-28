# -*- coding=utf-8 -*-

# a dict value can be changed by a call of function, so as a list
#def test(di):
    #di['a'] = 3

def test_1(a):
    print a

def test_2(a):
    test_1(a=a)

if __name__ == "__main__":
    #di = {"a": 2}
    #test(di)
    #print di

    test_2(3)
