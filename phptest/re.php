<?php

function get_storage_unit($size) {
  $size = rtrim(strtoupper($size), 'B');
  $units = array('K', 'M', 'G', 'T');
  preg_match("/([0-9]+)([KMGT]?)/", $size, $matches);
  var_dump($matches);
  if (isset($matches[2])) {
    print $matches[1] * pow(1024, array_search($matches[2], $units) + 1);
  } else {
    print "here";
    print  $matches[1];
  }
}

$units = array('K', 'M', 'G', 'T');
var_dump(array_search("K", $units) + 1);

get_storage_unit('10B');


$str = 'string';
$chars = preg_split('//', $str, -1, PREG_SPLIT_NO_EMPTY);
var_dump($chars);

preg_match('/^(http:\/\/)?([^\/]+)/', 'http://www.php.net/index.html', $matches);
var_dump($matches);

preg_match('/^(http:\/\/)?(([^\/])+)/', 'www.php.net/index.html', $matches);
var_dump($matches);

$host = $matches[2];
preg_match('/[^\.]+\.[^\.]+$/', $host, $matches);
var_dump($matches);

preg_match('/^\s*\{(\w+)\}\s*=/', '{startDate} = 1999-5-27', $matches);
var_dump($matches);

$cmd = 'root/children';
preg_match('/^(?<id>[^\/\s\?]+)(\/(?<conn>[a-zA-Z]+))?(\?(?<arg>.+))?$/', $cmd, $m);
var_dump($m);

$uri = '/index.php?openid_ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid_mode=id_res&openid_op_endpoint=https%3A%2F%2Fwww.google.com%2Faccounts%2Fo8%2Fud&openid_response_nonce=2013-06-06T01%3A42%3A13Z0yh4yu2v0px8HA&openid_return_to=http%3A%2F%2Fshanghai.liqiping.baixing.cn%2Findex.php&openid_assoc_handle=1.AMlYA9XtheXbumyEEI_84RdbWZkBHy-brGT675GBE4RRtAAAmk-SC3gARNoSlGzc&openid_signed=op_endpoint%2Cclaimed_id%2Cidentity%2Creturn_to%2Cresponse_nonce%2Cassoc_handle%2Cns.ext1%2Cext1.mode%2Cext1.type.contact_email%2Cext1.value.contact_email&openid_sig=dO4lpqpTPao3T7uMEUsFNG7yoMs%3D&openid_identity=https%3A%2F%2Fwww.google.com%2Faccounts%2Fo8%2Fid%3Fid%3DAItOawmf2mbCurfHvhrlVh-J2y58ZZDw8PUB234&openid_claimed_id=https%3A%2F%2Fwww.google.com%2Faccounts%2Fo8%2Fid%3Fid%3DAItOawmf2mbCurfHvhrlVh-J2y58ZZDw8PUB234&openid_ns_ext1=http%3A%2F%2Fopenid.net%2Fsrv%2Fax%2F1.0&openid_ext1_mode=fetch_response&openid_ext1_type_contact_email=http%3A%2F%2Faxschema.org%2Fcontact%2Femail&openid_ext1_value_contact_email=liqiping%40baixing.net';
$pattern = '#((?<=\?)|&)openid[\._][^&]+#';
preg_match_all($pattern, $uri, $matches);
var_dump($matches);

?>
