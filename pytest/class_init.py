# -*- coding=utf-8 -*-

class A:
    def __init__(self, a):
        self.a = a


class B(A):
    pass


b = B(1)
print b.a
