<?php
include "../connect.php" ;
// notes_id   notes_title    notes_content   notes_user 
$userid = FilterRequest ("id");// هو انا هغير حاجه ف الملاحظة .. لا انا هعرضهم بس 

//دي اللي هي مختصه بكل النوتس بتاعت اليوزر اللي عامل تسجيل دخول  notes_users ال 
// ..... طاب ليه مستخدمناش ال اي دي بتاعت اليوزر وخلاص لاني هنا بتكلم عن داتا النوتس نفسها مش اليوزر 
//ال notes_id بيتكلم عن ملاحظة واحدة فقط 
// الخلاصه تعاملك هنا كله مع ما يخض النوتس فقط طالما بتعمل كود النوتس 

// احنا بقا هنتعامل بال اي دي بتاع اليوزر عند الفلاتر مش هنا 

$stmt = $con->prepare(

"SELECT * FROM `notes` WHERE `notes_users` = ? "
);

//$stmt->execute();
$stmt->execute(array($userid));
$data= $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();


if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "Fail", "error" => "No data found for user ID: $userid"));
}


?>