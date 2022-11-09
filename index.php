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

$save_login = !empty($_COOKIE['login']) ? $_COOKIE['login'] : '';

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/form_style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeiMovie</title>
</head>
<body>
    <div class="header_background"></div>
    <div class="container header">
        <a href="http://weimovie.ru/"><div class="logo"></div></a>

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
		<div class="modal_overlay">
			<div class="modal modal_in" data-target="input_user">
            <p class="modal_name">Введите данные для входа</p>
				<form action="input.php" method="post">
                    <div class="text_field">
                        <label class="text_field_label" for="name">Логин</label>
                        <input class="text_field_input" type="text" name="login" id="login" placeholder="Логин" value="<?php echo $save_login; ?>" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="name">Пароль</label>
                        <input class="text_field_input" type="password" name="password" id="password" placeholder="Пароль" required>
                    </div>
                    <button class="btn btn_reg_in" type="submit">Войти</button>
                </form>
			</div>
            <div class="modal modal_reg" data-target="registration_user">
                <p class="modal_name">Введите данные для регистрации</p>
                <form action="registration.php" method="post">
                    <div class="text_field">
                        <label class="text_field_label" for="name">Имя</label>
                        <input class="text_field_input" type="text" name="name" id="name" placeholder="Имя" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="name">Фамилия</label>
                        <input class="text_field_input" type="text" name="surname" id="surname" placeholder="Фамилия" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="name">Логин</label>
                        <input class="text_field_input" type="text" name="login" id="login" placeholder="Логин" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="name">Пароль</label>
                        <input class="text_field_input" type="password" name="password" id="password" placeholder="Пароль" required>
                    </div>
                    <button class="btn btn_reg_in" type="submit">Регистрация</button>
                </form>
			</div>
		</div>
	</div>

    <?php if ($auth_role == "Модератор"): ?>
        <div class="line"></div>
        <div class="container container_btn_add_review">
            <a class="btn btn_white btn_center" href="add_review.html">+Добавить отзыв</a>
        </div>
        <div class="line"></div>
    <?php endif; ?>
    
    <?php
        $result_query = mysqli_query($connect, "SELECT id_review, title_review, description_review, 
        poster_review, date_review, name_user FROM `review` JOIN `user` ON review.id_user = user.id_user;");

        $array_reviews = mysqli_fetch_all($result_query, MYSQLI_ASSOC);
        foreach ($array_reviews as $review) { ?>

            <div class="container container_white">
                <div class="review_container">
                    <div class="review_item_1">
                        <img class="poster" src="posters/<?= $review['poster_review'] ?>" alt="poster">
                    </div>
                    <div class="review_item_2 review_text_title">

                        <a href="show_review.php?id=<?= $review['id_review']?>" 
                        class="btn btn_black"><?= $review['title_review'] ?> <span 
                        class="review_text_id"> | #<?= $review['id_review'] ?></span></a>

                    </div>
                    <div class="review_item_3 review_text_description">
                        <p>
                            Описание:<br>
                            <?= $review['description_review'] ?> 
                        </p>
                    </div>
                    <div class="review_item_4 review_text_user_date">
                        <p>
                            Автор: <?= $review['name_user'] ?><br>Дата добавления: <?= $review['date_review'] ?>
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