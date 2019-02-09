<?php
header("Access-Control-Allow-Origin: *"); // 允许任意域名发起的跨域请求
$database=include('../../config.php');
$sql = 'SELECT c.type_name,d.sum
		FROM classifies c left join 
		(SELECT b.type_name,COUNT(*) as sum
		from elements a LEFT JOIN classifies b 
		on a.type = b.id
		GROUP BY b.type_name)d
		on c.type_name = d.type_name';
mysqli_select_db($conn,$database);
$retval = mysqli_query($conn,$sql);
if(! $retval )
{
    die('无法读取数据: ' . mysqli_error($conn));
}
$result = array();
while($row = mysqli_fetch_array($retval, MYSQLI_ASSOC)){
	//echo $row['type_name'];
	//echo $row['sum'];
	$result[$row['type_name']] = $row['sum'];
};
echo json_encode($result);
mysqli_close($conn);
?>