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
</style>
<body>
    <?php
        include('navbar_2.php');
    ?>
    <div style="padding: 70px; "></div>
    <div style="font-size: 40px; text-align: center; overflow: hidden; padding: 10px; color: white;">Search the best holiday package tour</div>
    <div style="padding-top:50px; margin-left: auto; margin-right: auto; ">
        <div class="mx-auto px-4" style="width:70%;">
            <!-- search box atraksi -->
            <div class="rounded-md w-full flex flex-col gap-5 bg-slate-50 p-5 shadow-md">
                <h1 class="text-sky-600 font-bold">Search Package Tour</h1>
                <!-- City -->
                <div class="w-full">
                    <div class="inline-flex flex-col justify-center relative text-gray-500 w-full">
                        <label for="city_id" class="pb-2">City</label>
                        <div class="relative">
                            <input type="text" name="city_id" id="city_id" class="w-full p-2 pl-10 rounded border border-gray-300 focus:bg-white focus:outline-none focus:ring-2 focus:ring-yellow-600 focus:border-transparent" placeholder="search..."  />
                            <img class="w-6 h-6 absolute left-2 top-2" src="https://d1785e74lyxkqq.cloudfront.net/_next/static/v2/7/7f57d24fd3db681418a3694bd71cb93b.svg" width="24" height="24">
                        </div>
                        <ul id="cityList" class="bg-white border border-gray-100 w-full mt-2 rounded top-16 absolute shadow-md hidden z-10">
                            <li class="pl-8 pr-2 py-1 border-gray-100 relative cursor-pointer hover:bg-yellow-50 hover:text-gray-900">
                                Jogjakarta
                            </li>
                            <li class="pl-8 pr-2 py-1 border-gray-100 relative cursor-pointer hover:bg-yellow-50 hover:text-gray-900">
                                Bali
                            </li>
                            <li class="pl-8 pr-2 py-1 border-gray-100 relative cursor-pointer hover:bg-yellow-50 hover:text-gray-900">
                                Malang
                            </li>
                            <li class="pl-8 pr-2 py-1 border-gray-100 relative cursor-pointer hover:bg-yellow-50 hover:text-gray-900">
                                Jakarta
                            </li>
                            <li class="pl-8 pr-2 py-1 border-gray-100 relative cursor-pointer hover:bg-yellow-50 hover:text-gray-900">
                                Surabaya
                            </li>
                            <li class="pl-8 pr-2 py-1 border-gray-100 relative cursor-pointer hover:bg-yellow-50 hover:text-gray-900">
                                Bandung
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Start & End date Package Tour & Number of Guest-->
                <div class="flex w-full relative gap-4">

                    <!-- start date -->
                    <div class="w-1/3 text-gray-500">
                        <label for="checkin" class="pb-3">From Date</label>
                        <div class="relative w-full mt-2">
                            <input type="date" name="checkin" id="checkin" class="date-input w-full p-2 pl-10 rounded border border-gray-300 focus:bg-white focus:outline-none focus:ring-2 focus:ring-yellow-600 focus:border-transparent" placeholder="search..."  />
                            <svg class="absolute top-2 left-2" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" data-id="IcSystemCalendar"><path d="M7 2V5M17 2V5M3 8H21M11.5 11.5H12.5V12.5H11.5V11.5ZM11.5 16.5H12.5V17.5H11.5V16.5ZM16.5 11.5H17.5V12.5H16.5V11.5ZM6.5 16.5H7.5V17.5H6.5V16.5ZM5 21H19C20.1046 21 21 20.1046 21 19V6C21 4.89543 20.1046 4 19 4H5C3.89543 4 3 4.89543 3 6V19C3 20.1046 3.89543 21 5 21Z" stroke="#687176" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M7.5 11.5V12.5H6.5V11.5H7.5Z" stroke="#0194F3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                        </div>
                    </div>
                    
                    <!-- End Date -->
                    <div class="w-1/3 text-gray-500">
                        <!-- end date tour -->
                        <label for="checkout" class="pb-3">To Date</label>
                        <div class="relative w-full mt-2">
                            <input type="date" name="checkout" id="checkout" class="date-input w-full p-2 pl-10 rounded border border-gray-300 focus:bg-white focus:outline-none focus:ring-2 focus:ring-yellow-600 focus:border-transparent" placeholder="search..."  />
                            <svg class="absolute top-2 left-2" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" data-id="IcSystemCalendar"><path d="M7 2V5M17 2V5M3 8H21M11.5 11.5H12.5V12.5H11.5V11.5ZM11.5 16.5H12.5V17.5H11.5V16.5ZM16.5 11.5H17.5V12.5H16.5V11.5ZM6.5 16.5H7.5V17.5H6.5V16.5ZM5 21H19C20.1046 21 21 20.1046 21 19V6C21 4.89543 20.1046 4 19 4H5C3.89543 4 3 4.89543 3 6V19C3 20.1046 3.89543 21 5 21Z" stroke="#687176" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M7.5 11.5V12.5H6.5V11.5H7.5Z" stroke="#0194F3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                        </div>
                    </div>
                    
                    <!-- guests -->
                    <div class="w-1/3">
                        <label for="people" class="pb-3 text-gray-500">Number of Guests</label>
                        <div class="relative w-full mt-2">
                            <input name="people" name="people" type="number" value="1" min="1" max="20"  class="w-full p-2 pl-10 rounded border border-gray-300 focus:bg-white focus:outline-none focus:ring-2 focus:ring-yellow-600 focus:border-transparent">
                            <img class="absolute top-2 left-2"  src="https://d1785e74lyxkqq.cloudfront.net/_next/static/v2/4/4c4f475da027590bc183e3debcba1a91.svg" style="margin-right: 12px;">
                            <!-- room text place right -->
                            <div class="absolute bottom-2 left-16">Guests</div>
                        </div>
                    </div>
                </div>
                    <div class="w- flex items-end">
                        <!-- Button search -->
                        <a href="agent.php" class="w-full">
                            <button class="w-full text-white p-2 rounded bg-orange-600 hover:bg-orange-700	font-bold flex items-center justify-center gap-1"><img src="https://d1785e74lyxkqq.cloudfront.net/_next/static/v2/6/68a17a4492b3b7647bb89a5a03b15de0.svg"> <div>Search Package Tour</div></button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- container search box atraksi -->
    
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $(document).ready(function(){
        var city_ids = {};
        $('#city').on('input', function(){
            var search = $(this).val();
            if(search != ''){
                $.ajax({
                    url: 'http://107.20.145.163:8003/lokasi/'+ search,
                    type: 'GET',
                    success: function(response){
                        hasil = ''
                        for (var i = 0; i < response.data.length; i++) {
                            city_ids[response.data[i].nama_kota] = response.data[i].id;
                            console.log(response.data[i].nama_kota)
                            hasil+= `<li class="pl-8 pr-2 py-1 border-gray-100 relative cursor-pointer hover:bg-yellow-50 hover:text-gray-900">
                                `+response.data[i].nama_kota+`
                            </li>`
                            
                        }
                        $('#cityList').html(hasil);
                        $('#cityList').removeClass('hidden')
                        console.log('searching...');
                    }
                });
            }
        });
        $(document).on('click', 'li', function(){
            $('#city').val($(this).text());
            // remove space
            $('#city').val($('#city').val().replace(/\s/g, ''));
            $('#cityList').addClass('hidden');
        });
        // checkout 
        $('#checkin').on('change', function(){
            var checkin = $(this).val();
            var duration = $('#duration').val();
            var date = new Date(checkin);
            date.setDate(date.getDate() + parseInt(duration));

            var dd = String(date.getDate()).padStart(2, '0');
            var mm = String(date.getMonth() + 1).padStart(2, '0'); // January is 0
            var y = date.getFullYear();

            var checkout = y + '-' + mm + '-' + dd;

            console.log(checkout);
            if (checkout != 'NaN-NaN-NaN'){
                $('#checkout').val(checkout);
            }
        });
        // go to search package
        $('#gosearchpackage').on('click', function(){
            var city = $('#city').val();
            var checkin = $('#checkin').val();
            var checkout = $('#checkout').val();
            var people = $('#people').val();
            window.location.href = `agent.php?city=${city}&checkin=${checkin}&checkout=${checkout}&people=${people}`;
        });

    })
</script>
</body>
</html>