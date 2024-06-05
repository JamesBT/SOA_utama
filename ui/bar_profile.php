<?php
session_start();
$username = $_SESSION['username'];
$email= $_SESSION['email']
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php include('head.php'); ?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Language and Currency Selection</title>
</head>
<body>
    <?php include('navbar.php'); ?>

    <div class="profile-main-content">
        <div class="profile-container">
            <div class="sidebar-menu">
                <div class="bar-profile">
                    <p class="username"><?= $username;?></p>
                    <p class="email"><?= $email;?></p>
                </div>
                <div class="bar-money">
                    <ul>
                        <li><a href="#" class="tab-link" data-tab="poin.php" onclick="clicked('poin')">Poin</a></li>
                        <li><a href="#" class="tab-link" data-tab="wallet.php" onclick="clicked('wallet')">My Wallet</a></li>
                    </ul>
                </div>
                <div class="bar-links">
                    <ul>
                        <li><a href="?tab=edit_profile.php" class="tab-link" data-tab="edit_profile.php" onclick="clicked('profile')">Account</a></li>
                        <li><a href="#" class="tab-link" data-tab="booking.php" onclick="clicked('booking')">My Booking</a></li>
                        <li><a href="#" class="tab-link" data-tab="purchase_list.php" onclick="clicked('purchase')">Purchase List</a></li>
                        <li><a href="#" class="tab-link" data-tab="promo_list.php" onclick="clicked('promo')">Promo List</a></li>
                        <li><a href="?tab=setting.php" class="tab-link" data-tab="setting.php" onclick="clicked('setting')">Setting</a></li>
                    </ul>
                </div>
            </div>

            <div id="profile-tab-content">
                <?php
                if (isset($_GET['tab'])) {
                    include($_GET['tab']);
                }
                ?>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            function loadTabContent(tab) {
                $('#profile-tab-content').load(tab);
                $('.tab-link').removeClass('selected');
                $('.tab-link[data-tab="' + tab + '"]').addClass('selected');
            }

            const urlParams = new URLSearchParams(window.location.search);
            const tab = urlParams.get('tab');
            if (tab) {
                loadTabContent(tab);
            }

            $('.tab-link').click(function(e) {
                e.preventDefault();
                const tab = $(this).data('tab');
                loadTabContent(tab);
                window.history.pushState(null, '', '?tab=' + tab);
            });
        });

        function clicked(tab) {
            document.querySelectorAll('.sidebar-menu a.tab-link').forEach(button => {
                button.classList.remove('selected');
            });
            document.querySelector(`.sidebar-menu a.tab-link[onclick="clicked('${tab}')"]`).classList.add('selected');
        };
    </script>
</body>
</html>