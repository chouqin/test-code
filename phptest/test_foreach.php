<?php
$arr = array(
  array(1, 2, 3, 4),
  array(2, 3),
  array(1, 4)
);

foreach ($arr as $key => $a) {
  $arr[$key][] = 5;
}

print_r($arr);
