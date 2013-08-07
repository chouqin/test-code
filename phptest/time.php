<?php

//var_dump(time(), time() * 1000);
//echo date('j', time()) . "\n";
//echo date('G', time()) . "\n";
//echo date('i', time()) . "\n";
$hourage = floor((time() - 1375427944) / 3600);
$pow = pow($hourage + 2, 1.8);
var_dump($hourage, $pow, (double)1 / $pow);
//echo (double)1 / pow( 1.8);
