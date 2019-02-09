<?php

$dbhost = ''; //服务器主机地址
$dbname = ''; //mysql用户名
$dbpassword = '';   //mysql密码
$database = '';   //数据库
$file = fopen("../../database.txt", "r") or exit("无法打开文件!");
// 读取文件每一行，直到文件结尾
$config = array();
while(!feof($file))
{
	$array = explode("=",fgets($file));
	$config[$array[0]] = $array[1];
	switch($array[0]){
		case 'host':
			$dbhost = $array[1];
			break;
		case 'name':
			$dbname = $array[1];
			break;
		case 'password':
			$dbpassword = $array[1];
			break;
		case 'database':
			$database = $array[1];
			break;
	}
}
echo $dbhost;
echo $dbname;
echo $dbpassword;
echo $database;

fclose($file);
?>