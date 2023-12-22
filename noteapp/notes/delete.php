<?php
include "../connect.php" ;
// notes_id   notes_title    notes_content   notes_user 
#$notes_id = FilterRequest ("notes_user ");
$noteid = FilterRequest ("id");


$stmt = $con->prepare(
"DELETE FROM `notes`
WHERE `notes_id`= ? "

);


//$stmt->execute();
$stmt->execute(array($noteid));

$count = $stmt->rowCount();

if($count >0){echo json_encode(array("status"=> "success")) ;} else { echo json_encode(array("status"=> "Fail"));}


?>