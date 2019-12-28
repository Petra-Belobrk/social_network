<?php
	include '../init.php';
$getFromUser->preventAccess($_SERVER['REQUEST_METHOD'], realpath(__FILE__),realpath($_SERVER['SCRIPT_FILENAME']));

if(isset($_POST['deleteComment']) && !empty($_POST['deleteComment'])){
		$user_id  = $_SESSION['user_id'];
		$tweet_id = $_POST['tweet_id'];
		$commentID = $_POST['deleteComment'];
		$getFromUser->delete('comments', array('commentBy' => $user_id, 'commentID' => $commentID));
	}
?>
