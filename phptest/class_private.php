<?php

//class Test {
	//public function __get($name) {
		//print "get called with $name \n";
		//$this->$name = 1234;
		//return $this->$name;
	//}
//}

//$a = new Test();
//print $a->b . "\n";
//print $a->b . "\n";
//
//
// 测试call_user_func使用private

class Test {
	public static function A($b) {
		print 'here!' . ' ' . $b;
	}
}

call_user_func('Test::A', '123');
