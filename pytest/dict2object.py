class Struct:
    def __init__(self, **entries):
        self.__dict__.update(entries)

if __name__ == "__main__":
    d = {'a' : 1, 'b' : 2}
    s = Struct(**d)
    print s.a, s.b
