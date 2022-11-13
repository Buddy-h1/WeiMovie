<?php

require_once 'connect_db.php';
$date = date("Y-m-d");
$text_comment = filter_var(trim($_POST['text_comment']), FILTER_SANITIZE_STRING);
$user_id = $_SESSION['USER'][0]['id_user'];
$id_rev = $_GET['id'];

$params = [
    'data_comment' => $date,
    'text_comment' => $text_comment,
    'user_id' => $user_id,
    'id_review' => $id_rev
];

$query = $connect->prepare("INSERT INTO comment (data_comment, text_comment, user_id, id_review) VALUES (:data_comment, :text_comment, :user_id, :id_review)");
$query->execute($params);

$new_url = "http://weimovie.ru/show_review.php?id=$id_rev";
header('Location: '.$new_url);

?>