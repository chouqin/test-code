<?php

class ExtensionFilter extends FilterIterator
{
	private $file_ext;

	public function __construct(Iterator $iterator, $file_ext = 'php' )
	{
		parent::__construct($iterator);
		$this->file_ext = $file_ext;
	}

	public function accept()
	{
		$item = $this->getInnerIterator()->current();
		if($item->getExtension() == $this->file_ext) {
			return true;
		} else {
			return false;
		}
	}
}

//class FooFilter extends FilterIterator {
	//public function accept() {

		//return true;
	//}
//}


class FileIterator implements Iterator {

	public function __construct($path, $file_ext = 'php') {
		if (!file_exists($path)) throw new Exception("path: '$path'' not exist!");
		//$somePath = '/home/liqiping/workspace/haojing/htdocs/static';
		$rdi      = new RecursiveDirectoryIterator($path);
		$rii      = new RecursiveIteratorIterator($rdi);
		$this->iterator = new ExtensionFilter($rii, $file_ext);

		//$handler = new RecursiveIterator(new RecursiveDirectoryIterator($path, FilesystemIterator::SKIP_DOTS));
		//$handler = new RecursiveDirectoryIterator($path, FilesystemIterator::SKIP_DOTS);
		//$this->iterator = new ExtensionFilter($handler, $file_ext);
		//$this->iterator = $handler;
	}

	public function getIterator() {
		return $this->iterator;
	}

	public function rewind() {
		return $this->iterator->rewind();
	}

	public function valid() {
		return $this->iterator->valid();
	}

	public function current() {
		return $this->iterator->current();
	}

	public function next() {
		$this->iterator->next();
	}

	public function key() {
		return $this->iterator->key();
	}
}

$it = new FileIterator('/home', 'css');
$max = 0;
foreach($it as $_js) {
	echo $_js . "\n";
	$current = memory_get_usage();
	if ($current > $max) {
		echo ($current - $max) . "\n";
		$max = $current;
	}
}
var_dump( memory_get_peak_usage(), memory_get_usage());
//$rdi      = new RecursiveDirectoryIterator($somePath);
//$rii      = new RecursiveIteratorIterator($rdi);
//$filtered = new FooFilter($rii);

//foreach ($filtered as $f) {
	//echo $f . "\n";
//}

