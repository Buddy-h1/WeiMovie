<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/reg_in_mes.css">
    <title>Регистрация</title>
</head>
<body>
    <div class="header_back"></div>
    <div class="container header">
        <div class="logo"></div>
    </div>
</body>
</html>

<?php

require_once 'connect_db.php';

$login = filter_var(trim($_POST['login']),
FILTER_SANITIZE_STRING);
$password = filter_var(trim($_POST['password']),
FILTER_SANITIZE_STRING);
$password = md5($password."weimovie");

?>

<div>
    <p class="message">

    <?php
        $user = mysqli_query($connect, "SELECT * FROM user WHERE login_user = \"$login\" AND password_user = \"$password\";");
        $user = mysqli_fetch_all($user);

        if ($user[0] != "") {
            $_SESSION['USER'] = $user;
            ?>
            <p>Вы вошли в weimovie.ru<p>
            <p>Перейдите на Главную для, чтобы смотреть обзоры.</p>
            <a href="http://weimovie.ru/">weimovie.ru</a>
            <?php
        }
        else {
            ?>
            <p>Увы:(<br>Вы ввели неверный логин или пароль.
            <p>Перейдите на Главную и попробуйте снова.</p>
            <a href="http://weimovie.ru/">weimovie.ru</a>
            <?php
        }
    ?>

    </p>
</div>

