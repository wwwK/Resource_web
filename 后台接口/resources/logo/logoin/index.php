<?php
	header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
	$phone = $_GET['phone'];
	$code = rand(100000,999999);   //生成随机验证码
	//$code = 5201314;
	
	$host = "https://exempt.market.alicloudapi.com";
    $path = "/exemptCode";
    $method = "GET";
    $appcode = "a0edbe793f0d4030b385a167d6689ac4";
    $headers = array();
    array_push($headers, "Authorization:APPCODE " . $appcode);
    $querys = "content=【邓占勇的资源中心】您的验证码是：{".$code."}，请在5分钟内使用。请勿泄露。(系统测试短信)。&phone=".$phone;
	//$querys = "content=【邓占勇的资源中心】您的奖品兑换码是：{".$code."}，请在7天内找男朋友使用。请勿泄露。(系统测试短信)。&phone=".$phone;
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
    echo $out_put;
?>