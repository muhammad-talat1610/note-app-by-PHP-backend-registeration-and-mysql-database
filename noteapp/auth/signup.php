<?php
include "../connect.php" ;
//$age = $_POST["age"]; // من المفترض ان يكون التسمية باشكل دا ولكن الكود هيكون معرض لسهولة للأختراق 
//لذلك عملنا ميثود اسمها فيلتر ريقويست ف ملف فانكشن عشان تحجب الداتا بتاعتي 
//$name = htmlspecialchars(strip_tags($_POST["name"])); // ودا بدل الميثود 

$name = FilterRequest ("name");
$email =  FilterRequest ("email");
$password =  FilterRequest ("password");

$stmt = $con->prepare(
"INSERT INTO users ( `name`, `email`, `password`) VALUES (? , ? ,?  )"

);

//$stmt->execute();
$stmt->execute(array($name,$email,$password));

$count = $stmt->rowCount();

if($count >0){echo json_encode(array("status"=> "success")) ;} else { echo json_encode(array("status"=> "Fail"));}


?>