<?php

$a = '2012-12-04_12:04';
$b = str_replace('_', ' ', $a);
var_dump($b);
var_dump(date("Y-m-d H:i:s", strtotime($b)));
