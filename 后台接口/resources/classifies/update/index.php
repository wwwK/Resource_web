<?php

header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
$id=$_POST['id'];
$number = $_POST['number'];
$type_name = $_POST['type_name'];
$type_desc = $_POST['type_desc'];

//引入数据库配置文件，接受的是连接成功后数据库的名称
$database=include('../../config.php');

mysqli_query($conn,"set names utf8");
$sql = "UPDATE classifies ".
        "SET number='$number',type_name='$type_name',type_desc='$type_desc' 
        WHERE id=$id";
mysqli_select_db($conn,$database);   //连接数据库
$retval = mysqli_query($conn,$sql);
if(! $retval )
{
    $result = array(
		'state'=> false,
		'msg'=> '读取数据失败',
	);
	echo json_encode($result);
}

$result = array(
	'state'=> true,
	'msg'=> '修改成功',
);
echo json_encode($result);
mysqli_close($conn);
?>