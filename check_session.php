<?php

require_once 'connect_db.php';

$auth = 2;
$auth_role = "Пользователь";

if (isset($_SESSION['USER'])) {
    $auth = 1;
    $input_user_email = $_SESSION['USER'][0]['email_user'];
    $query = $connect->query("SELECT role_user FROM user WHERE email_user = \"$input_user_email\";");
    $date = $query->fetchAll(PDO::FETCH_ASSOC);
    if ($date[0]['role_user'] == "Модератор") {
        $auth_role = "Модератор";
    }   
}
else {
    $auth = 0;
}

?>