<?php

$str = '{"func":["HotKeywords","load"],"args":["shanghai"],"ignoreReturn":"NULL","cache_key":"HotKeywords::load()20e5eb970d9178e860c5930230852c85"}';
var_dump(json_decode($str), json_decode($str, true));
