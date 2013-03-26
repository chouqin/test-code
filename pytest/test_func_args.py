# -*- coding=utf-8 -*-

def test(di):
    di['a'] = 3

if __name__ == "__main__":
    di = {"a": 2}
    test(di)
    print di
