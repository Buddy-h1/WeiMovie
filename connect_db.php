<?php

$servername = "127.0.0.1";
$username = "root";
$password = "1234";
$database = "movie_review_db";

$connect = new PDO("mysql:host=$servername;dbname=$database;charset=utf8", $username, $password);

session_start();

?>