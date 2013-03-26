def foo(**args):
    print args


def bar(a, b):
    print a, b


def foo1(*args):
    print args


def bar1(a, b):
    print a, b

if __name__ == "__main__":
    d = {'a': 1, 'b': 2}

    foo(a=1, b=2)
    foo(**d)
    bar(**d)
    bar(a=1, b=2)

    l = [1, 2]
    foo1(1, 2)
    foo1(*l)
    bar1(*l)
