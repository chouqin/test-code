#!/usr/bin/env php
<?php

namespace tutorial\php;

error_reporting(E_ALL);


/**
 * 先引入Thrift类库的代码
 * */
require_once __DIR__.'/../../lib/php/lib/Thrift/ClassLoader/ThriftClassLoader.php';

use Thrift\ClassLoader\ThriftClassLoader;

/**
 * 再引入由tutorial.thrift生成的类
 * */
$GEN_DIR = realpath(dirname(__FILE__).'/..').'/gen-php';

$loader = new ThriftClassLoader();
$loader->registerNamespace('Thrift', __DIR__ . '/../../lib/php/lib');
$loader->registerDefinition('tutorial', $GEN_DIR);
$loader->register();

use Thrift\Protocol\TBinaryProtocol;
use Thrift\Transport\TSocket;
use Thrift\Transport\THttpClient;
use Thrift\Transport\TBufferedTransport;
use Thrift\Exception\TException;


/**
 * 调用Server实现的Service
 */
try {
  /**
   * 新建一个client
   * */
  $socket = new TSocket('localhost', 9090);
  $transport = new TBufferedTransport($socket, 1024, 1024);
  $protocol = new TBinaryProtocol($transport);
  $client = new \tutorial\CalculatorClient($protocol);

  $transport->open();

  // 测试ping
  $client->ping();
  print "ping()\n";

  // 测试add
  $sum = $client->add(1,1);
  print "1+1=$sum\n";

  // 测试calculate
  $work = new \tutorial\Work();

  $work->op = \tutorial\Operation::DIVIDE;
  $work->num1 = 1;
  $work->num2 = 0;

  try {
    $client->calculate(1, $work);
    print "Whoa! We can divide by zero?\n";
  } catch (\tutorial\InvalidOperation $io) {
    print "InvalidOperation: $io->why\n";
  }

  $work->op = \tutorial\Operation::SUBTRACT;
  $work->num1 = 15;
  $work->num2 = 10;
  $diff = $client->calculate(1, $work);
  print "15-10=$diff\n";

  // 测试getStruct
  $log = $client->getStruct(1);
  print "Log: $log->value\n";

  $transport->close();

} catch (TException $tx) {
  print 'TException: '.$tx->getMessage()."\n";
}

?>
