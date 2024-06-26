<?php
session_start();

$_SESSION = [];

session_destroy();
unset($_SESSION["loggedin"]);
unset($_SESSION["username"]);
unset($_SESSION["email"]);
echo '<script>
        localStorage.removeItem("userID");
        window.location.href = "home.php";
    </script>';
exit();
?>