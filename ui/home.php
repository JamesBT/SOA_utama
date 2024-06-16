
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include('head.php'); ?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Language and Currency Selection</title>
</head>
<body>
    <?php
    include('navbar.php');
    ?>
    <div class="main-content">
        <div class="container-fluid">
            <div class="home-content">
                <div class="home-text">
                    <h1>Wujudkan Perjalananmu dengan Caramu</h1>
                </div>
                <div class="search-bar">
                    <input class='input-search' name='search' type="text" placeholder="Mau ke mana hayo?">
                </div>
                <div class="tab-service">
                    <button class="tablinks" onclick="">Hotel</button>
                    <button class="tablinks" onclick="">Tiket Pesawat</button>
                    <button class="tablinks" onclick="">Rental Mobil</button>
                    <button class="tablinks" onclick="">Atraksi dan Aktivitas</button>
                    <button class="tablinks" onclick="">Paket Travel</button>
                    <button class="tablinks" onclick="">Asuransi</button>
                </div>
            </div>

            <div class="recommend-content">
                <div class="promo-text">
                    <h1>PROMO 2024!</h1>
                </div>
                <div class="promo-img">
                    <img src="assets\images\bannerr.jpg" class="d-block w-100" alt="...">
                </div>
            </div>  
        </div>
    </div>
    <?php
    include('footer.php');
    ?>
</body>
</html>
