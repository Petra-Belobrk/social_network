<?php

include '../init.php';
$getFromUser->preventAccess($_SERVER['REQUEST_METHOD'], realpath(__FILE__),realpath($_SERVER['SCRIPT_FILENAME']));

if(isset($_POST['hashtag'])) {
    $hashtag = $getFromUser->checkInput($_POST['hashtag']);
    $mentions = $getFromUser->checkInput($_POST['hashtag']);

    if(substr($hashtag,0,1) === '#') {
        $trends = str_replace('#', '', $hashtag);
        $trends = $getFromTweet->getTrendByHash($trends);

        foreach($trends as $hashtag) {
            echo '<li><a href="#"><span class="getValue">#'.$hashtag->hashtag.'</span></a></li>';
        }
    }
    if(substr($mentions,0,1) === '@') {
        $mentions = str_replace('@', '', $mentions);
        $mentions = $getFromTweet->getMention($mentions);

        foreach($mentions as $mention) {
            echo '<li><div class="nav-right-down-inner">
                    <div class="nav-right-down-left">
                        <span><img src="'.BASE_URL.$mention->profileImage.'"></span>
                    </div>
                    <div class="nav-right-down-right">
                        <div class="nav-right-down-right-headline">
                            <a>'.$mention->screenName.'</a><span class="getValue">@'.$mention->username.'</span>
                        </div>
                    </div>
                </div><!--nav-right-down-inner end-here-->
                </li>';
        }
    }
}



?>
