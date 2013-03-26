import json

class Struct():

    def __init__(self, a, b):
        self.a = a
        self.b = b

    #def
#s2 = Struct(2, 3)
s1 = Struct(1, [2, 3])

#print s1.a, s2.a
#print s1.__dict__
d1 = s1.__dict__
#j1 = json.dumps(s1)
#d2 = s2.__dict__

print d1
#print j1
print type(Struct(**d1).b)
