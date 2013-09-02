<?php

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, 'http://regi.zju.edu.cn/redir.php?catalog_id=6&cmd=learning&tikubh=1467&page=1');

//$cookies = array(
	//'grs_newbie="21321206:1378191695054:8c6b0ef339397f80bd687e4e768d4196"',
	//'PHPSESSID=c3atssvdge2ruv1dp6gjl1a1e5'
//);

//curl_setopt($curl, CURLOPT_COOKIE, $cookies);
$result = curl_exec($curl);
//$result = iconv('gbk', 'utf-8', $result);
//$result = iconv("utf-8","gb2312//IGNORE",$result);
//$result = mb_convert_encoding($result, 'utf8', 'gb2312');
//utf8_encode($result);
//$content = iconv("gbk", "utf-8",$result);
//echo $result;
//

//$result = iconv('gb2312', 'utf-8', $result);

//echo $result;

//echo iconv('GB2312', 'UTF-8', $result);
echo mb_convert_encoding($result, 'utf-8', 'gb2312');
