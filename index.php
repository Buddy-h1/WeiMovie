<?php

require_once 'connect_db.php';

$auth = 2;
$auth_role = "Пользователь";

if (isset($_SESSION['USER'])) {
    $auth = 1;
    $input_user_login = $_SESSION['USER'][0][2];
    $role = mysqli_query($connect, "SELECT role_user FROM user WHERE login_user = \"$input_user_login\";");
    $role = mysqli_fetch_all($role);
    if ($role[0][0] == "Модератор") {
        $auth_role = "Модератор";
    }   
}
else {
    $auth = 0;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="header_back"></div>
    <div class="container header">
        <div class="logo"></div>

        <?php if ($auth_role == "Модератор"): ?>
            <button class="btn btn_white btn_center">+Добавить отзыв</button>
        <?php endif; ?>

        <?php if ($auth == 1): ?>
            <div class="name_out_wrap push">
                <p class="name"> <?php print_r($_SESSION['USER'][0][1]); ?> </p>
                <a class="btn btn_white push" href="logout.php">Выйти</a>
            </div>
        <?php else: ?>
            <button class="btn btn_white push" data-path="input_user">Войти</button>
            <button class="btn btn_white" data-path="registration_user">Регистрация</button>
        <?php endif; ?>

    </div>
    

    <div class="modals">
		<div class="modal-overlay">
			<div class="modal modal-in modal--1" data-target="input_user">
            <p class="modal-name">Введите данные для входа</p>
				<form action="input.php" method="post">
                    <div class="text-field">
                        <label class="text-field__label" for="name">Логин</label>
                        <input class="text-field__input" type="text" name="login" id="login" placeholder="Логин">
                    </div>
                    <div class="text-field">
                        <label class="text-field__label" for="name">Пароль</label>
                        <input class="text-field__input" type="password" name="password" id="password" placeholder="Пароль">
                    </div>
                    <button class="btn btn_reg_in" type="submit">Войти</button>
                </form>
			</div>
            <div class="modal modal-reg modal--2" data-target="registration_user">
                <p class="modal-name">Введите данные для регистрации</p>
                <form action="registration.php" method="post">
                    <div class="text-field">
                        <label class="text-field__label" for="name">Имя</label>
                        <input class="text-field__input" type="text" name="name" id="name" placeholder="Имя">
                    </div>
                    <div class="text-field">
                        <label class="text-field__label" for="name">Фамилия</label>
                        <input class="text-field__input" type="text" name="surname" id="surname" placeholder="Фамилия">
                    </div>
                    <div class="text-field">
                        <label class="text-field__label" for="name">Логин</label>
                        <input class="text-field__input" type="text" name="login" id="login" placeholder="Логин">
                    </div>
                    <div class="text-field">
                        <label class="text-field__label" for="name">Пароль</label>
                        <input class="text-field__input" type="password" name="password" id="password" placeholder="Пароль">
                    </div>
                    <button class="btn btn_reg_in" type="submit">Регистрация</button>
                </form>
			</div>
		</div>
	</div>

    <?php
        $connect = mysqli_connect($servername, $username, $password, $database);
        $review = mysqli_query($connect, "SELECT * FROM `review`");
        $review = mysqli_fetch_all($review);
        foreach ($review as $item) {
            ?>

            <div class="container_white">
                <div class="review_container">
                    <div class="review_item_1">
                        <img src="image/poster.jpg" width="275" alt="poster">
                    </div>
                    <div class="review_item_2">
                        <button class="btn btn_black"><?= $item[1] ?></button>
                    </div>
                    <div class="review_item_3">
                        <p>
                            Описание:<br>
                            <?= $item[2] ?> 
                        </p>
                    </div>
                    <div class="review_item_4">
                        <p>
                            Автор: <?= $item[7] ?><br>Дата добавления: <?= $item[5] ?>
                        </p>
                    </div>
                </div>
            </div>

            <?php
        }
        
    ?>

    <script src="script.js"></script>
</body>
</html>