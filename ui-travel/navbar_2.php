<?php 

if (session_status() === PHP_SESSION_NONE) {
  session_start();
} 
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true) {
  $username = $_SESSION['username'];
  $email = $_SESSION['email'];
  $login = $_SESSION['loggedin']; 
  $userID = $_SESSION['user_id'];
} else {
  $login = false; 
}

?>
<div >
  <nav class="nav"style="padding:0px 0 15px 0" >
      <div class="nav-container" style="background-color:white; padding:10px">
          <div id="header" class="header">
              <div class="header-title">
                  <a href="home.php">Company</a>
              </div>

              <div id="headerList" class="header-list ml-auto">
                  <ul class="headlinks">
                      <li><a href="#" id="lang-modal" class="language-opt">ID | IDR</a></li>
                      <li><a href="#">Promo</a></li>
                      <li class="dropdown-navbar">
                          <a class="dropbtn">Bantuan</a>
                          <div class="dropdown-content-navbar">
                              <a href="#">Pusat Bantuan</a>
                              <a href="#">Hubungi Kami</a>
                          </div>
                      </li>
                      <!-- <p><?php echo $login; ?>h</p> -->
                      <li><a href="#">Pesanan</a></li>
                      <?php if (isset($login) && $login) : ?>
                      <li class="dropdown-navbar">
                        <a id="profileButton" href="#" onclick="showProfileDropdown(event)">Profile</a>
                          <div class="profile-dropdown">
                              <div class="profile-account">
                                  <a class="profile" href="#"><?php echo $username; ?></a>
                              </div>
                              <div class="profile-dr-content">
                                  <a href="bar_profile.php?tab=edit_profile.php">Edit Profile</a>
                                  <a href="#">My Booking</a>
                                  <a href="#">Purchase List</a>
                                  <a href="#">Promo Info</a>
                                  <a href="bar_profile.php?tab=setting.php">Setting</a>
                                  <a href="logout.php">Log Out</a>
                              </div>
                          </div>
                      </li>
                      <?php else : ?>
                          <li><a id="login-btn-modal" class="outline" href="loginpage.php?redirect_url=<?php echo urlencode("http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"); ?>">Login</a></li>
                          <li><a id="signup-btn-modal" class="active" href="signin.php">Daftar</a></li>
                      <?php endif; ?>
                      <li>
                          <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                              <i class="fa fa-bars"></i>
                          </a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
      <div id="langModal" class="modal">
          <div class="language-modal-content">
            <div class="flex-container">
              <div class="left-side">
                  <label>Bahasa & Negara</label>
                  <div class="button-list">
                      <button onclick="selectLanguage('ID')">Indonesia</button>
                      <button onclick="selectLanguage('EN')">English</button>
                      <button onclick="selectLanguage('MS')">Malaysia</button>
                      <button onclick="selectLanguage('PH')">Filipina</button>
                      <button onclick="selectLanguage('SGP')">Singapore</button>
                      <button onclick="selectLanguage('VT')">Viet Nam</button>
                      <button onclick="selectLanguage('AU')">Australia</button>
                  </div>
              </div>
              <div class="right-side">
                  <label>Mata Uang</label>
                  <div class="button-list">
                      <button onclick="selectCurrency('IDR')">Rupiah Indonesia</button>
                      <button onclick="selectCurrency('USD')">Dolar AS</button>
                      <button onclick="selectCurrency('MYR')">Ringgit Malaysia</button>
                      <button onclick="selectCurrency('PHP')">Peso Filipina</button>
                      <button onclick="selectCurrency('SGD')">Dolar Singapore</button>
                      <button onclick="selectCurrency('VND')">Vietnamese Dong</button>
                      <button onclick="selectCurrency('AUD')">Dolar Australia</button>
                  </div>
              </div>
              <span class="close-language">&times;</span>
            </div>
              <div class="apply-button-container">
                  <button id="apply-btn" onclick="applySelection()">Apply</button>
              </div>
          </div>
      </div>
  </nav>
</div>


<script>
function myFunction() {
  var x = document.querySelector("#headerList ul");
  if (x.className === "header-list") {
    x.className += " responsive";
  } else {
    x.className = "header-list";
  }
}
</script>

<script>
    let selectedLanguage = 'EN';
    let selectedCurrency = 'USD';
    var modal = document.getElementById("langModal");
    var btn = document.getElementById("lang-modal");

    btn.onclick = function() {
      document.getElementById("langModal").style.display = "block";
    }

    document.getElementsByClassName("close-language")[0].onclick = function() {
      document.getElementById("langModal").style.display = "none";
    }

    function selectLanguage (language) {
      selectedLanguage = language;
      document.querySelectorAll('.left-side .button-list button').forEach(button => {
        button.classList.remove('selected');
      });
      document.querySelector(`.left-side .button-list button[onclick="selectLanguage('${language}')"]`).classList.add('selected');
    };

    function selectCurrency (currency) {
      selectedCurrency = currency;
      document.querySelectorAll('.right-side .button-list button').forEach(button => {
        button.classList.remove('selected');
      });
      document.querySelector(`.right-side .button-list button[onclick="selectCurrency('${currency}')"]`).classList.add('selected');
    };

    function applySelection() {
      document.querySelector('.language-opt').innerText = `${selectedLanguage} | ${selectedCurrency}`;
      if (modal){
        document.getElementById("langModal").style.display = "none";
      }
    };
</script>

<!-- <script>
  document.getElementById("login-btn-modal").onclick = function() {
    document.getElementById("logModal").style.display = "block";
  }
  document.getElementById("signup-btn-modal").onclick = function() {
    document.getElementById("logModal").style.display = "block";
  }
</script> -->

<script>
  function showProfileDropdown(event) {
    event.preventDefault();
    const profileDropdown = document.getElementsByClassName('profile-dropdown');
    profileDropdown.classList.toggle('show');
}
</script>