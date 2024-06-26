<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include('header.php'); ?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Language and Currency Selection</title>
</head>
<body>
    <?php
    include('navbar.php');
    ?>
    <div class="main-content">
        <div class="container-fluid-home">
            <div class="home-content">
                <div class="home-text">
                    <h1>Wujudkan Perjalananmu dengan Caramu</h1>
                </div>
                <div class="tab-service" >
                    <button class="tablinks" onclick="location.href='searchhotel.php'">Hotel</button>
                    <button class="tablinks" onclick="location.href='searchflight.php'">Tiket Pesawat</button>
                    <button class="tablinks" onclick="location.href='searchcar.php'">Rental Mobil</button>
                    <button class="tablinks" onclick="location.href='searchatraksi.php'">Atraksi & Aktivitas</button>
                    <button class="tablinks" onclick="location.href='searchpackage.php'">Paket Travel</button>
                    <button class="tablinks" onclick="location.href='insurance.php'">Asuransi</button>
                </div>
            </div>

            <div class="recommend-content" style="padding-top: 50px; padding-bottom: 20px;">
                <div class="isi promo" style="margin-left: 185px; margin-right: 185px;">
                    <h1 style="font-size: 30px; font-weight: 700; color: #434343;">Promo Travel SOA 2024!</h1>
                    <div style="padding: 10px;"></div>
                    <div class="promo-img" style="display: flex; justify-content: center; align-items: center; margin: 0px;">
                        <img src="assets\images\bannerr.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>

                <div class="opsi rencana" style="margin-top: 50px; margin-left: 185px; margin-right: 185px; display: flex; flex-direction: column;">
                    <h1 style="font-size: 30px; font-weight: 700; color: #434343; padding: 10px;">Maksimalkan Rencana Sesukamu!</h1>    
                    <div style="display: flex; justify-content: space-between; width: 100%;">
                        <div class="block" style="text-align: center; width: calc(33.33% - 20px); margin-bottom: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 10px; overflow: hidden;">
                            <img src="https://ik.imagekit.io/tvlk/image/imageResource/2023/06/20/1687227628216-01662dc275f08dc8f7f49f7d58c0e83f.png?tr=q-75,w-320" style="width: 100%; height: auto;" alt="Image 1">
                            <h2 style="margin-top: 10px; color: #434343; font-weight: 500; font-size: 20px; padding: 10px;">Tur dan Atraksi</h2>
                        </div>
                        <div class="block" style="text-align: center; width: calc(33.33% - 20px); margin-bottom: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 10px; overflow: hidden;">
                            <img src="https://ik.imagekit.io/tvlk/image/imageResource/2023/06/20/1687227638861-6acf4db6f62a44addcb7ea92a26a516a.png?tr=q-75,w-320" style="width: 100%; height: auto;" alt="Image 2">
                            <h2 style="margin-top: 10px; color: #434343; font-weight: 500; font-size: 20px; padding: 10px;">Paket Travel</h2>
                        </div>
                        <div class="block" style="text-align: center; width: calc(33.33% - 20px); margin-bottom: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 10px; overflow: hidden;">
                            <img src="https://ik.imagekit.io/tvlk/image/imageResource/2023/06/20/1687227654440-0eda1db39eea33c836b55086633e970a.png?tr=q-75,w-320" style="width: 100%; height: auto;" alt="Image 3">
                            <h2 style="margin-top: 10px; color: #434343; font-weight: 500; font-size: 20px; padding: 10px;">Asuransi</h2>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <?php
    include('footer.php');
    ?>
</body>
</html>
