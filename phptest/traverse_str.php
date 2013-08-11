<?php

$a = '我是中国人';
echo "$a\n";

for ($i = 0; $i < mb_strlen($a); ++$i) {
	$c = mb_substr($a, $i, 1);
	echo "$c\n";
}
