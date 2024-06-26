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
    var address = '3.217.250.166:8003'

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
                    <p class="card-text">${pkg.deskripsi}</p>
                    <a href="" class="card-link text-decoration-none fw-bolder text-primary" type="button" data-bs-toggle="modal" data-bs-target="#paket-modal-${pkg.paket_id}">detail</a>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <p class="text-danger fw-bold fs-4 m-0">IDR ${pkg.harga.toLocaleString()}</p>
                        <a href="" class="btn btn-primary">Pilih Tiket</a>
                    </div>
                </div>
            </div>
        `;
        } else {
            return `
            <div class="card mt-3">
                <div class="card-body unavail">
                    <h5 class="card-title">${pkg.title}</h5>
                    <p class="card-text">${pkg.deskripsi}</p>
                    <a href="" class="card-link text-decoration-none fw-bolder text-primary" type="button" data-bs-toggle="modal" data-bs-target="#paket-modal-${pkg.paket_id}">detail</a>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <p class="unavail fw-bold fs-4 m-0">IDR ${pkg.harga.toLocaleString()}</p>
                        <a href="" class="btn btn-secondary" style="pointer-events: none">Pilih Tiket</a>
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