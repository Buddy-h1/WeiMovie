<?php

$servername = "localhost";
$username = "root";
$password = "1234";
$database = "movie_review_db";

// Создаем соединение
$connect = mysqli_connect($servername, $username, $password, $database);
session_start();

?>