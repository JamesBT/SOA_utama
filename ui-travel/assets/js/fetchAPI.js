document.addEventListener('DOMContentLoaded', function () {
    async function fetchHotelData() {
        const serviceIdToIpMap = {
            1: 'http://52.200.174.164:8003/hotel',
            2: 'http://44.218.207.165:8009/hotel',
            3: 'http://50.16.176.111:8005/hotel',
            4: 'http://3.215.46.161:8011/hotel',
            5: 'http://3.215.46.161:8013/hotel',
            6: 'http://100.28.104.239:8007/hotel'
            // Add more mappings as needed
        };
        
        // ganti ip ketika serviceId berbeda
        // const serviceId = <?php echo json_encode($service_id); ?>;


        try {
            const response = await fetch('http://3.215.46.161:8013/hotel', {
                method: "GET"
            }); // Adjust the URL as necessary
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            console.log(data);
            if (data) {
                const header = document.getElementById('header-background');
                header.style.backgroundImage = `url('${data.image}')`;

                const welcomeContainer = document.getElementById('welcome');
                welcomeContainer.innerHTML = `
                    <p>WELCOME TO</p>
                    <p>${data.name}</p>
                `;
                // Update About Us section
                const aboutUsContent = document.getElementById('about-us-content');
                aboutUsContent.innerHTML = `
                    <p>${data.description}</p>
                `;
                // Update Facilities section
                const facilitiesContent = document.getElementById('facilities-content');
                facilitiesContent.innerHTML = `
                    <p>${data.facilities}</p>
                `;
                const locationContent = document.getElementById('location-content');
                locationContent.innerHTML = `
                    <p class="text-center">${data.address}</p>
                `;
            } // Return the hotel data
        } catch (error) {
            console.error('Error fetching hotel data:', error);
            return null;
        }
    }

    fetchHotelData()
});

function getRoomType() {
    return {
        activeSlide: 1,
        slides: [],
        modalData: {},

        async fetchRoomType() {
            try {
                const response = await fetch('http://3.215.46.161:8013/hotel/room_type', {
                    method: "GET"
                }); // Adjust the URL as necessary
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                const data = await response.json();
                console.log(data);
                this.slides = this.slides = data.map(room => ({
                    ...room,
                    price: `Rp ${room.price.toLocaleString('id-ID')}` // Format price with Indonesian locale
                }));
                console.log(this.slides)

            } catch (error) {
                console.error('Error fetching room type data:', error);
                return null;
            }
        },

        init() {
            this.fetchRoomType();
        }
    }
}