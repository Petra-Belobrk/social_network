<?php
	include '../init.php';
$getFromUser->preventAccess($_SERVER['REQUEST_METHOD'], realpath(__FILE__),realpath($_SERVER['SCRIPT_FILENAME']));

if(isset($_POST['fetchPost']) && !empty($_POST['fetchPost'])){
		$user_id = $_SESSION['user_id'];
		$limit   = (int) trim($_POST['fetchPost']);
		$getFromTweet->tweets($user_id, $limit);
	}
?>
