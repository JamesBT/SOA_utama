$(document).ready(function () {
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
            $('#paket-loader').show();
            $.ajax({
                url: `http://localhost:8000/api/atraksi/tutup/${dateText}`,
                type: "GET",
                success: function (data) {
                    console.log(data);
                    status = JSON.parse(data)['status'];

                    $.ajax({
                        url: 'http://localhost:8000/api/atraksi/paket',
                        type: 'GET',
                        success: function (data) {
                            data = JSON.parse(data);
                            console.log(data.paket);
                            $('#paket-loader').hide();
                            data.paket.forEach((element, index) => {
                                $('#paket-container').append(createCard(element, status));;
                            })
                        }
                    })
                }
            })
        }
    });
    $('#paket-filter-reset').hide();
    // const cardContainer = $('#atraksi-container');
    var days = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
    const monthNames = ["Januari", "Februari", "Maret", "April", "Mei", "Juni",
        "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];

    var currentDate = new Date();

    var dayIndex = currentDate.getDay();

    var dayName = days[dayIndex];

    $('#paket-filter-reset').on('click', function () {
        $('#paket-filter-reset').hide();
        $('.btn-paket-date.active').removeClass('active').fadeTo(0, 0, function () {
            $(this).fadeTo(0, 1);
        });
        $('#paket-container').empty()
        $('#paket-loader').show();
        $.ajax({
            url: `http://localhost:8000/api/atraksi/paket`,
            type: "GET",
            success: function (data) {
                console.log(data);
                statusBuka = JSON.parse(data)['status'];

                $.ajax({
                    url: 'http://localhost:8000/api/atraksi/paket',
                    type: 'GET',
                    success: function (data) {
                        data = JSON.parse(data);
                        console.log(data.paket);
                        $('#paket-loader').hide();
                        data.paket.forEach((element, index) => {
                            $('#paket-container').append(createCard(element, statusBuka));;
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
        $('#paket-container').empty()
        $('#paket-loader').show();
        $.ajax({
            url: `http://localhost:8000/api/atraksi/tutup/${datefilter}`,
            type: "GET",
            success: function (data) {
                console.log(data);
                status = JSON.parse(data)['status'];

                $.ajax({
                    url: 'http://localhost:8000/api/atraksi/paket',
                    type: 'GET',
                    success: function (data) {
                        data = JSON.parse(data);
                        console.log(data.paket);
                        $('#paket-loader').hide();
                        data.paket.forEach((element, index) => {
                            $('#paket-container').append(createCard(element, status));;
                        })
                    }
                })
            }
        })
    });


    function createCard(pkg, status) {

        if (status == "Buka") {
            return `
            <div class="card mt-3">
                <div class="card-body">
                    <h5 class="card-title">${pkg.title}</h5>
                    <p class="card-text">${pkg.deskripsi}</p>
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
                    <hr>
                    <div class="d-flex justify-content-between">
                        <p class="unavail fw-bold fs-4 m-0">IDR ${pkg.harga.toLocaleString()}</p>
                        <a href="" class="btn btn-primary">Pilih Tiket</a>
                    </div>
                </div>
                <div class="paket-unavail ">
                    <p class="m-2 fw-semibold">Paket tidak Tersedia</p>
                </div>
            </div>
        `;
        }
    }


    $.ajax({
        url: 'http://localhost:8000/api/atraksi',
        type: 'get',
        success: function (data) {
            data = JSON.parse(data);
            console.log(data)
            $('#content').removeClass('d-none');
            var imgContainer = $('#atraksi-img');
            var indicators = $('.carousel-indicators');
            // var inner = $('.carousel-inner');
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
                var img = $('<img>').addClass('d-block w-100').attr('src', data.photo[index]);
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
            $('#loader').hide();
        }
    });

    $.ajax({
        url: 'http://localhost:8000/api/atraksi/paket',
        type: 'GET',
        success: function (data) {
            data = JSON.parse(data);
            console.log(data.paket);
            $('#paket-loader').hide();
            data.paket.forEach((element, index) => {
                $('#paket-container').append(createCard(element, data.status));;
            })
        }
    })
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