<?php 
session_start();
$year = null;   
$month = null; 
$date = null;
$user_id = $_SESSION['user_id'];
$name = $_SESSION['name'];
$username = $_SESSION['username'];
$email = $_SESSION['email'];
$no_telp = $_SESSION['no_telp'];
$birthdate = $_SESSION['birthdate'];
$gender = $_SESSION['gender'];
$city = $_SESSION['kota'];
$country = $_SESSION['negara'];

if ($birthdate) {
    $dateParts = explode('-', $birthdate);

    $year = $dateParts[0];   
    $month = $dateParts[1];  
    $date = $dateParts[2];
}
?>

<?php 
$days = range(1, 31);
$months = array(
    1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June',
    7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'
);
$years = range(1900, date("Y"));

$select_year = isset($_POST['year']) ? $_POST['year'] : $year;
$select_month = isset($_POST['month']) ? $_POST['month'] : $month;
$select_date = isset($_POST['day']) ? $_POST['day'] : $date;
?>

<?php
$error_massage = null;
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['delete_account']) && $user_id) {
        
        $url = "http://34.227.203.225:8003/user/$user_id";
        
        $ch = curl_init($url);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json'  
        ));
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE"); 
        
        $response = curl_exec($ch);
        $responseData = json_decode($response, true);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        
        curl_close($ch);  

        if ($httpCode == 200) {
            session_unset();
            session_destroy();
            header("Location: home.php");
            exit();
        } elseif ($httpCode == 400) {
            $error_massage = isset($responseData['detail']) ? $responseData['detail'] : "An error occurred";
        }
    } 
}
?>


<div class="edit-profile-main-content">
    <div class="edit-profile-container">
        <div class="edit-profile-title">
            <h1>Account</h1>
        </div>
        <div class="tab-edit-profile">
            <button class="edit-tab-links" onclick="openEditTab(event, 'acc-info')">Account Information</button>
            <button class="edit-tab-links" onclick="openEditTab(event, 'pass-info')">Password & Security</button>
        </div>
    </div>

    <div id="acc-info" class="edit-tab-content">
        <div class="personal-data">
            <form class="edit-form" method="post" action="bar_profile.php?tab=edit_profile.php">
                <div class="personal-label">
                    <p>Personal Data</p>
                </div>
                <div class="personal-input">
                    <span class="name-label">Name</span>
                    <input class="input-name" type="text" name="name" placeholder="<?php echo $name; ?>" value="<?php echo $name; ?>">
                </div>
                <div class="personal-input">
                    <span class="username-label">Username</span>
                    <input class="input-name" type="text" name="username" placeholder="<?php echo $username; ?>" value="<?php echo $username; ?>">
                </div>
                <div class="personal-input">
                    <span class="email-label">Email</span>
                    <input class="input-email" type="text" name="email" placeholder="<?php echo $email; ?>" value="<?php echo $email; ?>">
                </div>
                <div class="personal-input">
                    <span class="phone-label">Phone Number</span>
                    <input class="input-phone" type="text" name="no_telp" placeholder="<?php echo $no_telp; ?>" value="<?php echo $no_telp; ?>">
                </div>
                <div class="personal-input">
                    <span class="input-label">Gender</span>
                    <select id="gender" name="gender">
                        <option value="1" <?php if ($gender == 1) echo "selected"; ?>>Male</option>
                        <option value="2" <?php if ($gender == 2) echo "selected"; ?>>Female</option>
                    </select>
                </div>
                <div class="birth-input">
                    <span class="input-label">Birthday</span>
                    <div class="birth-select">
                        <select id="day" name="day">
                            <?php foreach($days as $date) : ?>
                                <option value="<?php echo $date; ?>" <?php echo ($date == $select_date) ? 'selected' : ''; ?>><?php echo $date; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <select id="month" name="month">
                            <?php foreach($months as $month_number => $month_name) : ?>
                                <option value="<?php echo $month_number; ?>" <?php echo ($month_number == $select_month) ? 'selected' : ''; ?>><?php echo $month_name; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <select id="year" name="year">
                            <?php foreach($years as $year) : ?>
                                <option value="<?php echo $year; ?>" <?php echo ($year == $select_year) ? 'selected' : ''; ?>><?php echo $year; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="personal-input">
                    <span class="city-label">City</span>
                    <input class="input-city" type="text" name="city" value="<?php echo $city; ?>">
                </div>
                <div class="personal-input">
                    <span class="country-label">Country</span>
                    <input class="input-country" type="text" name="country" value="<?php echo $country; ?>">
                </div>

                <div class="edit-profile-message">
                <?php
                    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                        if (isset($_POST['name'])) {
                            $name = $_POST['name'];
                        }
                        if (isset($_POST['username'])) {
                            $username = $_POST['username'];
                        }
                        if (isset($_POST['email'])) {
                            $email = $_POST['email'];
                        }
                        if (isset($_POST['no_telp'])) {
                            $no_telp = $_POST['no_telp'];
                        }
                        if (isset($_POST['gender'])) {
                            $gender = $_POST['gender'];
                        }
                        if (isset($_POST['date']) && isset($_POST['month']) && isset($_POST['year'])) {
                            $date = $_POST['day'];
                            $month = $_POST['month'];
                            $year = $_POST['year']; 
                            $formattedDay = str_pad($date, 2, '0', STR_PAD_LEFT);
                            $formattedMonth = str_pad($month, 2, '0', STR_PAD_LEFT);

                            $birthdate = "{$year}-{$formattedMonth}-{$formattedDay}";
                        }

                        if (isset($_POST['city'])) {
                            $city = $_POST['city'];
                        }
                        if (isset($_POST['country'])) {
                            $country = $_POST['country'];
                        }

                        $data = array(
                            'user_name' => $name,
                            'user_username' => $username,
                            'tgl_ultah' => $birthdate,
                            'no_telp' => $no_telp,
                            'gender' => $gender,
                            'kota' => $city,
                            'negara' => $country
                        );
                        
                        $url = "http://34.227.203.225:8003/user/$user_id";
                        
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
                            $_SESSION['loggedin'] = true;
                            $_SESSION['name'] = $name;
                            $_SESSION['username'] = $username;
                            $_SESSION['email'] = $email;
                            $_SESSION['no_telp'] = $no_telp;
                            $_SESSION['birthdate'] = $birthdate;
                            $_SESSION['gender'] = $gender;
                            $_SESSION['kota'] = $city;
                            $_SESSION['negara'] = $country;
                        } elseif ($httpCode == 400) {
                            echo '<div class="message">' . $responseData['detail'] . '</div>';
                        }
                        
                    } 

                    ?>
                </div>

                <div class="edit-sbt">
                  <button class="edit-submit-btn" type="submit" name="edit" href="edit_profile.php" onclick="edit()">Apply</button>
                </div>
            </form>
        </div>
    </div>

    <div id="pass-info" class="edit-tab-content">
        <div class="password-data">
            <form class="pass-form" method="post" action="edit_profile.php">
                <div class="pass-label">
                    <h1>Change Password</h1>
                    <button class="edit-pass-submit-btn" type="submit" name="change_password">Save</button>
                </div>
                <div class="pass-input">
                    <span class="old-pass-label">Old Password</span>
                    <input class="input-old-pass" type="text" name="old_pass">
                </div>
                <div class="pass-input">
                    <span class="new-pass-label">New Password</span>
                    <input class="input-new-pass" type="text" name="new_pass">
                </div>
                <div class="pass-input">
                    <span class="confirm-pass-label">Confirm New Password</span>
                    <input class="input-confirm-pass" type="text" name="confirm_pass">
                </div> 
            </form>
        </div>

        <div class="delete-acc">
            <div class="del-label">
                <h1>Delete Account</h1>
                <p>Once your account is deleted, you will not be able to retrieve your data. This cannot be undone.</p>
                <div class="message"> <?php echo $error_message ?></div>
            </div>
            <form class="del-form" method="post" action="edit_profile.php">
                <div class="del-button">
                    <button class="del-acc-btn" type="submit" name="delete_account">Delete</button>
                </div>
            </form>
        </div>
    </div>
    
    
</div>

<script>
    function openEditTab(evt, tabName) {
        var i, tabcontent, tablinks;

        tabcontent = document.getElementsByClassName("edit-tab-content");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        tablinks = document.getElementsByClassName("edit-tab-links");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>