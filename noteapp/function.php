<?php
//$age = $_POST["age"]; // من المفترض ان يكون التسمية باشكل دا ولكن الكود هيكون معرض لسهولة للأختراق 
//لذلك عملنا ميثود اسمها فيلتر ريقويست ف ملف فانكشن عشان تحجب الداتا بتاعتي 
//$name = htmlspecialchars(strip_tags($_POST["name"])); // ودا بدل الميثود 

function FilterRequest ($requestName){

return htmlspecialchars(strip_tags($_POST[$requestName]));


}

    function checkAuthenticate() // دي لأخفاء الapis  عن اعين اي حد عن طريق عمل نيم وباسورد للداتا 
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
    
            if ($_SERVER['PHP_AUTH_USER'] != "hamo" ||  $_SERVER['PHP_AUTH_PW'] != "Hamo161020@"){
                header('WWW-Authenticate: Basic realm="My Realm"');
                header('HTTP/1.0 401 Unauthorized');
                echo 'Page Not Found';
                exit;
            }
        } else {
            exit;
        }
    }


?>