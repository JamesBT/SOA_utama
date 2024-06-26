<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="css/navbar.css">
</head>
<style>
    body {
      background-image: url('https://digital.ihg.com/is/image/ihg/ic-brand-refresh-homepg-img-tab-rome-1440x617');
      background-size: cover; 
      background-position: center; 
    }
    html, body {
        margin:0;
        padding: 0;
        height: 100%;
    }
    input[type="date"]::-webkit-inner-spin-button,
    input[type="date"]::-webkit-calendar-picker-indicator {
        display: hidden;
        -webkit-appearance: none;
        left: 0.6em;
        width: 5%;
        opacity: 0;
        position: absolute;
        z-index: 2;
        cursor: pointer;
    }
    .bg-gradient-custom-blue {
        background: rgb(25, 50, 124);
        background: linear-gradient(143deg, rgba(25, 50, 124, 1) 0%, rgba(42, 123, 209, 1) 56%, rgba(75, 145, 224, 1) 100%);
    }
    .flex-center {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    a {
        text-decoration: none;
        color: inherit;
    }
</style>
<body>
    <?php include('navbar_2.php'); ?>
    <div style="padding: 70px;"></div>
    <div style="font-size: 40px; text-align: center; overflow: hidden; padding: 10px; color: white;">Choose the best holiday package tour</div>
    <div style="padding-top:50px; margin-left: auto; margin-right: auto;">
        <div class="mx-auto px-3" style="width:15%;">
            <!-- search box atraksi -->
            <div class="rounded-md w-full flex flex-col gap-5 bg-slate-50 p-5 shadow-md flex-center">
                <a href="TA_Louis_index.html">
                    <h1 class="text-sky-600 font-bold">Louis Tour</h1>
                </a>
            </div>
        </div>
        <br>
        <div class="mx-auto px-3" style="width:15%;">
            <!-- search box atraksi -->
            <div class="rounded-md w-full flex flex-col gap-5 bg-slate-50 p-5 shadow-md flex-center">
                <a href="TA_Nicho_index.html">
                    <h1 class="text-sky-600 font-bold">Nicholas Tour</h1>
                </a>
            </div>
        </div>
        <br>
        <div class="mx-auto px-3" style="width:15%;">
            <!-- search box atraksi -->
            <div class="rounded-md w-full flex flex-col gap-5 bg-slate-50 p-5 shadow-md flex-center">
                <a href="TA_Timothy_index.html">
                    <h1 class="text-sky-600 font-bold">Timothy Tour</h1>
                </a>
            </div>
        </div>
    </div>
    <!-- container search box atraksi -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    // JavaScript code if needed
</script>
</body>
</html>
