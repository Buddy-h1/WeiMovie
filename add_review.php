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

    $title_movie = filter_var(trim($_POST['title_movie']), FILTER_SANITIZE_STRING);
    $description_review = filter_var(trim($_POST['description_review']), FILTER_SANITIZE_STRING);
    $text_review = filter_var(trim($_POST['text_review']), FILTER_SANITIZE_STRING);
    $link_trailer = filter_var(trim($_POST['link_trailer']), FILTER_SANITIZE_STRING);
    $date = date("Y-m-d");
    $id_user = $_SESSION['USER'][0][0];

    // Генерация нового имени для файла
    $name = $_FILES["poster_review"]["name"];
    $extension = end((explode(".", $name)));
    $guid = bin2hex(openssl_random_pseudo_bytes(16));
    $new_name_file = $guid . "." . $extension;
    move_uploaded_file($_FILES['poster_review']['tmp_name'], 'posters/'. $new_name_file);

    $result = 0;
    if ($auth == 1 && $auth_role == "Модератор") {
        $result = mysqli_query($connect, "INSERT INTO review (title_review, description_review, poster_review, video_review, date_review, text_review, id_user) VALUES (\"$title_movie\", \"$description_review\", \"$new_name_file\", \"$link_trailer\", \"$date\", \"$text_review\", \"$id_user\");");
    }

?>

<div class="message">

<?php if ($result): ?>
    <p>Обзор был успешно добавлен на weimovie.ru<p>
    <p>Перейдите на Главную для, чтобы смотреть обзоры.</p>
    <a href="http://weimovie.ru/">weimovie.ru</a>
<?php else: ?>
    <p>Увы:(<br>Отзыв не был добавлен.
    <p>Вернитесь назад, чтобы исправить его.</p>
<?php endif; ?>

</div>

</body>
</html>