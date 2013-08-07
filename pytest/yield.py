# -*- coding=utf-8 -*-

import random

def get_data():
    """Return 3 random integers between 0 and 9"""
    return random.sample(range(10), 3)


# 通过function.send()向有yield的函数发送data

def consume():
    """Displays a running average across lists of integers sent to it"""
    running_sum = 0
    data_items_seen = 0

    while True:
        data = yield
        print('Consume {}'.format(data))
        data_items_seen += len(data)
        running_sum += sum(data)
        print('The running average is {}'.format(running_sum / float(data_items_seen)))

def produce(consumer):
    """Produces a set of values and forwards them to the pre-defined consumer
    function"""
    #while True:
    data = get_data()
    print('Produced {}'.format(data))
    consumer.send(data)
        #yield

def gen():
    a = yield 5
    yield a

if __name__ == '__main__':
    consumer = consume()
    consumer.send(None)
    #producer = produce(consumer)

    for _ in range(10):
        print('Producing...')
        produce(consumer)
        #print 'next result:', next(producer)

    consumer.send([1, 2, 3])

    for i in gen():
        print i
