document.addEventListener('DOMContentLoaded', function () {
    const detailButtons = document.querySelectorAll('.detail-button');
    const modal = document.getElementById('package-modal');
    const closeButton = document.querySelector('.close-button');
    const prevDayButton = document.getElementById('prev-day');
    const nextDayButton = document.getElementById('next-day');
    const packageDescription = document.getElementById('package-description');
    const originCity = document.getElementById('origin-city');
    const destinationCity = document.getElementById('destination-city');
    const dayDetails = document.getElementById('day-details');

    let currentPackage = null;
    let currentDay = 0;

    const packages = {
        1: {
            description: 'This is an amazing package that includes visits to multiple attractions.',
            originCity: 'New York',
            destinationCity: 'Paris',
            days: [
                {
                    hotel: {
                        name: 'Hotel Paris',
                        address: '123 Paris St, Paris, France',
                        roomType: 'Deluxe',
                        roomNumber: 101
                    },
                    flight: {
                        airline: 'Air France',
                        flightNumber: 'AF123',
                        departureTime: '10:00 AM',
                        arrivalTime: '2:00 PM',
                        flightClass: 'Business'
                    },
                    attraction: {
                        name: 'Eiffel Tower',
                        description: 'Visit the iconic Eiffel Tower.',
                        visitDate: '2023-07-02',
                        entryFee: '$30'
                    }
                },
                {
                    hotel: {
                        name: 'Hotel Nice',
                        address: '456 Nice St, Nice, France',
                        roomType: 'Suite',
                        roomNumber: 202
                    },
                    flight: {
                        airline: 'Air France',
                        flightNumber: 'AF456',
                        departureTime: '11:00 AM',
                        arrivalTime: '3:00 PM',
                        flightClass: 'Business'
                    },
                    attraction: {
                        name: 'Louvre Museum',
                        description: 'Explore the famous Louvre Museum.',
                        visitDate: '2023-07-03',
                        entryFee: '$15'
                    }
                }
            ]
        },
        2: {
            description: 'This package offers a blend of adventure and relaxation.',
            originCity: 'Los Angeles',
            destinationCity: 'Tokyo',
            days: [
                {
                    hotel: {
                        name: 'Tokyo Inn',
                        address: '789 Tokyo St, Tokyo, Japan',
                        roomType: 'Standard',
                        roomNumber: 303
                    },
                    flight: {
                        airline: 'Japan Airlines',
                        flightNumber: 'JL789',
                        departureTime: '9:00 AM',
                        arrivalTime: '1:00 PM',
                        flightClass: 'Economy'
                    },
                    attraction: {
                        name: 'Tokyo Tower',
                        description: 'Enjoy the view from Tokyo Tower.',
                        visitDate: '2023-08-02',
                        entryFee: '$25'
                    }
                },
                {
                    hotel: {
                        name: 'Kyoto Hotel',
                        address: '123 Kyoto St, Kyoto, Japan',
                        roomType: 'Deluxe',
                        roomNumber: 404
                    },
                    flight: {
                        airline: 'Japan Airlines',
                        flightNumber: 'JL101',
                        departureTime: '10:00 AM',
                        arrivalTime: '2:00 PM',
                        flightClass: 'Economy'
                    },
                    attraction: {
                        name: 'Kinkaku-ji',
                        description: 'Visit the Golden Pavilion in Kyoto.',
                        visitDate: '2023-08-03',
                        entryFee: '$20'
                    }
                }
            ]
        },
        3: {
            description: 'This package is perfect for a family vacation.',
            originCity: 'Chicago',
            destinationCity: 'London',
            days: [
                {
                    hotel: {
                        name: 'London Hotel',
                        address: '321 London St, London, UK',
                        roomType: 'Family Suite',
                        roomNumber: 505
                    },
                    flight: {
                        airline: 'British Airways',
                        flightNumber: 'BA321',
                        departureTime: '8:00 AM',
                        arrivalTime: '12:00 PM',
                        flightClass: 'First Class'
                    },
                    attraction: {
                        name: 'London Eye',
                        description: 'Ride the London Eye.',
                        visitDate: '2023-09-02',
                        entryFee: '$35'
                    }
                },
                {
                    hotel: {
                        name: 'Edinburgh Hotel',
                        address: '654 Edinburgh St, Edinburgh, UK',
                        roomType: 'Deluxe',
                        roomNumber: 606
                    },
                    flight: {
                        airline: 'British Airways',
                        flightNumber: 'BA654',
                        departureTime: '9:00 AM',
                        arrivalTime: '1:00 PM',
                        flightClass: 'First Class'
                    },
                    attraction: {
                        name: 'Edinburgh Castle',
                        description: 'Tour the historic Edinburgh Castle.',
                        visitDate: '2023-09-03',
                        entryFee: '$40'
                    }
                }
            ]
        }
    };

    function showModal(packageId) {
        currentPackage = packages[packageId];
        currentDay = 0;
        packageDescription.textContent = `Description: ${currentPackage.description}`;
        originCity.textContent = currentPackage.originCity;
        destinationCity.textContent = currentPackage.destinationCity;
        updateDayDetails();
        modal.style.display = 'block';
    }

    function hideModal() {
        modal.style.display = 'none';
    }

    function updateDayDetails() {
        const day = currentPackage.days[currentDay];
        dayDetails.innerHTML = `
            <h3>Day ${currentDay + 1}</h3>
            <h4>Hotel Details</h5>
            <p>Hotel: ${day.hotel.name}</p>
            <p>Address: ${day.hotel.address}</p>
            <p>Room Type: ${day.hotel.roomType}</p>
            <p>Room Number: ${day.hotel.roomNumber}</p>
            <br>
            <h4>Flight Details</h5>
            <p>Airline: ${day.flight.airline}</p>
            <p>Flight Number: ${day.flight.flightNumber}</p>
            <p>Flight Class: ${day.flight.flightClass}</p>
            <p>Departure Time: ${day.flight.departureTime}</p>
            <p>Arrival Time: ${day.flight.arrivalTime}</p>
            <br>
            <h4>Attraction Details</h5>
            <p>Attraction: ${day.attraction.name}</p>
            <p>Description: ${day.attraction.description}</p>
            <p>Visit Date: ${day.attraction.visitDate}</p>
            <p>Entry fee: ${day.attraction.entryFee}</p>
        `;
    }

    function prevDay() {
        if (currentDay > 0) {
            currentDay--;
            updateDayDetails();
        }
    }

    function nextDay() {
        if (currentDay < currentPackage.days.length - 1) {
            currentDay++;
            updateDayDetails();
        }
    }

    detailButtons.forEach(button => {
        button.addEventListener('click', function () {
            const packageId = this.getAttribute('data-package');
            showModal(packageId);
        });
    });

    closeButton.addEventListener('click', hideModal);

    prevDayButton.addEventListener('click', prevDay);
    nextDayButton.addEventListener('click', nextDay);

    window.addEventListener('click', function (event) {
        if (event.target == modal) {
            hideModal();
        }
    });
});
