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

$flag = 1;
if ($name == '' || $surname == '' || $login == '' || $password == '') {
    $flag = 0;
}

?>

<div>
    <p class="message">

    <?php
        if ($flag == 0) {
            ?>
            <p>Увы:(<br>Вы не были зарегистрированы<br>Причина: не все поля были заполнены.</p>
            <p>Перейдите на Главную и попробуйте снова.</p>
            <a href="http://weimovie.ru/">weimovie.ru</a>
            <?php
        }
        else {
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
        }
    ?>

    </p>
</div>

