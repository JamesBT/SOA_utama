document.addEventListener('DOMContentLoaded', function () {
    function dateFormatter(date) {
        const datee = new Date(date);
        const day = datee.getDate().toString().padStart(2, '0');
        const month = (datee.getMonth() + 1).toString().padStart(2, '0');
        const year = datee.getFullYear();

        return `${day}-${month}-${year}`
    }

    async function fetchBookingsData() {
        const response = await fetch('http://100.29.145.3:8007/travel-agent/bookings', {
            method: "GET"
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        // console.log(data);

        const bookingsContainer = document.querySelector('.bookings');
        bookingsContainer.innerHTML = '';  // Clear any previous bookings

        if (data.length === 0) {
            const bookingItem = document.createElement('div');
            bookingItem.classList.add('booking-item');
            bookingItem.innerHTML = `
                <div class="booking-details">
                    <h1><strong>Booking List Empty</strong></h1>
                </div>
            `;
            bookingsContainer.appendChild(bookingItem);
        } else {
            data.forEach(bookings => {
                const bookingItem = document.createElement('div');
                bookingItem.classList.add('booking-item');
                bookingItem.innerHTML = `
                    <div class="booking-details">
                        <p><strong>Name : </strong> ${bookings.name}</p>
                        <p><strong>Description : </strong> ${bookings.description}</p>
                        <p><strong>Departure Date : </strong> ${dateFormatter(bookings.departure_date)}</p>
                        <p><strong>Return Date : </strong> ${dateFormatter(bookings.return_date)}</p>
                        <p><strong>Number Of People : </strong> ${bookings.number_of_people}</p>
                        <p><strong>Price : </strong> Rp${bookings.price.toLocaleString('id-ID')}</p>
                    </div>
                `;
                bookingsContainer.appendChild(bookingItem);
            });
        }
    }
    
    fetchBookingsData();

    const myBooking = document.querySelector('#my-bookings');
    myBooking.addEventListener('click', fetchBookingsData);

    async function fetchPackagesData() {
        try {
            const url = new URL(window.location.href);
            const originCity = url.searchParams.get("from");
            const destinationCity = url.searchParams.get("to");
            const minimimNumberOfPerson = url.searchParams.get("guests");
            const departureDate = url.searchParams.get("arrival");
            const returnDate = url.searchParams.get("leaving");

            let response;

            if (originCity == null || destinationCity == null || minimimNumberOfPerson == null || departureDate == null || returnDate == null) {
                response = await fetch('http://100.29.145.3:8007/travel-agent/packages', {
                    method: "GET"
                });
            } else {
                response = await fetch(`http://100.29.145.3:8007/travel-agent/filter?origin_city=${originCity}&destination_city=${destinationCity}&number_of_people=${minimimNumberOfPerson}&departure_date=${departureDate}&return_date=${returnDate}`, {
                    method: "GET",
                });
            }

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            const data = await response.json();
            // console.log(data);

            const cardContainer = document.querySelectorAll('.cardd-container');
            let temp = ""

            data.forEach(element => {
                temp += `
                    <div class="package-card">
                        <img src="${element.image}" alt="Package 1">
                        <div class="package-details">
                            <br>
                            <h3>${element.name}</h3>
                            <br>
                            <p>Departure Date: ${dateFormatter(element.departure_date)}</p>
                            <p>Return Date: ${dateFormatter(element.return_date)}</p>
                            <p>Number of People: ${element.number_of_people}</p>
                            <p>Quota: ${element.quota}</p>
                            <h4>Rp${element.price.toLocaleString('id-ID')}</h4>
                            <br>
                            <div class="buttons">
                                <button class="detail-button" data-package="${element.id}">Details</button>
                                <button class="buy-button" data-package="${element.id}">Buy</button>
                            </div>
                        </div>
                    </div>`
            });

            // console.log(temp);

            if (temp == "") {
                cardContainer[0].innerHTML = `<div class="no-result-filter">Tidak ada package yang sesuai dengan filter. <span>Silahkan  <a href="#explore">filter</a> ulang</span></div>`;
            } else {
                cardContainer[0].innerHTML = temp;
            }
        } catch (error) {
            console.error('Error fetching package details data:', error);
            return null;
        }
    }

    fetchPackagesData().then(function () {
        detailBtn = document.querySelectorAll('.detail-button');
        const closeButton = document.querySelector('.close-button');
        const prevDayButton = document.getElementById('prev-day');
        const nextDayButton = document.getElementById('next-day');

        document.querySelectorAll('.buy-button').forEach(function (button) {
            button.addEventListener("click", function () {
                Swal.fire({
                    title: "Buy Package",
                    text: "Are you sure you want to buy this package?",
                    icon: "question",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Buy",
                }).then(async (result) => {
                    if (result.isConfirmed) {
                        const id_package = this.getAttribute('data-package')

                        const response = await fetch(`http://100.29.145.3:8007/travel-agent/book`, {
                            method: "POST",
                            body: JSON.stringify({
                                user_id: "1",
                                package_id: id_package
                            })
                        });
                        if (!response.ok) {
                            throw new Error(`HTTP error! Status: ${response.status}`);
                        }

                        Swal.fire({
                            title: "Package bought successfully!",
                            icon: "success"
                        });
                    }
                });
            });
        });

        detailBtn.forEach(element => {
            element.addEventListener("click", async function () {
                const packageId = this.getAttribute('data-package');
                // console.log(packageId);
                const response = await fetch(`http://100.29.145.3:8007/travel-agent/package_details/${packageId}`, {
                    method: "GET"
                });
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                const data = await response.json();
                // console.log(data);

                const modal = document.getElementById('package-modal');
                const dayDetails = document.getElementById('day-details');

                let currentDayData = null;
                let currentDayIndex = 0;

                function showModal() {
                    currentDayData = data[currentDayIndex];
                    updateDayDetails(currentDayData);
                    modal.style.display = 'block';
                }

                function hideModal() {
                    modal.style.display = 'none';
                }

                function updateDayDetails(currentDayData) {
                    dayDetails.innerHTML = `
                            <p>Description: ${currentDayData.description}</p>
                            <p>Origin City: ${currentDayData.origin_city}</p>
                            <p>Destination City: ${currentDayData.destination_city}</span></p>
                            <br>
                            <h3>Day ${currentDayData.day}</h3>
                            <h4>Hotel Details</h5>
                            <p>Hotel: ${currentDayData.hotel_name}</p>
                            <p>Address: ${currentDayData.address}</p>
                            <p>Room Type: ${currentDayData.room_type}</p>
                            <p>Room Number: ${currentDayData.room_number}</p>
                            <br>
                            <h4>Flight Details</h5>
                            <p>Airline: ${currentDayData.airline_name}</p>
                            <p>Flight Number: ${currentDayData.flight_number}</p>
                            <p>Flight Class: ${currentDayData.flight_class}</p>
                            <p>Departure Time: ${currentDayData.departure_time}</p>
                            <p>Arrival Time: ${currentDayData.arrival_time}</p>
                            <br>
                            <h4>Attraction Details</h5>
                            <p>Attraction: ${currentDayData.attraction_name}</p>
                            <p>Visit Date: ${dateFormatter(currentDayData.visit_date)}</p>
                            <p>Entry fee: Rp${currentDayData.entry_fee.toLocaleString('id-ID')}</p>
                        `;
                }

                function prevDay() {
                    if (currentDayIndex > 0) {
                        currentDayIndex--;
                        updateDayDetails(data[currentDayIndex]);
                    }
                }

                function nextDay() {
                    if (currentDayIndex < data.length - 1) {
                        currentDayIndex++;
                        updateDayDetails(data[currentDayIndex]);
                    }
                }

                closeButton.addEventListener('click', hideModal);
                prevDayButton.addEventListener('click', prevDay);
                nextDayButton.addEventListener('click', nextDay);

                document.querySelectorAll('.buy-button-modal').forEach(function (button) {
                    button.addEventListener("click", function () {
                        Swal.fire({
                            title: "Buy Package",
                            text: "Are you sure you want to buy this package?",
                            icon: "question",
                            showCancelButton: true,
                            confirmButtonColor: "#3085d6",
                            cancelButtonColor: "#d33",
                            confirmButtonText: "Buy",
                        }).then(async (result) => {
                            if (result.isConfirmed) {
                                const response = await fetch(`http://100.29.145.3:8007/travel-agent/book`, {
                                    method: "POST",
                                    body: JSON.stringify({
                                        user_id: "1",
                                        package_id: packageId
                                    })
                                });
                                if (!response.ok) {
                                    throw new Error(`HTTP error! Status: ${response.status}`);
                                }
                                Swal.fire({
                                    title: "Package bought successfully!",
                                    icon: "success"
                                });
                                hideModal();
                            }
                        });
                    });
                });

                window.addEventListener('click', function (event) {
                    if (event.target == modal) {
                        hideModal();
                    }
                });

                showModal(packageId);
            });
        });
    });
});