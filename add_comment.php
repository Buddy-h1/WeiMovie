<?php

require_once 'connect_db.php';
$date = date("Y-m-d");
$text_comment = filter_var(trim($_POST['text_comment']), FILTER_SANITIZE_STRING);
$user_id = $_SESSION['USER'][0][0];
$id_rev = $_GET['id'];
mysqli_query($connect, "INSERT INTO comment (data_comment, text_comment, user_id, id_review) VALUES (\"$date\", \"$text_comment\", \"$user_id\", \"$id_rev\");");

$new_url = "http://weimovie.ru/show_review.php?id=$id_rev";
header('Location: '.$new_url);

?>