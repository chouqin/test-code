<?php

class Test {

}

$a = new Test();
$a->c = 1;
var_dump($a);

$b = clone $a;
$a->c = 2;
var_dump($b);
var_dump($a);
