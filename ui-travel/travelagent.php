<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Agency</title>
    <link rel="stylesheet" href="css/style-travelagent.css">
</head>

<body>
    <div class="container">
        <nav class="navbar">
            <div class="navbar-brand">Travel Agency</div>
            <ul class="navbar-menu">
                <li class="navbar-item"><a href="#home">Home</a></li>
                <li class="navbar-item"><a href="#explore">Book Now</a></li>
                <li class="navbar-item"><a href="#package">Packages</a></li>
                <li class="navbar-item"><a href="#contact">Contact</a></li>
                <li class="navbar-item profile">
                    <a href="#profile">Profile</a>
                    <ul class="dropdown-menu">
                        <li><a href="#profile">Profile</a></li>
                        <li><a href="#settings">Settings</a></li>
                        <li><a href="#logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <img src="images/R.png" alt="background gunung">
        <div class="centered-button">
            <h1 class="main-heading">Tour Around The World</h1>
            <a href="#explore" class="explore-button">Explore Now</a>
        </div>
    </div>
    <div id="explore" class="search-section">
        <h2 class="search-title">Book Now</h2>
        <div class="card">
            <div class="search-content">
                <img src="images/vacation.png" alt="vacation" class="search-image">
                <div class="search-form">
                    <form action="#" method="post">
                        <label for="from">Flying from</label>
                        <input type="text" id="from" name="from" placeholder="flying from">
                        <label for="to">Flying to</label>
                        <input type="text" id="to" name="to" placeholder="flying to">
                        <label for="guests">How Many</label>
                        <input type="number" id="guests" name="guests" placeholder="number of guests">
                        <label for="arrival">Arrivals</label>
                        <input type="date" id="arrival" name="arrival">
                        <label for="leaving">Return</label>
                        <input type="date" id="leaving" name="leaving">
                        <button type="submit">Book Now</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <h2 class="search-package">Package</h2>
    <div class="cardd-container">
        <div class="package-card">
            <img src="images/R.png" alt="Package 1">
            <div class="package-details">
                <br>
                <h3>Package Name 1</h3>
                <br>
                <p>Departure Date: 01-07-2024</p>
                <p>Return Date: 02-07-2024</p>
                <p>Number of People: 2</p>
                <p>Quota: 10</p>
                <h4>Rp10.000.000</h4>
                <br>
                <button class="detail-button" data-package="1">Details</button>
            </div>
        </div>
        <div class="package-card">
            <img src="images/R.png" alt="Package 2">
            <div class="package-details">
                <br>
                <h3>Package Name 2</h3>
                <br>
                <p>Departure Date: 01-08-2024</p>
                <p>Return Date: 02-08-2024</p>
                <p>Number of People: 4</p>
                <p>Quota: 8</p>
                <h4>Rp20.000.000</h4>
                <br>
                <button class="detail-button" data-package="2">Details</button>
            </div>
        </div>
        <div class="package-card">
            <img src="images/R.png" alt="Package 3">
            <div class="package-details">
                <br>
                <h3>Package Name 3</h3>
                <br>
                <p>Departure Date: 01-09-2024</p>
                <p>Return Date: 02-09-2024</p>
                <p>Number of People: 6</p>
                <p>Quota: 5</p>
                <h4>Rp40.000.000</h4>
                <br>
                <button class="detail-button" data-package="3">Details</button>
            </div>
        </div>
    </div>

    <div id="package-modal" class="modal">
        <div class="modal-content">
            <span class="close-button">&times;</span>
            <h2>Package Details</h2>
            <p id="package-description">Description: A wonderful package tour.</p>
            <p>Origin City: <span id="origin-city"></span></p>
            <p>Destination City: <span id="destination-city"></span></p>
            <br>
            <div id="day-details">

            </div>
            <br>
            <button id="prev-day" class="carousel-button"><</button>
            <button id="next-day" class="carousel-button">></button>
            <button class="carousel-buy-button">Buy</button>

        </div>
    </div>

    <script src="assets/script.js"></script>
</body>

</html>