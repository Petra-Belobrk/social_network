<?php

//$dsn = 'mysql:host=database.socialnetwork.internal; dbname=social';
//$user = '5ra';
//$pass = 'secret';

$dsn = 'mysql:host=localhost; dbname=social';
$user = 'root';
$pass = '';

try{
  $pdo = new PDO($dsn, $user, $pass);
} catch (PDOException $error) {
  echo 'Connection error! ' . $error->getMessage();
}
