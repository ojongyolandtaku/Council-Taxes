<?php
if (isset($_POST['login_Tax_Payer'])) {
  $id = mysqli_real_escape_string($db, $_POST['id']);
  $password = mysqli_real_escape_string($db, $_POST['password']);

  if (empty($id)) {
    array_push($errors, "id is required");
  }
  if (empty($password)) {
    array_push($errors, "Password is required");
  }

  if (count($errors) == 0) {
    $password = md5($password);
    $query = "SELECT * FROM Tax_Payer WHERE id='$id' AND password='$password'";
    $results = mysqli_query($db, $query);
    if (mysqli_num_rows($results) == 1) {
      $_SESSION['id'] = $id;
      $_SESSION['success'] = "You are now logged in";
      header('location: home.php');
    }else {
        array_push($errors, "Wrong id/password combination");
    }
  }
}

?>