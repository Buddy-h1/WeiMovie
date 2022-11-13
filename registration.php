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
    SetCookie("name", $_POST['name'], time() + 120);
    $surname = filter_var(trim($_POST['surname']),
    FILTER_SANITIZE_STRING);
    SetCookie("surname", $_POST['surname'], time() + 120);
    $email = filter_var(trim($_POST['email_reg']),
    FILTER_SANITIZE_STRING);
    SetCookie("email_reg", $_POST['email_reg'], time() + 120);
    $password = filter_var(trim($_POST['password_reg']),
    FILTER_SANITIZE_STRING);
    $full_name = $name . " " . $surname;
    $password = md5($password."weimovie");

?>

<div class="message">

    <?php
        $params = [
            'email' => $email
        ];

        $query = $connect->prepare("SELECT * FROM user WHERE email_user = :email");
        $query->execute($params);
        $check = $query->fetchAll(PDO::FETCH_ASSOC);

        if ($check[0] == "") {
            $params = [
                'full_name' => $full_name,
                'email' => $email,
                'password' => $password,
                'role' => "Пользователь"
            ];

            $query = $connect->prepare("INSERT INTO user (name_user, email_user, password_user, role_user) VALUES (:full_name, :email, :password, :role)");
            $query->execute($params);
            ?>
            <p>Вы зарегистррованы на weimovie.ru<p>
            <p>Перейдите на Главную и войдите в свой аккаунт.</p>
            <a href="http://weimovie.ru/">weimovie.ru</a>
            <?php
        }
        else {
            ?>
            <p>Увы:(<br>Вы не были зарегистрированы<br>Причина: Пользователь с такой электронной почтой уже существует.</p>
            <p>Перейдите на Главную и попробуйте снова.</p>
            <a href="http://weimovie.ru/">weimovie.ru</a>
            <?php
        }
    ?>

</div>

</body>
</html>