<?php 
$days = range(1, 31);
$months = array(
    1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June',
    7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'
);
$years = range(1900, date("Y"));

$select_year = isset($_POST['year']) ? $_POST['year'] : '';
$select_month = isset($_POST['month']) ? $_POST['month'] : '';
$select_date = isset($_POST['day']) ? $_POST['day'] : '';
?>

<?php
    $error_message = null;
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (!empty($_POST['username']) && !empty($_POST['email']) && !empty($_POST['password'])) {
            $name = isset($_POST['name']) ? $_POST['name'] : null;
            $username = $_POST['username'];
            $email = $_POST['email'];
            $no_telp = isset($_POST['no_telp']) ? $_POST['no_telp'] : null;
            $gender = isset($_POST['gender']) && $_POST['gender'] !== '' ? $_POST['gender'] : null;
            $date = isset($_POST['day']) ? $_POST['day'] : null;
            $month = isset($_POST['month']) ? $_POST['month'] : null;
            $year = isset($_POST['year']) ? $_POST['year'] : null;

            if ($date && $month && $year) {
                $formattedDay = str_pad($date, 2, '0', STR_PAD_LEFT);
                $formattedMonth = str_pad($month, 2, '0', STR_PAD_LEFT);
                $birthdate = "{$year}-{$formattedMonth}-{$formattedDay}";
            } else {
                $birthdate = null; // Or handle it as needed if the date is incomplete
            }
            $city = isset($_POST['city']) ? $_POST['city'] : null;
            $country = isset($_POST['country']) ? $_POST['country'] : null;
            $password = $_POST['password'];
        

            $data = array(
                'user_name' => $name,
                'user_username' => $username,
                'user_gmail' => $email,
                'tgl_ultah' => $birthdate,
                'no_telp' => $no_telp,
                'gender' => $gender,
                'kota' => $city,
                'negara' => $country,
                'user_password' => $password
            );
            
            $url = "http://localhost:8000/user";
            
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
                header("Location: home.php");
                exit();
            } else if ($httpCode == 400) {
                $error_message = $responseData['detail'];
            }
        } else {
            $error_message = "Username, Email and Password are required";
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
    <style>
        .container-signin {
            background-color: rgb(27,160,226);
            display: flex;
            justify-content: space-between;
        }

        .signin-left-container {
            background-color: rgb(27,160,226);
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signin-left-container h1 {
            color: white;
            font-weight: 600;
            font-size: 80px;
        }

        .signin-right-container {
            width: 50%;
            padding: 60px;
            margin-right: 30px;
        }

        .personal-data {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3) !important;
        }

        .signin-message {
            margin: 10px 10px 5px 10px;
            font-size: 20px;
            color: red;
        }

        .signin-sbt {
            text-align: center;
            margin: 10px;
        }

        .signin-sbt button {
            font-size: 25px;
            font-weight: 500;
            border: none;
            background-color: dodgerblue;
            color: white;
            border-radius: 5px;
            width: 100%;
            height: 10%;
            padding: 5px 0;
        }                       
    </style>
</head>
<body>
    <div class="main-content-signin">
        <div class="container-signin">
            <div class="signin-left-container">
                <h1>WELCOME TO<br>TRAVEL-AGENT</h1>
            </div>
            <div class="signin-right-container">
                <div class="personal-data">
                    <form class="signin-form" method="post" action="signin.php">
                        <div class="personal-label">
                            <p>Daftar</p>
                        </div>
                        <div class="personal-input">
                            <span class="username-label">Name</span>
                            <input class="input-username" type="text" name="name" placeholder="Name">
                        </div>
                        <div class="personal-input">
                            <span class="username-label">Username</span>
                            <input class="input-username" type="text" name="username" placeholder="Username">
                        </div>
                        <div class="personal-input">
                            <span class="email-label">Email</span>
                            <input class="input-email" type="text" name="email" placeholder="Email">
                        </div>
                        <div class="personal-input">
                            <span class="phone-label">Phone Number</span>
                            <input class="input-phone" type="text" name="no_telp" placeholder="Phone Number">
                        </div>
                        <div class="personal-input">
                            <span class="input-label">Gender</span>
                            <select id="gender" name="gender">
                                <option value="">Select gender</option>
                                <option value="1">Male</option>
                                <option value="2">Female</option>
                            </select>
                        </div>
                        <div class="birth-input">
                            <span class="input-label">Birthday</span>
                            <div class="birth-select">
                                <select id="day" name="day">
                                    <option value="" <?php echo ($select_date == '') ? 'selected' : ''; ?>>Select day</option>
                                    <?php foreach($days as $day) : ?>
                                        <option value="<?php echo $day; ?>" <?php echo ($day == $select_date) ? 'selected' : ''; ?>><?php echo $day; ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <select id="month" name="month">
                                    <option value="" <?php echo ($select_month == '') ? 'selected' : ''; ?>>Select month</option>
                                    <?php foreach($months as $month_number => $month_name) : ?>
                                        <option value="<?php echo $month_number; ?>" <?php echo ($month_number == $select_month) ? 'selected' : ''; ?>><?php echo $month_name; ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <select id="year" name="year">
                                    <option value="" <?php echo ($select_year == '') ? 'selected' : ''; ?>>Select year</option>
                                    <?php foreach($years as $year) : ?>
                                        <option value="<?php echo $year; ?>" <?php echo ($year == $select_year) ? 'selected' : ''; ?>><?php echo $year; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="personal-input">
                            <span class="city-label">City</span>
                            <input class="input-city" type="text" name="city" placeholder="City">
                        </div>
                        <div class="personal-input">
                            <span class="country-label">City</span>
                            <input class="input-country" type="text" name="country" placeholder="Country">
                        </div>
                        <div class="personal-input">
                            <span class="password-label">Password</span>
                            <input class="input-password" type="text" name="password" placeholder="Password">
                        </div>
                        <div class="signin-message">
                            <div class="message"> <?php echo $error_message ?> </div>
                        </div>
                        <div class="signin-sbt">
                            <button class="signin-submit-btn" type="submit" name="sigin" onclick="">Lanjutkan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>