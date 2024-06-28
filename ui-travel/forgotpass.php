<?php
session_start();
// $_GET['req-email'] = "tesxampp2@gmail.com";
// kirim email nya jek error entah kenapa
?>
<?php
    $error_message = null;
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (isset($_POST['email']) && isset($_POST['new-password'])  && isset($_POST['verif-new-password']) && !empty($_POST['verif-code'])) {
            // $email = $_GET['req-email'];
            $email = $_SESSION['req-email'];
            $password = $_POST['new-password'];
            $verifpassword = $_POST['verif-new-password'];
            if($password == $verifpassword){
                $code = intval($_POST['verif-code']);

                $data = array(
                    'email' => $email,
                    'password' => $password,
                    'kode_ganti_pass' => $code
                );
                
                $url = "http://34.227.203.225:8003/user/forgot";
                
                $ch = curl_init($url);
    
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT'); 
                curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                    'Content-Type: application/json',  
                    'Content-Length: ' . strlen(json_encode($data))  
                ));
                curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data)); 
    
                $response = curl_exec($ch);
                $responseData = json_decode($response, true);
                $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                
                curl_close($ch);  
    
                if ($httpCode == 200) { 
                    $_SESSION = [];
                    session_destroy();
                    header("Location: home.php");
                    exit();
                } elseif ($httpCode == 400) {
                    $error_message = $responseData['detail'];
                }
            }else{
                $error_message = "Password didn't match";
            }
            
        } else {
            $error_message = "Email and Password are required";
        }
    } 
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
    <div class="forgotpass-content">
        <div class="forgotpass-container">
            <div class="forgot-pass">
                <form class="forgot-form" method="post" action="forgotpass.php">
                    <div class="forgot-label">
                        <p>Change Password</p>
                    </div>
                    <div class="forgot-input">
                        <span class="email-label">Email</span>
                        <!-- <input class="input-email" type="text" name="email" value="<?php echo $_GET['req-email'] ?>"> -->
                         <!-- <p class="input-email"><?php echo $_GET['req-email'] ?></p> -->
                         <p class="input-email"><?php echo $_SESSION['req-email'] ?></p>
                    </div>
                    <div class="forgot-input">
                        <span class="new-pass-label">New Password</span>
                        <input class="input-pass" type="text" name="new-password" placeholder="New Password">
                    </div>
                    <div class="forgot-input">
                        <span class="verif-new-pass-label">Verify New Password</span>
                        <input class="input-pass" type="text" name="verif-new-password" placeholder="Verify New Password">
                    </div>
                    <div class="forgot-input">
                        <span class="code-label">Verification Code</span>
                        <input class="input-code" type="text" name="verif-code" placeholder="Verification Code">
                    </div>
                    <div class="check-validate">
                        <div class="message"> <?php echo $error_message ?></div>
                    </div>
                    <div class="forgot-sbt">
                        <button class="forgot-submit-btn" type="submit" name="forgot" href="home.php" onclick="">Konfirmasi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>