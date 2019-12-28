<?php
if ($_SERVER['REQUEST_METHOD'] == "GET" && realpath(__FILE__) == realpath($_SERVER['SCRIPT_FILENAME'])) {
    header('Location: ../index.php');
}
if(isset($_POST['login']) && !empty($_POST['login'])) {
  $email = $_POST['email'];
  $password = $_POST['password'];

  $email = $getFromUser->checkInput($email);
  $password = $getFromUser->checkInput($password);

  if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $error = "Invalid email format";
  } else {
      if($getFromUser->login($email, $password) === false) {
        $error = "Incorrect email or password";
      }
  }
}

?>

<div class="login-div">
  <form method="post">
    <ul>
      <li>
        <input required type="email" name="email" placeholder="Please enter your Email here"/>
      </li>
      <li>
        <input required type="password" name="password" placeholder="password"/><input type="submit" name="login" value="Log in"/>
      </li>
      <li>
        <input type="checkbox" Value="Remember me">Remember me
      </li>
      <?php
      if(isset($error)) {
        echo "<li class='error-li'>
      <div class='span-fp-error'>$error</div>
     </li>  ";
      }
      ?>
    </ul>

  </form>
</div>
