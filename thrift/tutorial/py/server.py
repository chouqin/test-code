# -*- coding=utf-8 -*-

# 先设置模块寻找路径path
import sys, glob
sys.path.append('../gen-py')
sys.path.insert(0, glob.glob('../../lib/py/build/lib.*')[0])

# 引入由tutorial.thrift生成的类
from tutorial import Calculator
from tutorial.ttypes import *

# 引入thrift的库
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

# 实现tutorial中定义的service
class CalculatorHandler:
  def __init__(self):
    self.log = {}

  def ping(self):
    print 'ping()'

  def add(self, n1, n2):
    print 'add(%d,%d)' % (n1, n2)
    return n1+n2

  def calculate(self, logid, work):
    print 'calculate(%d, %r)' % (logid, work)

    if work.op == Operation.ADD:
      val = work.num1 + work.num2
    elif work.op == Operation.SUBTRACT:
      val = work.num1 - work.num2
    elif work.op == Operation.MULTIPLY:
      val = work.num1 * work.num2
    elif work.op == Operation.DIVIDE:
      if work.num2 == 0:
        x = InvalidOperation()
        x.what = work.op
        x.why = 'Cannot divide by 0'
        raise x
      val = work.num1 / work.num2
    else:
      x = InvalidOperation()
      x.what = work.op
      x.why = 'Invalid operation'
      raise x

    log = SharedStruct()
    log.key = logid
    log.value = '%d' % (val)
    self.log[logid] = log

    return val

  def getStruct(self, key):
    print 'getStruct(%d)' % (key)
    return self.log[key]

  def zip(self):
    print 'zip()'

# 启动一个连接
handler = CalculatorHandler()
processor = Calculator.Processor(handler)
transport = TSocket.TServerSocket(port=9090)
tfactory = TTransport.TBufferedTransportFactory()
pfactory = TBinaryProtocol.TBinaryProtocolFactory()

# 启动server
server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)

print 'Starting the server...'
server.serve()
print 'done.'
