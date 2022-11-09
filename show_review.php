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
    <link rel="stylesheet" type="text/css" href="css/form_style.css">
    <link rel="stylesheet" type="text/css" href="css/add_file_style.css">
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

    <?php if ($auth_role == "Модератор"): ?>
        <div class="line"></div>
        <div class="container container_btn_add_review">
            <a class="btn btn_white btn_center" href="add_review.html">+Добавить отзыв</a>
        </div>
        <div class="line"></div>
    <?php endif; ?>
    

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

<?php
$id_rev = $_GET['id'];
$connect = mysqli_connect($servername, $username, $password, $database);
$review = mysqli_query($connect, "SELECT video_review, title_review, description_review, poster_review, date_review, name_user, text_review FROM `review` JOIN `user` ON review.id_user = user.id_user WHERE id_review=\"$id_rev\";");
$review = mysqli_fetch_all($review);
?>
<div class="container container_white">
    <div class="review_container">
        <div class="review_item_1">
            <img class="poster" src="posters/<?php echo($review[0][3]); ?>" alt="poster">
        </div>
        <div class="review_item_2 review_text_title">
            <p><?php echo($review[0][1]); ?></p>
        </div>
        <div class="review_item_3 review_text_description">
            <p>
                Описание:<br>
                <?php echo($review[0][2]); ?> 
            </p>
        </div>
        <div class="review_item_4 review_text_user_date">
            <p>
                Автор: <?php echo($review[0][5]); ?><br>Дата добавления: <?php echo($review[0][4]); ?>
            </p>
        </div>
    </div>
    <iframe width="100%" height="576px" src="<?php echo($review[0][0]); ?>" 
    title="YouTube video player" frameborder="0" 
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
    allowfullscreen></iframe> 
    <p class="review_text"><pre class="review_text"><?php echo($review[0][6]); ?></pre></p>
    <div class="line"></div>

<?php if ($auth == 1): ?>

    <form action="add_comment.php?id=<?= $id_rev ?>" method="post">
        <br><label>Напишите свой комментарий</label><br>
        <textarea class="form_control_mini" name="text_comment" id="text_comment" rows="3" required></textarea>
        <button class="input_file_btn"> +Добавить комментарий </button><br><br>
        <div class="line"></div>
    </form>

<?php endif; ?>

    <p class="comment">Комментарии:</p>
    <div class="line"></div>

<?php
    $connect = mysqli_connect($servername, $username, $password, $database);
    $comments = mysqli_query($connect, "SELECT data_comment, text_comment, name_user FROM comment JOIN user ON comment.user_id = user.id_user WHERE id_review = \"$id_rev\";");
    $comments = mysqli_fetch_all($comments);

    foreach ($comments as $item) {
?>

    <p class="comment_user_date"><?= $item[2] ?> | <?= $item[0] ?></p>
    <p class="comment_text">>>><?= $item[1] ?></p>
    <div class="line"></div>

<?php
    }  
?>

</div>
    <script src="script.js"></script>
</body>
</html>