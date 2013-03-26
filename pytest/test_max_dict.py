if __name__ == "__main__":
    di = {}
    s = "sssssssssssssssssssssssssssssssss";

    for i in range(100000):
        di[(i, i+1, i+2, i+3)] = s

    for k in di:
        print k, di[k]
