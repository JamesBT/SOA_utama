<?php 
session_start();
$username = $_SESSION['username'];
$email = $_SESSION['email'];
?>

<?php 
$days = range(1, 31);
$months = array(
    1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June',
    7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'
);
$years = range(1900, date("Y"));

$select_year = isset($_POST['year']) ? $_POST['year'] : '';
$select_month = isset($_POST['month']) ? $_POST['month'] : '';
$select_day = isset($_POST['day']) ? $_POST['day'] : '';

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
            <form class="edit-form" method="post" action="edit_profile.php">
                <div class="personal-label">
                    <p>Personal Data</p>
                </div>
                <div class="personal-input">
                    <span class="name-label">Username</span>
                    <input class="input-name" type="text" name="username" placeholder="<?php echo htmlspecialchars($username); ?>">
                </div>
                <div class="personal-input">
                    <span class="email-label">Email</span>
                    <input class="input-email" type="text" name="email" placeholder="<?php echo $email; ?>">
                </div>
                <div class="personal-input">
                    <span class="phone-label">Phone Number</span>
                    <input class="input-phone" type="text" name="phoneNumber" placeholder="+620000000000">
                </div>
                <div class="personal-input">
                    <span class="input-label">Gender</span>
                    <select id="gender" name="gender">
                        <option value="female">Female</option>
                        <option value="male">Male</option>
                    </select>
                </div>
                <div class="birth-input">
                    <span class="input-label">Birthday</span>
                    <div class="birth-select">
                        <select id="day" name="day">
                            <?php foreach($days as $day) : ?>
                                <option value="<?php echo $day; ?>" <?php echo ($day == $select_day) ? 'selected' : ''; ?>><?php echo $day; ?></option>
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
                    <input class="input-city" type="text" name="username" placeholder="City">
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
            </div>
            <div class="del-button">
                <button class="del-acc-btn" type="submit" name="delete_account">Delete</button>
            </div>
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