<?php
include "../connect.php" ;
//$age = $_POST["age"]; // من المفترض ان يكون التسمية باشكل دا ولكن الكود هيكون معرض لسهولة للأختراق 
//لذلك عملنا ميثود اسمها فيلتر ريقويست ف ملف فانكشن عشان تحجب الداتا بتاعتي 
//$name = htmlspecialchars(strip_tags($_POST["name"])); // ودا بدل الميثود 

$email =  FilterRequest ("email");
$password =  FilterRequest ("password");
$stmt = $con->prepare(
    //انا عملت كدا عشان اتحقق هل فعلا الايميل والباسورد اللي انا ادخلتهم هما فعلا اللي موجودين ف الداتا بيز ولا لا 
   // i Mean Select instead of Insert >>> Insert For new things but Select to choose From Lists
    "SELECT * FROM `users` WHERE `email` = ? AND `password` = ? "
//"INSERT INTO `users`( `email`, `password`) VALUES ('$email','$password' )"
);
$stmt->execute(array($email,$password));
$data = $stmt->fetch( PDO::FETCH_ASSOC);
//$stmt->execute();
$count = $stmt->rowCount();
//if($count >0){echo json_encode(array("status"=> "success" , "date" => $data)) ;}else { echo json_encode(array("status"=> "Fail"));}
if($count >0){echo json_encode(array("status"=> "success" , "data" => $data
    )) ;} 
else { echo json_encode(array("status"=> "Fail"));}
?>