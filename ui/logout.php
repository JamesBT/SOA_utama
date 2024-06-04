<?php
session_start();

$_SESSION = [];

session_destroy();
unset($_SESSION["loggedin"]);
unset($_SESSION["username"]);
unset($_SESSION["email"]);
header("Location: home.php"); 
exit();
?>