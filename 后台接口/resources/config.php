<?php
$config = array(
	'host'=>'localhost',
	'dbname'=>'root',
	'dbpassword'=>'',   //mysql密码
);


$dbhost = $config['host']; //服务器主机地址
$dbname = $config['dbname']; //mysql用户名
$dbpassword = $config['dbpassword'];   //mysql密码

$conn = mysqli_connect($dbhost,$dbname,$dbpassword);
if(! $conn )
{
	return '数据库连接失败:'.mysqli_error();
}
mysqli_query($conn,"set names utf8");
return 'resources';   //返回数据库名

?>