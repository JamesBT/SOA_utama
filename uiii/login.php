<?php
session_start();
$_SESSION['loggedin'] = false;
$valid_email = 'user@example.com';

$response = ['status' => 'error', 'message' => 'Invalid login credentials'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];

    if ($email === $valid_email) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = 'Guest';
        $_SESSION['email'] = $valid_email;
        $response = ['status' => 'success', 'username' => $_SESSION['username'], 'email' => $_SESSION['email']];
    }
}
?>

<div id="logModal" class="log-modal">
      <div class="login-modal-cnt">
          <form class="login-form" method="post" action="home.php">
              <span class="login-close">&times;</span>
              <span class="login-title">Login/Daftar</span>

              <div class="validate-input">
                  <span class="input-label">Email/No. Handphone</span>
                  <input class="input-txt" type="text" name="email" placeholder="Masukkan email atau no. handphone-mu">
              </div>

              <div class="login-sbt">
                  <button class="submit-btn" type="submit" name="login" href="login.php" onclick="login()">Lanjutkan</button>
              </div>

              <p>atau login/daftar dengan</p>

              <div class="oth-login">
                  <button>Lanjut dengan Google</button>
                  <button>Lanjut dengan Facebook</button>
              </div>

              <p>Dengan mendaftar, kamu menyetujui <a href="#">&nbsp;Syarat & Ketentuan&nbsp;</a> yang berlaku dan kamu sudah membaca <a href="#">&nbsp;Pemberitahuan Privasi&nbsp;</a> kami.</p>
          </form>
      </div>
  </div>





