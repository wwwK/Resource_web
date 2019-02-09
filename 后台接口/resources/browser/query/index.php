<?php
header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
//引入数据库配置文件，接受的是连接成功后数据库的名称
$database=include('../../config.php');

$sql = 'select * from browserrecord';
mysqli_select_db($conn,$database);   //连接数据库
$retval = mysqli_query($conn,$sql);
if(! $retval )
{
    die('无法读取数据: ' . mysqli_error($conn));
}
$res = array();
while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)){
	$row = array(
		'created_at'=>$row['created_at'],
		'CodeName'=>$row['CodeName'],
	);
	array_push($res,$row);
}
echo json_encode($res);
mysqli_close($conn);
?>