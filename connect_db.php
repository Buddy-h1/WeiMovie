<?php

$servername = "127.0.0.1";
$username = "root";
$password = "1234";
$database = "movie_review_db";

$connect = mysqli_connect($servername, $username, $password, $database);
session_start();

?>