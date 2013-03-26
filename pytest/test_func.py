import datetime


def add_date(day):
    day += datetime.timedelta(days=1)
    return day

def append_list(li):
    li.append(1)
    return li

def two_return():
    return 1, 2

if __name__ == "__main__":
    d1 = datetime.date(2012, 3, 14)
    d2 = add_date(d1)

    print d1, d2

    l1 = [2, 3]
    l2 = append_list(l1)
    print l1, l2

    a, b = two_return()
    print a, b
