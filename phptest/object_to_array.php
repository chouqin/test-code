<?php

class Test {
  public $a;
  public $b;
}

$t = new Test();
$t->a = 3;
$t->b = "hello";

$a = get_object_vars($t);

print_r($a);
