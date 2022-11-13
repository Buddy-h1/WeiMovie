<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>WeiMovie</title>
</head>
<body>
    <div class="header_background"></div>
    <div class="container header_one_logo">
    <a href="http://weimovie.ru/"><div class="logo"></div></a>
    </div>

<?php

    require_once 'connect_db.php';

    $email = filter_var(trim($_POST['email_in']),
    FILTER_SANITIZE_STRING);
    SetCookie("email_in", $_POST['email_in'], time() + 120);
    $password = filter_var(trim($_POST['password_in']),
    FILTER_SANITIZE_STRING);
    $password = md5($password."weimovie");

?>

<div class="message">

<?php
    $params = [
        'email' => $email,
        'password' => $password
    ];
    
    $query = $connect->prepare("SELECT * FROM user WHERE email_user = :email AND password_user = :password");
    $query->execute($params);
    $user = $query->fetchAll(PDO::FETCH_ASSOC);

    if ($user[0]['id_user'] != "") {
        $_SESSION['USER'] = $user;
        header('Location: http://weimovie.ru/');
    }
    else {
        ?>
        <p>Увы:(<br>Вы ввели неверную электронную почту или пароль.
        <p>Перейдите на Главную и попробуйте снова.</p>
        <a href="http://weimovie.ru/">weimovie.ru</a>
        <?php
    }
?>

</div>

</body>
</html>