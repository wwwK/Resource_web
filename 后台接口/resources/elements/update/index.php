<?php
header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求

$id = $_POST['id'];
$title = $_POST['title'];
$desc = $_POST['desc'];
$website = $_POST['website'];
$github = $_POST['github'];
$type = $_POST['type'];
$imgurl = $_POST['imgurl'];

//引入数据库配置文件，接受的是连接成功后数据库的名称
$database=include('../../config.php');

$sql = "UPDATE elements
        SET title='$title',`desc`='$desc',website='$website',github='$github',type=$type,imgurl='$imgurl' 
        WHERE id=$id";
mysqli_select_db($conn,$database);   //连接数据库
$retval = mysqli_query($conn,$sql);
if(! $retval )
{
    die('无法读取数据: ' . mysqli_error($conn));
}

$result = array(
	'state'=> true,
	'msg'=> '修改成功',
);
echo json_encode($result);
mysqli_close($conn);
?>