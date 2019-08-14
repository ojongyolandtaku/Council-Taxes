
<?php
session_start();

// connect to the database
$db = mysqli_connect('localhost', 'yolanda', 'y1.......');

// REGISTER Tax_Payer
mysli_select_db($db, 'mydb');

  // receive all input values from the form
  $id =  $_POST['id'];
  $name = $_POST['name'];
  $sex = $_POST['sex'];
  $nid = $_POST['nid'];
  $contact =  $_POST['contact'];
  $taxType =  $_POST['taxType'];
  $busLoc =  $_POST['busLoc'];
  $email = $_POST['email'];
  $password =  $_POST['password'];

  // form validation: ensure that the form is correctly filled ...
  if (empty($id)) { echo "PayerId is required"; }
  if (empty($taxType)) { echo "taxType is required"; }
  if (empty($email)) { echo "Email is required"; }
  if (empty($password)) { echo "Password is required"; }

  // first check the database to make sure 
  // a payer does not already exist with the same payer id number
  $ta = "SELECT * FROM Tax_Payer WHERE id='$id'";
  $result = mysqli_query($db, $ta);
  $num = mysqli_num_rows($result);
  
   // if payer exists
  if ($num['id'] === $id) {
      echo "PayerId already exists";
    }else

  // Finally, register payer if there are no errors in the form

    $query = "INSERT INTO Tax_Payer(id, name, sex, nid, contact, taxType, busLoc, email, password) 
              VALUES('$id', '$name', '$sex', '$nid', '$contact', '$taxType', '$busLoc',  '$email', '$password')";
    mysqli_query($db, $query);
    echo "Registration succefully";
  }

?>
