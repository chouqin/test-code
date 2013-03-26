<?php

class Test {
  public static function test1($p) {
    echo "hello!";
    echo $p;
    echo "\n";
    echo __FUNCTION__;
    echo __CLASS__;
  }
}

//call_user_func("Test::test1", "world");

function test_call($func, $args) {
  call_user_func($func, $args);
}

test_call("Test::test1", "world");
