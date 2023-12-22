<?php
include "../connect.php" ;

$noteid = FilterRequest ("id");
$title = FilterRequest ("title");
$content = FilterRequest ("content");


$stmt = $con->prepare(
"UPDATE `notes` SET `notes_title`= ?,
`notes_content`= ?  WHERE notes_id = ?"

);

//$stmt->execute();
$stmt->execute(array($title,$content,$noteid));

$count = $stmt->rowCount();

if($count >0){echo json_encode(array("status"=> "success")) ;} else { echo json_encode(array("status"=> "Fail"));}


?>