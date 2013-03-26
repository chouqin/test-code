<?php
$arr1 = array(1, 2, 3, 4, 5, 6);
$arr2 = array(2, 3, 9, 7, 1);

$result = array_diff($arr1, $arr2);
print_r($result);
echo count($result);
