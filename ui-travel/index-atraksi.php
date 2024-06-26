<?php

$service_id = $_GET['service_id'];
$visit_date = $_GET['visit_date'];

$api_url = 'http://localhost:8000/api/atraksi';

// Read JSON file
// $json_data = file_get_contents($api_url);

// // Decode JSON data into PHP array
// $response_data = json_decode($json_data);

// echo json_encode($response_data);
// die;
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atraksi</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bootstrap icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- jQuery UI CSS -->
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
    <style>
        .caraousel-image {
            max-width: 750px;
            min-width: 700px;
        }

        .infopenting {
            background-color: #e1eaf7;
            border: none;
        }

        .mapouter {
            position: relative;
            text-align: right;
            height: 560px;
            width: 820px;
        }

        .gmap_canvas {
            overflow: hidden;
            background: none !important;
            height: 560px;
            width: auto;
        }

        #gmap_canvas {
            overflow: hidden;
            background: none !important;
            width: 100%;
        }

        .btn-paket-date {
            /* background-color: #e1eaf7; */
            color: black;
            padding: 7px 15px;
            border: 1px solid black;
            border-radius: 50px;
        }

        .btn-paket-date.active {
            border: 1px solid #386ffc;
            color: #386ffc;
            background-color: aliceblue;
        }

        .unavail {
            color: #9c9c9c;
        }

        .paket-unavail {
            background-color: grey;
            color: white;
            border-radius: 0px 0px 5px 5px;
        }

        .btn-modal-paket a {
            color: black;
            font-size: 18px;
        }
    </style>
</head>

<body>
    <div id="loader" style="position: absolute;top:50%;left:50%;transform: translate(-50%, -50%)">
        <img src="./Ellipsis@1x-1.0s-200px-200px.svg" alt="">
    </div>

    <div id="content" class="container mt-4 d-none">
        <!-- caraousel -->
        <div class="d-flex justify-content-center">
            <div id="carouselExampleIndicators" class="carousel slide caraousel-image">
                <div class="carousel-indicators">
                    <!-- <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
                </div>
                <div class="carousel-inner" id="atraksi-img">
                    <!-- <div class="carousel-item active">
                        <img src="./download.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./images.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./Tiket Dunia Fantasi di Jakarta.jpg" class="d-block w-100" alt="...">
                    </div> -->
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>


        <div class="ms-5 me-5">

            <ul class="nav nav-underline sticky-top bg-body-tertiary">
                <li class="nav-item">
                    <a class="nav-link text-dark navjs active ringkasan" href="#ringkasan">Ringkasan</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark navjs highlight" href="#highlight">Highlight</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark navjs paket" href="#paket">Paket</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark navjs review" href="#review">Review</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark navjs lokasi" href="#lokasi">Lokasi</a>
                </li>

            </ul>
            <hr>


            <div>
                <section id="ringkasan">
                    <div class="d-flex justify-content-between">
                        <div>
                            <h1 class="mb-5" id="title">Loading... </h1>
                            <div class="mb-3">
                                <a href="#lokasi" class="text-decoration-none text-dark" id="alamat"></a>
                            </div>
                            <div class="mb-4">
                                <a href="" class="text-decoration-none text-dark" id="jam-buka" type="button" data-bs-toggle="modal" data-bs-target="#jamBuka">
                                    <!-- <i class="bi bi-clock-fill"></i> Buka &#x25CF Sabtu &#x25CF 10:00-20:00 <i class="bi bi-chevron-right"></i> -->

                                </a>
                            </div>
                        </div>
                        <div>
                            <p class="m-0">Mulai dari</p>
                            <h3><span class="text-danger" id="lowest-price">Loading...</span></h3>
                            <a class="btn btn-primary" href="#paket">Lihat Paket</a>
                        </div>
                    </div>
                </section>

                <section id="highlight">
                    <div class="card mb-4 infopenting">
                        <div class="card-body ">
                            <h5 class="card-title">Info Penting & Highlight</h5>
                            <!-- <h6 class="card-subtitle mb-2 text-body-secondary">Card subtitle</h6> -->

                            <a href="" class="card-link text-decoration-none fw-bolder" type="button" data-bs-toggle="modal" data-bs-target="#highlight-modal">Baca Selengkapnya</a>
                        </div>
                    </div>
                </section>
                <hr>

                <section id="paket">
                    <div class="row">
                        <div class="col-9 col-lg-12 col-md-12 col-sm-12">
                            <h3 class="mt-5">Paket</h3>
                            <p class="mb-4">Cek Ketersediaan paket</p>
                            <div id="filter-date">
                                <a class="btn-paket-date text-decoration-none">Besok</a>
                                <a class="btn-paket-date text-decoration-none"></a>
                                <a class="btn-paket-date text-decoration-none"></a>
                                <a class="btn-paket-date text-decoration-none" id="btn-date">Lainnya ></a>
                                <a class="text-decoration-none p-2 fw-bold" id="paket-filter-reset">Reset</a>
                            </div>
                            <div id="paket-loader" class="">
                                <img src=" ./Ellipsis@1x-1.0s-200px-200px.svg" alt="">
                            </div>
                            <div class="card infopenting m-4">
                                <div class="m-4 mt-0" id="paket-container">

                                    <!-- card jenis paket -->
                                    <!-- <div class="card mt-3">
                                        <div class="card-body unavail">
                                            <h5 class="card-title">Reguler Weekday Dufan (belum termasuk tiket Ancol)</h5>
                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <p class=" fw-bold fs-4 m-0 unavail">IDR 100.000</p>
                                                <a href="#lokasi" class="btn btn-secondary " style="pointer-events: none">Pilih Tiket</a>
                                            </div>
                                        </div>
                                        <div class="paket-unavail ">
                                            <p class="m-2 fw-semibold">Paket tidak Tersedia</p>
                                        </div>
                                    </div> -->

                                    <!-- <div class="card mt-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Reguler Weekday Dufan (belum termasuk tiket Ancol)</h5>
                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <p class="text-danger fw-bold fs-4 m-0">IDR 100.000</p>
                                                <a href="#" class="btn btn-primary ">Pilih Tiker</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card mt-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Reguler Weekday Dufan (belum termasuk tiket Ancol)</h5>
                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <p class="text-danger fw-bold fs-4 m-0">IDR 100.000</p>
                                                <a href="#" class="btn btn-primary ">Pilih Tiker</a>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>

                        <div class="col-3">

                        </div>
                    </div>
                </section>

                <hr>

                <section>
                    <div class="mt-4">
                        <h3>Description</h3>
                        <div id="description-content"></div>
                    </div>
                </section>
                <hr>
                <section id="review">
                    <div class="mt-3">
                        <h3>Review</h3>
                        <h1>4,4<span class="fs-4">/5</span></h1>
                        <div class="d-flex flex-wrap ">
                            <div class="card mb-3 w-25 me-2">
                                <div class="card-body ">
                                    <h5 class="card-title">Info Penting & Highlight</h5>
                                    <h6 class="card-subtitle mb-2 text-body-secondary">Card subtitle</h6>
                                </div>
                            </div>

                            <div class="card mb-3 w-25 me-2">
                                <div class="card-body ">
                                    <h5 class="card-title">Info Penting & Highlight</h5>
                                    <h6 class="card-subtitle mb-2 text-body-secondary">Card subtitle</h6>
                                </div>
                            </div>

                            <div class="card mb-3 w-25 me-2">
                                <div class="card-body ">
                                    <h5 class="card-title">Info Penting & Highlight</h5>
                                    <h6 class="card-subtitle mb-2 text-body-secondary">Card subtitle</h6>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <hr>

                <section id="lokasi">
                    <div class="mt-4">
                        <h3>Lokasi</h3>
                        <div class="mapouter w-100">
                            <div class="gmap_canvas" id="lokasi-map">
                                <!-- <iframe height="450" id="gmap_canvas" src="https://maps.google.com/maps?q=-6.126385%2C+106.834075&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                <a href="https://www.analarmclock.com"></a><br><a href="https://www.onclock.net"></a><br> -->
                            </div>
                        </div>
                    </div>
                </section>

                <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-1 border-top">
                    <div class="col mb-3">
                        <a href="/" class="d-flex align-items-center mb-3 link-body-emphasis text-decoration-none">
                            <svg class="bi me-2" width="40" height="32">
                                <use xlink:href="#bootstrap"></use>
                            </svg>
                        </a>
                        <p class="text-body-secondary">© 2024</p>
                    </div>

                    <div class="col mb-3">

                    </div>

                    <div class="col mb-3">
                        <h5>Section</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
                        </ul>
                    </div>

                    <div class="col mb-3">
                        <h5>Section</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
                        </ul>
                    </div>

                    <div class="col mb-3">
                        <h5>Section</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a></li>
                        </ul>
                    </div>
                </footer>

            </div>
        </div>
    </div>

    <!-- Modal jam buka-->
    <div class="modal fade" id="jamBuka" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="jamBukaLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Jam Buka</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body modal-jam-buka">
                    <ul id="list-jam-buka">

                    </ul>
                </div>

            </div>
        </div>
    </div>

    <!-- Modal datepicker-->
    <div class="modal fade" id="datepicker-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="datePickerLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Jam Buka</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="datepicker" class="d-flex justify-content-center"></div>
                </div>

            </div>
        </div>
    </div>

    <div id="modal-paket-container"></div>

    <!-- Modal highlight-->
    <div class="modal fade" id="highlight-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="highlightLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-lg modal-fullscreen-lg-down">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Info Penting & HighLight</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <h2 class="mb-3">Info Penting</h2>
                        <div id="info-penting-content">
                            <!-- <ul>
                                <li>Tidak termasuk tiket masuk Pintu Gerbang Utama Ancol. Beli tiket Pintu Gerbang Utama Ancol di sini untuk pengalaman liburan yang tak terlupakan.</li>
                                <li>Pengunjung dilarang membawa makanan dan minuman ke dalam area Dufan.</li>
                                <li>Loket Dufan dan Pintu Gerbang Dunia Fantasi ditutup 1 jam lebih awal dari jam operasional yang berlaku.</li>
                            </ul> -->
                        </div>
                    </div>
                    <div>
                        <h2 class="mb-3">Highlight</h2>
                        <div id="highlight-content">
                            <!-- <ul>
                                <li>Dufan adalah wahana yang menghadirkan tempat bermain asyik yang terbagi menjadi empat kategori, yakni Children Rides, Family Ride, Water Ride, dan Thrill Ride.</li>
                                <li>Bawa anak-anakmu ke wahana Dufan khusus anak, seperti Ontang-Anting yang riuh dan Istana Boneka yang penuh pesona.</li>
                                <li>Sekaranglah waktunya untuk membuat kenangan berharga bersama keluarga dan teman-teman. Cek harga tiket Dufan 2024 di bawah, pilih tiketnya, dan nikmati petualangan yang seru!</li>
                                <li>Cocok untuk: Keluarga Asyik, Bersama Pasangan, dan Geng Asyik.</li>
                            </ul> -->
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- jQuery UI JS -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(document).ready(function () {
            $('#paket-filter-reset').hide();
            // const cardContainer = $('#atraksi-container');
            var days = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
            const monthNames = ["Januari", "Februari", "Maret", "April", "Mei", "Juni",
                "Juli", "Agustus", "September", "Oktober", "November", "Desember"
            ];

            var currentDate = new Date();

            var dayIndex = currentDate.getDay();

            var dayName = days[dayIndex];
            var serviceIdToIpMap = {
                1: '3.217.250.166:8003',
                2: '52.6.192.248:8003',
                3: '44.222.16.57:8003',
                4: '34.194.127.109:8003',
                5: '34.193.181.49:8003',
                6: '34.193.181.49:8007'
            };
            
            var jenisip = <?php echo json_encode($service_id); ?>;
            var alamatapi = serviceIdToIpMap[jenisip];
            console.log(serviceIdToIpMap);
            console.log(alamatapi);
            var address = alamatapi;

            // init
            $.ajax({
                url: `http://${address}/api/atraksi`,
                type: 'get',
                success: function (data) {
                    data = JSON.parse(data);
                    console.log(data)

                    try {
                        var imgContainer = $('#atraksi-img');
                        var indicators = $('.carousel-indicators');
                        var inner = $('.carousel-inner');
                        data.photo.forEach((element, index) => {
                            var indicator = $('<button>')
                                .attr('type', 'button')
                                .attr('data-bs-target', '#carouselExampleIndicators')
                                .attr('data-bs-slide-to', index)
                                .attr('aria-label', 'Slide ' + (index + 1));
                            if (index === 0) {
                                indicator.addClass('active');
                            }
                            indicators.append(indicator);

                            var item = $('<div>').addClass('carousel-item');
                            if (index === 0) {
                                item.addClass('active');
                            }
                            console.log(data.photo[index].image);
                            var img = $('<img>').addClass('d-block w-100').attr('src', data.photo[index].image);
                            item.append(img);
                            imgContainer.append(item);
                        });
                        $('#title').text(data.title);
                        $('#alamat').append(`<i class="bi bi-pin-map-fill"> ` + data.alamat + `<i class="bi bi-chevron-right"></i>`);
                        $('#info-penting-content').append(data.info_penting);
                        $('#highlight-content').append(data.highlight);
                        $('#lowest-price').text("IDR " + data.lowest_price.toLocaleString());
                        $('#description-content').append(data.deskripsi)
                        var gps = data.gps_location.split(", ")
                        const mapSrc = `https://maps.google.com/maps?q=${gps[0]},${gps[1]}&t=&z=13&ie=UTF8&iwloc=&output=embed`;

                        const iframe = `<iframe height="450" id="gmap_canvas" src="${mapSrc}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>`;
                        $('#lokasi-map').append(iframe);
                        // $('#gmaps_canvas').attr('src', `https://maps.google.com/maps?q=${gps[0]}2C+${gps[1]}&t=&z=13&ie=UTF8&iwloc=&output=embed`)
                        // $('#title').text("IDR ");
                        data.jam_buka.forEach((element, index) => {
                            console.log(element);
                            if (element.hari.toLowerCase() === dayName.toLowerCase()) {
                                $("#list-jam-buka").append('<li class="fw-bold mb-1" >' + element.hari + ' ' + element.waktu + '</li>');
                                $('#jam-buka').append(`<i class="bi bi-clock-fill"></i> ${data.status} &#x25CF ${element.hari} &#x25CF ${element.waktu} <i class="bi bi-chevron-right"></i>`);

                            } else {
                                $("#list-jam-buka").append('<li class="mb-1">' + element.hari + ' ' + element.waktu + '</li>')
                            }
                        });
                        $('#content').removeClass('d-none');
                        $('#loader').hide();
                    } catch (e) {
                        console.log(e);
                    }

                }
            });

            $.ajax({
                url: `http://${address}/api/atraksi/paket`,
                type: 'GET',
                success: function (data) {
                    data = JSON.parse(data);
                    console.log(data.paket);
                    $('#paket-loader').hide();
                    data.paket.forEach((element, index) => {
                        $('#paket-container').append(createCard(element, data.status));
                        $('#modal-paket-container').append(createModal(element));
                    })
                }
            });

            $("#datepicker").datepicker({
                dateFormat: "yy-mm-dd",
                onSelect: function (dateText) {
                    $('#datepicker-modal').modal('hide');
                    // Fade out the currently active button
                    $('#paket-filter-reset').show();
                    // Fade in the clicked button
                    $('#btn-date').addClass('active').fadeTo(0, 0).fadeTo(300, 1);
                    console.log("Date selected: " + dateText);
                    $('#paket-container').empty()
                    $('#modal-paket-container').empty()
                    $('#paket-loader').show();
                    $.ajax({
                        url: `http://${address}/api/atraksi/tutup/${dateText}`,
                        type: "GET",
                        success: function (data) {
                            console.log(data);
                            status = JSON.parse(data)['status'];

                            $.ajax({
                                url: `http://${address}/api/atraksi/paket`,
                                type: 'GET',
                                success: function (data) {
                                    data = JSON.parse(data);
                                    console.log(data.paket);
                                    $('#paket-loader').hide();
                                    data.paket.forEach((element, index) => {
                                        // $('#paket-container').append(createCard(element, status));
                                        $.ajax({
                                            url: `http://${address}/api/atraksi/paket/${element.paket_id}/check/${dateText}`,
                                            type: 'GET',
                                            success: function (data) {
                                                data = JSON.parse(data);
                                                console.log(data);
                                                if (data.status == 'tersedia') {
                                                    $('#paket-container').append(createCard(element, 'Buka'));
                                                } else {
                                                    $('#paket-container').append(createCard(element, 'Tutup'));
                                                }

                                            }
                                        });
                                        $('#modal-paket-container').append(createModal(element));
                                    })
                                }
                            })
                        }
                    })
                }
            });

            $('#paket-filter-reset').on('click', function () {
                $('#paket-filter-reset').hide();
                $('.btn-paket-date.active').removeClass('active').fadeTo(0, 0, function () {
                    $(this).fadeTo(0, 1);
                });
                $('#paket-container').empty()
                $('#modal-paket-container').empty()
                $('#paket-loader').show();
                $.ajax({
                    url: `http://${address}/api/atraksi/paket`,
                    type: "GET",
                    success: function (data) {
                        console.log(data);
                        statusBuka = JSON.parse(data)['status'];

                        $.ajax({
                            url: `http://${address}/api/atraksi/paket`,
                            type: 'GET',
                            success: function (data) {
                                data = JSON.parse(data);
                                console.log(data.paket);
                                $('#paket-loader').hide();
                                data.paket.forEach((element, index) => {
                                    const todayDate = new Date();
                                    if (statusBuka == 'Buka') {
                                        $.ajax({
                                            url: `http://${address}/api/atraksi/paket/${element.paket_id}/check/${todayDate}`,
                                            type: 'GET',
                                            success: function (data) {
                                                data = JSON.parse(data);
                                                console.log(data);
                                                if (data.status == 'tersedia') {
                                                    $('#paket-container').append(createCard(element, 'Buka'));
                                                } else {
                                                    $('#paket-container').append(createCard(element, 'Tutup'));
                                                }
                                            }
                                        });
                                    } else {
                                        $('#paket-container').append(createCard(element, statusBuka));
                                    }


                                    $('#modal-paket-container').append(createModal(element));
                                })
                            }
                        })
                    }
                })
            });

            $('.btn-paket-date').each(function (index) {
                if (index != 3) {
                    const date = new Date();
                    date.setDate(date.getDate() + index + 1); // increment date
                    const dateString = date.toISOString().split('T')[0]; // get date string in YYYY-MM-DD format
                    const month = date.getMonth();
                    const tgl = date.getDate();
                    if (index != 0) {
                        $(this).text(tgl + " " + monthNames[month]);
                    }
                    $(this).attr('date', dateString);
                } else {
                    $(this).attr('date', '-');
                }
            });


            $('.btn-paket-date').on('click', function () {
                if ($(this).attr('date') == "-") {
                    $('#datepicker-modal').modal('show');
                    return;
                }
                // Fade out the currently active button
                $('.btn-paket-date.active').removeClass('active').fadeTo(0, 0, function () {
                    $(this).fadeTo(0, 1);
                });
                $('#paket-filter-reset').show();
                // Fade in the clicked button
                $(this).addClass('active').fadeTo(0, 0).fadeTo(300, 1);
                datefilter = $(this).attr('date');
                $('#paket-container').empty();
                $('#modal-paket-container').empty()
                $('#paket-loader').show();
                $.ajax({
                    url: `http://${address}/api/atraksi/tutup/${datefilter}`,
                    type: "GET",
                    success: function (data) {
                        console.log(data);
                        status = JSON.parse(data)['status'];

                        $.ajax({
                            url: `http://${address}/api/atraksi/paket`,
                            type: 'GET',
                            success: function (data) {
                                data = JSON.parse(data);
                                console.log(data.paket);
                                $('#paket-loader').hide();
                                data.paket.forEach((element, index) => {
                                    $.ajax({
                                        url: `http://${address}/api/atraksi/paket/${element.paket_id}/check/${datefilter}`,
                                        type: 'GET',
                                        success: function (data) {
                                            data = JSON.parse(data);
                                            console.log(data);
                                            if (data.status == 'tersedia') {
                                                $('#paket-container').append(createCard(element, 'Buka'));
                                            } else {
                                                $('#paket-container').append(createCard(element, 'Tutup'));
                                            }

                                        }
                                    });

                                    $('#modal-paket-container').append(createModal(element));
                                })
                            }
                        })
                    }
                })
            });

            // create card paket
            function createCard(pkg, status) {

                if (status == "Buka") {

                    return `
                    <div class="card mt-3">
                        <div class="card-body">
                            <h5 class="card-title">${pkg.title}</h5>
                            <a href="" class="card-link text-decoration-none fw-bolder text-primary" type="button" data-bs-toggle="modal" data-bs-target="#paket-modal-${pkg.paket_id}">detail</a>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <p class="text-danger fw-bold fs-4 m-0">IDR ${pkg.harga.toLocaleString()}</p>
                                <a href="bookingAttraction.html?service_id=<?php echo $service_id ?>&visit_date=<?php echo $visit_date ?>&paket_attraction_id=${pkg.paket_id}" class="btn btn-primary">Pilih Tiket</a>
                            </div>
                        </div>
                    </div>
                `;
                } else {
                    return `
                    <div class="card mt-3">
                        <div class="card-body unavail">
                            <h5 class="card-title">${pkg.title}</h5>
                            <a href="" class="card-link text-decoration-none fw-bolder text-primary" type="button" data-bs-toggle="modal" data-bs-target="#paket-modal-${pkg.paket_id}">detail</a>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <p class="unavail fw-bold fs-4 m-0">IDR ${pkg.harga.toLocaleString()}</p>
                                <a href="${pkg.paket_id}" class="btn btn-secondary" style="pointer-events: none">Pilih Tiket</a>
                            </div>
                        </div>
                        <div class="paket-unavail ">
                            <p class="m-2 fw-semibold">Paket tidak Tersedia</p>
                        </div>
                    </div>
                `;
                }
            }

            function createModal(package) {
                return `
                    <div class="modal fade" id="paket-modal-${package.paket_id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="paketLabel-${package.paket_id}" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Detail Paket</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div id="deskripsi-paket-${package.paket_id}" class="btn-modal-paket py-3 fw-semibold d-flex justify-content-between" data-bs-toggle="collapse" href="#deskripsi-collapse-${package.paket_id}" role="button" aria-expanded="false" aria-controls="deskripsi-collapse-${package.id}">
                                        <p>Deskripsi</p>
                                        <span>></span>
                                    </div>
                                    <div class="collapse" id="deskripsi-collapse-${package.paket_id}">
                                        ${package.deskripsi}
                                    </div>

                                    <div id="caraPenukaran-paket-${package.paket_id}" class="btn-modal-paket py-3 fw-semibold d-flex justify-content-between" data-bs-toggle="collapse" href="#caraPenukaran-collapse-${package.paket_id}" role="button" aria-expanded="false" aria-controls="caraPenukaran-collapse-${package.paket_id}">
                                        <p>Cara Penukaran</p>
                                        <span>></span>
                                    </div>
                                    <div class="collapse" id="caraPenukaran-collapse-${package.paket_id}">
                                        ${package.cara_penukaran}
                                    </div>

                                    <div id="fasilitas-paket-${package.paket_id}" class="btn-modal-paket py-3 fw-semibold d-flex justify-content-between" data-bs-toggle="collapse" href="#fasilitas-collapse-${package.paket_id}" role="button" aria-expanded="false" aria-controls="fasilitas-collapse-${package.paket_id}">
                                        <p>Fasilitas</p>
                                        <span>></span>
                                    </div>
                                    <div class="collapse" id="fasilitas-collapse-${package.paket_id}">
                                        ${package.fasilitas}
                                    </div>

                                    <div id="syarat-paket-${package.paket_id}" class="btn-modal-paket py-3 fw-semibold d-flex justify-content-between" data-bs-toggle="collapse" href="#syarat-collapse-${package.paket_id}" role="button" aria-expanded="false" aria-controls="syarat-collapse-${package.paket_id}">
                                        <p>Syarat dan Ketentuan</p>
                                        <span>></span>
                                    </div>
                                    <div class="collapse" id="syarat-collapse-${package.paket_id}">
                                        ${package.syarat_dan_ketentuan}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
            }






            // untuk navbar
            const sections = document.querySelectorAll("section");
            const navLi = document.querySelectorAll(".navjs");
            // console.log(navLi)
            window.onscroll = () => {
                var current = "";

                sections.forEach((section) => {
                    const sectionTop = section.offsetTop;
                    if (pageYOffset >= sectionTop - 60) {
                        current = section.getAttribute("id");
                    }
                });

                navLi.forEach((li) => {
                    li.classList.remove("active");
                    if (li.classList.contains(current)) {
                        li.classList.add("active");
                    }
                });
            };
        });
    </script>
</body>

</html>