<?php
//$arr = array();

////for ($i = 0; $i < 100000000; ++$i) {
  ////$arr[] = False;
////}

//$arr = array();
for ($i = 0; $i < 100000; ++$i) {
  $num = rand(0, 100000000);

  while (isset($arr[$num])) {
    $num = rand(0, 100000000);
  }

  $arr[$num] = True;
  echo "$num\n";
}

function getStringByInt($value, $length = 10) {
  $str = strval($value);
  $sublen = $length - strlen($str);

  for($i = 0; $i < $sublen; ++$i) {
    $str = "0" . $str;
  }

  return $str;
}

echo getStringByInt(1234567890);
echo "\n";
