<?php
if(isset($_POST['signup'])) {
  $screenName = $_POST['screenName'];
  $email = $_POST['email'];
  $password = $_POST['password'];
  $error = '';

  $email = $getFromUser->checkInput($email);
  $screenName = $getFromUser->checkInput($screenName);
  $password = $getFromUser->checkInput($password);
  if(!filter_var($email)) {
    $error = "Invalid email format";
  } else if(strlen($screenName) > 20) {
    $error = 'Name must be between 6 and 20 characters';
  } else if (strlen($password) < 5) {
    $error = 'Password is too short';
  } else {
    if($getFromUser->checkEmail($email) === true) {
      $error = 'Email is already in use';
    } else {
      $user_id = $getFromUser->create('users', array('email' => $email, 'password' => password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]), 'screenName' => $screenName,
        'profileImage' => 'assets/images/defaultProfileImage.png', 'profileCover' => 'assets/images/defaultCoverImage.png'));
      $_SESSION['user_id'] = $user_id;
      header("Location: includes/signup.php?step=1");
    }
  }

}
?>


<form method="post">
  <div class="signup-div">
    <h3>Sign up </h3>
    <ul>
      <li>
        <input required type="text" name="screenName" placeholder="Full Name"/>
      </li>
      <li>
        <input required type="email" name="email" placeholder="Email"/>
      </li>
      <li>
        <input required type="password" name="password" placeholder="Password"/>
      </li>
      <li>
        <input type="submit" name="signup" Value="Signup for Twitter">
      </li>
    </ul>
    <?php
    if(isset($error)) {
      echo " <li class='error-li'>
      <div class='span-fp-error'>$error</div>
     </li>";
    }
    ?>

  </div>
</form>