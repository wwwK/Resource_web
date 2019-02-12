<?php
	header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
	$landingMode = $_GET['landingMode'];   //登陆方式
	$username = $_GET['username'];      //登陆用户名
	$verCode = $_GET['verCode'];      //登陆用户名
	
	$database=include('../../config.php');
	
	$selectPhone = "SELECT phone from administrators WHERE `name` = '$username'";
	mysqli_select_db($conn,$database);
	$retval = mysqli_query($conn,$selectPhone);
	$phone = '';
	while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)){
		$phone = $row['phone'];
	};
	echo $phone;
	echo $landingMode;
	$sql = "INSERT INTO landingrecord 
		(landingMode,username,`phone`,verCode)
		VALUES
		('$landingMode','$username',$phone,$verCode)";
	$retval2 = mysqli_query($conn,$sql);
	if(! $retval2 )
	{
		echo mysqli_error($conn);
		die('无法读取数据: ' . mysqli_error($conn));
	}else{
		echo "记录成功";
	}
	
	
?>