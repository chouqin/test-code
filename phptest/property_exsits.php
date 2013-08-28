<?php

class Test {
}

$a = new Test();
var_dump(!$a->b, property_exists($a, 'b'));
