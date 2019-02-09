<?php

header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
$number = $_POST['number'];
$type_name = $_POST['type_name'];
$type_desc = $_POST['type_desc'];

//引入数据库配置文件，接受的是连接成功后数据库的名称
$database=include('../../config.php');
$result = array(
	'state'=> false,
	'msg'=> '',
);
//验证是否存在
function unique($field,$data,$conn,$database){
	$sql = "select * from classifies where $field = '$data'";
	mysqli_select_db($conn,$database);
	$retval = mysqli_query($conn,$sql);
	if(! $retval )
	{
		die('无法读取数据: ' . mysqli_error($conn));
	};
	while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)){
		$fieldName = '';
		switch($field){
			case 'number':
				$fieldName = '编号';
				break;
			case 'type_name':
				$fieldName = '名称';
				break;
		};
		$result = array(
			'state'=> false,
			'msg'=> $fieldName."‘".$data.'’已存在，不能重复添加'
		);
		echo json_encode($result);
		return false;
	};
	return true;
};
if(unique('number',$number,$conn,$database) && unique('type_name',$type_name,$conn,$database)){
	$sql = "INSERT INTO classifies ".
        "(number,type_name,type_desc) ".
        "VALUES ".
        "($number,'$type_name','$type_desc')";
	mysqli_select_db($conn,'resources');   //连接数据库
	$retval = mysqli_query($conn,$sql);
	if(! $retval )
	{
		die('无法读取数据: ' . mysqli_error($conn));
	}
	//$result['msg'] = $data.'添加成功';
	$result = array(
		'state'=> true,
		'msg'=> '添加成功',
	);
	echo json_encode($result);
}

mysqli_close($conn);
?>