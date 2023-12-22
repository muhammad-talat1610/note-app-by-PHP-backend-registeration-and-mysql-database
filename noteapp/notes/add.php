<?php
include "../connect.php" ;

$userid = FilterRequest ("id");// لازم تلتزم بنفس الاسم اللي جوة القوس لما تيجي تعمل ريقوست ف الفلاتر 
$title = FilterRequest ("title"); 
$content = FilterRequest ("content");
#$notes_image = FilterRequest ("image");
// لازم تلتزم بنفس الاسم اللي جوة القوس لما تيجي تعمل ريقوست ف الفلاتر 



$stmt = $con->prepare(
    "INSERT INTO `notes`( `notes_title`, `notes_content`,`notes_users`) 
     VALUES (?,?,?)"
);
//notes_user عشان تفهم حوارها انا لما بعوز اعرض او اضيف نوت جديدة هتنضاف عند الشخص اللي انا عامل بيه تسجيل دخول
// فبالتالي انا هعرف مكان الشخص دا منين من الاي دي بتاعي
// notes_user  فبالتالي انا عامل علاقه ما بين الاي دي بتاع الشخص وما بين النوت يوزر وعشان كدا استخدمنا كدلاله عليه
//$stmt->execute();
$stmt->execute(array($title , $content , $userid));

$count = $stmt->rowCount();

if($count >0){echo json_encode(array("status"=>"success")) ;} else { echo json_encode(array("status"=> "Fail"));}


?>