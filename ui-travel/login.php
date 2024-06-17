<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<div id="logModal" class="log-modal">
      <div class="login-modal-cnt">
          <form id="loginForm" class="login-form" method="POST" action="home.php">
              <span class="login-close">&times;</span>
              <span class="login-title">Login/Daftar</span>
            
              <div class="validate-input">
                  <span class="input-label">Email/No. Handphone</span>
                  <input class="input-txt" type="text" name="email" placeholder="Masukkan email atau no. handphone-mu">
              </div>
              <div class="validate-input">
                  <span class="input-label">Password</span>
                  <input class="input-txt" type="text" name="password" placeholder="Masukkan password">
              </div>

              <div class="check-validate">
                <?php
                    $_SESSION['loggedin'] = false;

                    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                        if (isset($_POST['email']) && isset($_POST['password'])) {
                            $email = $_POST['email'];
                            $password = $_POST['password'];

                            $data = array(
                                'email' => $email,
                                'password' => $password
                            );
                            
                            $url = 'http://localhost:8000/user/auth';
                            
                            $ch = curl_init($url);

                            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  
                            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                                'Content-Type: application/json',  
                                'Content-Length: ' . strlen(json_encode($data))  
                            ));
                            curl_setopt($ch, CURLOPT_POST, true); 
                            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data)); 
                            
                            $response = curl_exec($ch);
                            $responseData = json_decode($response, true);
                            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                            
                            curl_close($ch);  

                            if ($httpCode == 200) { 
                                $_SESSION['loggedin'] = true;
                                $_SESSION['user_id'] = $responseData['user_id'];
                                $_SESSION['name'] = $responseData['name'];
                                $_SESSION['username'] = $responseData['username'];
                                $_SESSION['email'] = $responseData['email'];
                                $_SESSION['no_telp'] = $responseData['no_telp'];
                                $_SESSION['birthdate'] = $responseData['tgl_ultah'];
                                $_SESSION['gender'] = $responseData['gender'];
                                $_SESSION['kota'] = $responseData['kota'];
                                $_SESSION['negara'] = $responseData['negara'];
                            } elseif ($httpCode == 400) {
                                echo '<div class="message">' . $responseData['detail'] . '</div>';
                                
                            }
                        } else {
                            echo '<div class="message">Email and Password are required.</div>';
                        }
                    } 

                    ?>  
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

  <!-- <script>
    document.getElementsByClassName('login-form').addEventListener('submit', function(event) {
          event.preventDefault();
          const email = document.getElementById('email').value;

          fetch('login.php', {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/x-www-form-urlencoded'
              },
              body: new URLSearchParams({
                  'email': email
              })
          })
          // .then(response => response.json())
          .then(response => {
              if (!response.ok) {
                  throw new Error('Network response was not ok');
              }
              return response.json();
          })
          .then(data => {
              if (data.status === 'success') {
                  console.log('Login successful!');
                  document.getElementsByClassName("login-close")[0].onclick = function() {
                      document.getElementById("logModal").style.display = "none";
                  }
                  window.location.reload(true);
              } else {
                  alert('Login failed: ' + data.message);
              }
          })
          .catch(error => console.error('Error:', error));
      });
    </script> -->





