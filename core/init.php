<?php
include 'database/conection.php';
include 'classes/User.php';
include 'classes/Tweet.php';
include 'classes/Follow.php';
include 'classes/Message.php';

global $pdo;

session_start();

$getFromUser = new User($pdo);
$getFromFollow = new Follow($pdo);
$getFromTweet = new Tweet($pdo);
$getFromMessage = new Message($pdo);

define("BASE_URL", "http://localhost/social_network/");
