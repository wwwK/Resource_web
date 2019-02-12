<?php
header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
$name = $_POST["name"];
$password = $_POST["password"];

//引入数据库配置文件，接受的是连接成功后数据库的名称
$database=include('../../config.php');

$sql = 'select * from administrators where name = "'.$name.'"';
mysqli_select_db($conn,$database);   //连接数据库
$retval = mysqli_query($conn,$sql);
if(! $retval )
{
    die('无法读取数据: ' . mysqli_error($conn));
}
$res = array(
	'state'=>false,
	'name'=>$name,
	'msg'=>'账号不存在',
);

while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)){
	//$row = array(
	//	'name'=>$row['name'],
	//	'password'=>$row['password'],
	//);
	//array_push($res['data'],$row);
	$res['msg'] = '账号验证成功，密码验证失败';
	if($row['password'] == $password){
		$res['msg'] = '验证成功';
		$res['state'] = true;
	}else {
		$res['msg'] = '密码错误';
	}
}
echo json_encode($res);
mysqli_close($conn);


?>