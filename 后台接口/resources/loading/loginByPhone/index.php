<?php
	header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
	$phone = $_GET['phone'];   //接受手机号码
	
	//引入数据库配置文件，接受的是连接成功后数据库的名称
	$database=include('../../config.php');
	
	$sql = 'select * from administrators where phone = "'.$phone.'"';
	mysqli_select_db($conn,$database);   //连接数据库
	$retval = mysqli_query($conn,$sql);
	if(! $retval )
	{
		die('无法读取数据: ' . mysqli_error($conn));
	}
	$res = array(
		'state'=>false,
		'msg'=>'手机号'.$phone."不是管理员！请联系作者验证！",
	);
	
	while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)){
		$code = rand(100000,999999);   //生成随机验证码
		$host = "https://exempt.market.alicloudapi.com";
		$path = "/exemptCode";
		$method = "GET";
		$appcode = "a0edbe793f0d4030b385a167d6689ac4";
		$headers = array();
		array_push($headers, "Authorization:APPCODE " . $appcode);
		$querys = "content=【邓占勇的资源中心】您的验证码是：{".$code."}，请在5分钟内使用。请勿泄露。(系统测试短信)。&phone=".$phone;
		$bodys = "";
		$url = $host . $path . "?" . $querys;

		$curl = curl_init();
		curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($curl, CURLOPT_FAILONERROR, false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_HEADER, false);
		//curl_setopt($curl, CURLOPT_HEADER, true); 如不输出json, 请打开这行代码，打印调试头部状态码。
		//状态码: 200 正常；400 URL无效；401 appCode错误； 403 次数用完； 500 API网管错误

		if (1 == strpos("$".$host, "https://"))
		{
			curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
		}
		$out_put = curl_exec($curl);
		$arr = json_decode($out_put,true);
		$res['state'] = true;
		$res['msg'] = '手机号码验证成功';
		
		$VerCode = array(
			'VerCode'=>$code,
		);
		$phone = array(
			'phone'=>$phone,
		);
		$username = array(
			'username' =>$row['name'],
		);
		$res = array_merge($res,$arr,$VerCode,$phone,$username);
	}
	echo json_encode($res);
	mysqli_close($conn);
	
	
	
	
	
	
	
	
	
	
?>