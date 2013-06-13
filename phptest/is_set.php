<?php

$a = array(
	'b' => 1,
	'c' => 2,
);

$d = isset($a['d']) ? $a['d'] : 1;
$d = $a['d'] ?: 1;
