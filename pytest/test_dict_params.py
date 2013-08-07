# -*- coding=utf-8 -*-

def foo(*args, **kargs): #kargs一定要在args之后
    print args, kargs

def bar(a, b):
    print a, b


def foo1(*args):
    print args


def bar1(a, b):
    print a, b

def foo3(a, b, *args, **kargs):
    print a, b, args, kargs

def foo4(a, b):
    print a, b

def foo5(**kargs):
    print kargs


if __name__ == "__main__":
    d = {'a': 1, 'b': 2}

    #foo(a=1, b=2, 1, 2) #同时在传参数时，命名参数之后不能再有非命名参数
    foo(1, 2, a=1, b=2)
    #foo(a=1, b=2)
    #foo(**d)
    #bar(**d)
    #bar(a=1, b=2)

    #l = [1, 2]
    #foo1(1, 2)
    #foo1(*l)
    #bar1(*l)

    #foo3(1, 2, 3, 4, a=5, b=6, c=7) #无论怎么样，首先把第一个参数给a赋值


    # 对比这两行发现：对于每一个传进来的参数，如果是不指定名称的参数，那么按照顺序给变量赋值，
    # 如果是指定名称的参数，那么给相应名称的变量赋值
    # 最后剩下的参数，先给带有默认值的变量命名，再给*args或**kargs命名
    # 所以，默认参数要放在非默认参数之后，*args和**kargs要放在最后
    # 如果多了参数，会报错
    #foo4(b=2, a=1)
    #foo4(2, a=1)
    #foo4(a=1, 2)
