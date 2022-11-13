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

    require_once 'check_session.php';

    $title_movie = filter_var(trim($_POST['title_movie']), FILTER_SANITIZE_STRING);
    $description_review = filter_var(trim($_POST['description_review']), FILTER_SANITIZE_STRING);
    $text_review = filter_var(trim($_POST['text_review']), FILTER_SANITIZE_STRING);
    $link_trailer = filter_var(trim($_POST['link_trailer']), FILTER_SANITIZE_STRING);
    $date = date("Y-m-d");
    $id_user = $_SESSION['USER'][0]['id_user'];

    $filename = $_FILES['poster_review']['tmp_name'];
    list($width, $height) = getimagesize($filename);

?>
    
<div class="message">

<?php if ($width == "" && $height == ""): ?>
    <p>Был загружен подозрительный файл<br>Отзыв не был добавлен.<br>
    <p>Вернитесь назад, чтобы загрузить другой файл.</p>
    <?php exit; ?>
<?php endif; ?>

</div>

<?php
    // Генерация нового имени для файла
    $name = $_FILES["poster_review"]["name"];
    $extension = end((explode(".", $name)));
    $guid = bin2hex(openssl_random_pseudo_bytes(16));
    $new_name_file = $guid . "." . $extension;
    move_uploaded_file($_FILES['poster_review']['tmp_name'], 'posters/'. $new_name_file);

    $result = 0;
    if ($auth == 1 && $auth_role == "Модератор") {
        $params = [
            'title_review' => $title_movie,
            'description_review' => $description_review,
            'poster_review' => $new_name_file,
            'video_review' => $link_trailer,
            'date_review' => $date,
            'text_review' => $text_review,
            'id_user' => $id_user
        ];

        $query = $connect->prepare("INSERT INTO review (title_review, description_review, poster_review, video_review, date_review, text_review, id_user) VALUES (:title_review, :description_review, :poster_review, :video_review, :date_review, :text_review, :id_user)");
        $query->execute($params);
        $result = $query->fetchAll(PDO::FETCH_ASSOC);
    }

?>

<div class="message">

<?php if ($result != 0): ?>
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