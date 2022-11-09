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

    $name = filter_var(trim($_POST['name']),
    FILTER_SANITIZE_STRING);
    $surname = filter_var(trim($_POST['surname']),
    FILTER_SANITIZE_STRING);
    $login = filter_var(trim($_POST['login']),
    FILTER_SANITIZE_STRING);
    $password = filter_var(trim($_POST['password']),
    FILTER_SANITIZE_STRING);
    $full_name = $name . " " . $surname;
    $password = md5($password."weimovie");

?>

<div class="message">

    <?php
        $check = mysqli_query($connect, "SELECT * FROM user WHERE login_user = \"$login\";");
        $check = mysqli_fetch_all($check);
        if ($check[0] == "") {
            mysqli_query($connect, "INSERT INTO user (name_user, login_user, password_user, role_user) VALUES (\"$full_name\", \"$login\", \"$password\", \"Пользователь\");");
            ?>
            <p>Вы зарегистррованы на weimovie.ru<p>
            <p>Перейдите на Главную и войдите в свой аккаунт.</p>
            <a href="http://weimovie.ru/">weimovie.ru</a>
            <?php
        }
        else {
            ?>
            <p>Увы:(<br>Вы не были зарегистрированы<br>Причина: Пользователь с таким логином уже существует.</p>
            <p>Перейдите на Главную и попробуйте снова.</p>
            <a href="http://weimovie.ru/">weimovie.ru</a>
            <?php
        }
    ?>

</div>

</body>
</html>