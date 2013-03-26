class Test:                                                                                                                                                                      

    def __init__(self, a=None, b=None):
        self.a = a 
        self.b = b 

if __name__ == "__main__":
    t1 = Test(
        a = 1,
        b = 2,
    )   
    print t1.a, t1.b

    t2 = Test()
    t2.a = 3 
    t2.b = 4 
    print t2.a, t2.b

    t3 = Test(
        a = 5,
    )   
    t3.b = 6 
    print t3.a, t3.b

