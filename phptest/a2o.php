<?php

class Object{

}

$a = new Object();
$a->b = 1;
$a->c = 2;

$arr = array();
foreach ($a as $key => $value) {
	$arr[$key] = $value;
}

var_dump($arr);
