<?php
session_start();
    $error_message = null;

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (!empty($_POST['email'])) {
            $email = $_POST['email'];

            $data = array(
                'email' => $email
            );
            
            $url = 'http://localhost:8000/user/forgot';
            
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
                $_SESSION['req-email'] = $email;
                header("Location: forgotpass.php");
                exit();
            } elseif ($httpCode == 400) {
                $error_message = $responseData['detail'];
            }
        } else {
            $error_message = "Email are required";
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
        <div class="forgotpassreq-container">
            <div class="forgot-pass">
                <form class="forgot-form" method="post" action="request_forgot_pass.php">
                    <div class="forgot-label">
                        <p>Forgot Password</p>
                    </div>
                    <div class="forgot-input">
                        <span class="email-label">Email</span>
                        <input class="input-email" type="text" name="email" placeholder="Email">
                    </div>
                    <div class="check-validate">
                        <div class="message"> <?php echo $error_message ?></div>
                    </div>
                    <div class="forgotreq-sbt">
                        <button class="forgot-submit-btn" type="submit" name="forgot" href="forgotpass.php" onclick="">Kirim Kode Verifikasi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>