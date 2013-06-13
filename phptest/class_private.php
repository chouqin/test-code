<?php

class Test {
	public function __get($name) {
		print "get called with $name \n";
		$this->$name = 1234;
		return $this->$name;
	}
}

$a = new Test();
print $a->b . "\n";
print $a->b . "\n";
