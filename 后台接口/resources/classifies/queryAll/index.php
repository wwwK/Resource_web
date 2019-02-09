<?php
header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
//引入数据库配置文件，接受的是连接成功后数据库的名称
$database=include('../../config.php');

$sql = 'select * from classifies';
mysqli_select_db($conn,$database);   //连接数据库
$retval = mysqli_query($conn,$sql);
if(! $retval )
{
    die('无法读取数据: ' . mysqli_error($conn));
}
$res = array();
while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)){
	$row = array(
		'number'=>$row['number'],
		'id'=>$row['id'],
		'type_name'=>$row['type_name'],
		'type_desc'=>$row['type_desc'],
	);
	array_push($res,$row);
}
echo json_encode($res);
mysqli_close($conn);
?>