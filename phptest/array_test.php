<?php

// test array merge
//$a = array("a", "b");
//$b = array("c", "d");
//$c = array_merge($a, $b);
//print_r($c);

// test bool
//$a = array();
//$b = null;
//$c = 0;

//if ($a) {
  //print "hehe\n";
//}

//if ($b) {
  //print "hehe\n";
//}

//if ($c) {
  //print "hehe\n";
//}
//

//test new class with name
class Test {
  public function a() {
    print "hello world\n";
  }
}

$var = "Test";
$t = new $var();
$t->a();
