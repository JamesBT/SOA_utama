<?php include('login.php')?>

<nav class="nav">
    <div class="nav-container">
        <div id="header" class="header">
            <div class="header-title">
                <a href="#">Company</a>
            </div>

            <div id="headerList" class="header-list">
                <ul class="headlinks">
                    <li><a href="#" id="lang-modal" class="language-opt">ID | IDR</a></li>
                    <li><a href="#">Promo</a></li>
                    <li class="dropdown">
                        <a class="dropbtn">Bantuan</a>
                        <div class="dropdown-content">
                            <a href="#">Pusat Bantuan</a>
                            <a href="#">Hubungi Kami</a>
                        </div>
                    </li>
                    <li><a href="#">Pesanan</a></li>
                    <li><a id="login-btn-modal" class="outline" href="#">Login</a></li>
                    <li><a id="signup-btn-modal" class="active" href="#">Daftar</a></li>
                    <li>
                        <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                            <i class="fas fa-bars">YES</i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="navlinks">
            <div id="mainListDiv" class="main-list">
                <ul class="navlinks">
                    <li><a href="#">Hotel</a></li>
                    <li><a href="#">Tiket Pesawat</a></li>
                    <li><a href="#">Rental Mobil</a></li>
                    <li><a href="#">Atraksi dan Aktivitas</a></li>
                    <li><a href="#">Paket Travel</a></li>
                    <li><a href="#">Asuransi</a></li>
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

<script>
  document.getElementById("login-btn-modal").onclick = function() {
    document.getElementById("logModal").style.display = "block";
  }
  document.getElementById("signup-btn-modal").onclick = function() {
    document.getElementById("logModal").style.display = "block";
  }
  document.getElementsByClassName("login-close")[0].onclick = function() {
      document.getElementById("logModal").style.display = "none";
  }
</script>