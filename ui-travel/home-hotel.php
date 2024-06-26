<?php 
	$service_id = $_GET['service_id'];
	// $service_id = 3;
	$checkin = $_GET['checkin'];
	$checkout = $_GET['checkout'];
?>

<!DOCTYPE html>
<html lang="en"> 
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<script src="https://cdn.tailwindcss.com"></script>
		<link rel="stylesheet" href="https://rsms.me/inter/inter.css">
		<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.2/dist/full.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/output.css">
		<script src="assets/js/script.js" defer></script>
		<!-- <script src="assets/js/fetchAPI.js"></script> -->
		<style>
			.header-bg {
			background-image: url();
			background-size: cover;
			background-position: center;
			}
			.animate-bounce {
			animation: bounce 1s infinite;
			}
			@keyframes bounce {
			0%, 20%, 50%, 80%, 100% {
			transform: translateY(0);
			}
			40% {
			transform: translateY(-20px);
			}
			60% {
			transform: translateY(-10px);
			}
			}
			.arrow-button {
			font-size: 2rem;
			padding: 1rem;
			}
			.welcome-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 4rem;
            font-weight: bold;
			background: rgba(0, 0, 0, 0.5);
            text-align: center;
            padding: 1rem 2rem;
            border-radius: 0.5rem;
        	}
		</style>
	</head>
	<body>
		<div x-data="{ isOpen: false }">
			<header class="absolute inset-x-0 top-0 z-50 text-white">
				<nav class="flex items-center justify-between p-6 lg:px-8 clearfix" aria-label="Global">
					<div class="flex lg:flex-1">
						<a href="home.php" class="-m-1.5 p-1.5">
						<span class="sr-only">Your Company</span>
						<img class="h-8 w-auto" src="images/logo.png" alt="">
						</a>
					</div>
					<div class="flex lg:hidden">
						<button type="button" @click="isOpen = !isOpen" class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700 ml-auto">
							<span class="sr-only">Open main menu</span>
							<svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
								<path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
							</svg>
						</button>
					</div>
					<div class="hidden lg:flex lg:gap-x-12">
						<a href="home.php" class="text-lg font-semibold leading-6 text-white hover:animate-bounce">Home</a>
						<a href="#about-us" class="text-lg font-semibold leading-6 text-white transition duration-500 ease-in-out hover:animate-bounce">About Us</a>
                        <a href="#location" class="text-lg font-semibold leading-6 text-white transition duration-500 ease-in-out hover:animate-bounce">Location</a>
						<a href="#rooms" class="text-lg font-semibold leading-6 text-white transition duration-500 ease-in-out hover:animate-bounce">Rooms</a>						
					</div>
					<div class="hidden lg:flex lg:flex-1 lg:justify-end">
						<a href="#" class="text-sm font-semibold leading-6 text-white"><span aria-hidden="true"></span></a>
					</div>
				</nav>
				<!-- Mobile menu, show/hide based on menu open state. -->
				<div x-show="isOpen" class="lg:hidden fixed inset-0 z-50" role="dialog" aria-modal="true">
					<!-- Background backdrop, show/hide based on slide-over state. -->
					<div class="fixed inset-0 z-50 bg-black bg-opacity-25" @click="isOpen = false"></div>
					<div class="fixed inset-y-0 right-0 z-50 w-full overflow-y-auto bg-white px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10 transition transform duration-300" :class="{ 'translate-x-0': isOpen, 'translate-x-full': !isOpen }">
						<div class="flex items-center justify-between">
							<a href="home.php" class="-m-1.5 p-1.5">
							<span class="sr-only">Your Company</span>
							<img class="h-8 w-auto" src="images/logo.png" alt="">
							</a>
							<button type="button" @click="isOpen = false" class="-m-2.5 rounded-md p-2.5 text-gray-700">
								<span class="sr-only">Close menu</span>
								<svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
									<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
								</svg>
							</button>
						</div>
						<div class="mt-6 flow-root">
							<div class="-my-6 divide-y divide-gray-500/10">
								<div class="space-y-2 py-6">
									<a href="home.php"  class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Home</a>
									<a href="#about-us" @click="isOpen = false" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">About Us</a>
                                    <a href="#location" @click="isOpen = false" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Location</a>
									<a href="#rooms" @click="isOpen = false" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Rooms</a>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
			<div class="header-bg h-screen w-full" id="header-background">
				<div class="welcome-text" id="welcome">
					<p>WELCOME TO HOTEL</p>
				</div>
				<div class="relative isolate px-6 pt-32 lg:px-8 text-white">
					<div class="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80" aria-hidden="true">
					</div>
					<div class="absolute inset-x-0 top-[calc(100%-13rem)] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[calc(100%-30rem)]" aria-hidden="true">
					</div>
				</div>
			</div>
			<!-- About Us & Our Facilities-->
			<div class="container flex flex-col md:flex-row w-screen mx-auto m-10" id="about-us">
				<div class="flex-1 flex flex-col items-center" id="about-us">
					<h1 class="font-bold m-10 text-center text-5xl">About Us</h1>
					<div class="bg-slate-200 rounded-lg p-10 w-3/4 text-2xl text-justify" id="about-us-content">
						<!-- <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Est nemo possimus deleniti molestias, nostrum suscipit provident fugit reprehenderit atque accusamus vel eaque sunt ad iusto animi, modi, illo sint! Voluptatibus? Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque laborum officiis odit ab quisquam eum assumenda molestiae nobis obcaecati aliquid? Sint nisi exercitationem autem temporibus quis quo voluptatum nobis necessitatibus.</p> -->
					</div>
				</div>
				<div class="flex-1 flex flex-col items-center" id="about-us">
					<h1 class="font-bold m-10 text-center text-5xl">Our Facilities</h1>
					<div class="bg-slate-200 rounded-lg p-10 w-3/4 text-2xl text-justify" id="facilities-content">
						<!-- <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem animi ab sunt eaque assumenda exercitationem laudantium magni blanditiis quia ratione, distinctio quam perspiciatis sequi atque quisquam perferendis sint. Sunt, distinctio! Lorem ipsum dolor sit amet consectetur, adipisicing elit.</p> -->
					</div>
				</div>
			</div>
            <!-- Location -->
            <div class="container w-screen justify-items-center mx-auto m-24" id="location">
                <h1 class="font-bold m-10 text-center text-5xl">Our Location</h1>
				<div class="bg-slate-200 rounded-lg p-10 w-3/4 text-2xl text-justify mx-auto" id="location-content">
					<!-- <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem animi ab sunt eaque assumenda exercitationem laudantium magni blanditiis quia ratione, distinctio quam perspiciatis sequi atque quisquam perferendis sint. Sunt, distinctio! Lorem ipsum dolor sit amet consectetur, adipisicing elit.</p> -->
				</div>
            </div>
			<!-- Room Type -->
			<div class="container w-screen justify-items-center mx-auto m-24" id="rooms">
				<h1 class="font-bold m-10 text-center text-5xl">Recommended Room</h1>
				<div class="max-w-4xl mx-auto relative" x-data="getRoomType()">
					<template x-for="slide in slides" :key="slide.id">
						<div x-show="activeSlide === slide.id" class="relative p-24 h-[40rem] flex items-center bg-slate-500 rounded-lg overflow-hidden" x-data="{ open : false }">
							<img :src="slide.image" alt="" class="absolute inset-0 w-full h-full object-cover">
							<div class="absolute bottom-0 left-0  bg-opacity-50 p-4 text-white">
								<h2 class="text-3xl font-bold mb-2" x-text="slide.type"></h2>
								<p class="text-xl" x-text="slide.price"></p>
							</div>
							<button @click="open = true; modalData = slide" class="absolute bottom-4 right-4 bg-white text-black px-4 py-2 rounded text-xl">Discover</button>
                            <!-- Modal -->
                            <div x-show="open" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50">
                                <div class="bg-white rounded-lg p-12 w-1/3 border border-gray-200 shadow-lg mx-auto relative">
                                    <button @click="open = false" class="absolute top-4 right-4 bg-transparent text-black text-2xl font-bold">
                                        &times;
                                    </button>
                                    <img :src="modalData.image" alt="Room image" class="w-full rounded-lg mb-4">
                                    <h1 class="text-3xl font-bold" x-text="modalData.type"></h2>
                                    <p class="text-2xl mb-4" x-text="modalData.price"></p>
                                    <h2 class="text-2xl">Description:</h3>
                                    <p class="mb-4 text-xl" x-text="modalData.detail"></p>
                                    <h2 class="text-2xl">Facilities:</h3>
                                    <p class="mb-4 text-xl" x-text="modalData.facilities"></p>
                                    <div id="room_id" x-text="modalData.id"></div>
									<button onclick="bookRoom()">Book room</button>
									<!-- <button onclick="location.href='bookingHotel.html?service_id=<?php echo $service_id ?>&checkout=<?php echo $checkout ?>&checkin=<?php echo $checkin ?>&room_id=' + modalData.id">Book room</button> -->
                                </div>
                            </div>
						</div>
					</template>
					<!-- Navigation buttons -->
					<div class="absolute top-1/2 transform -translate-y-1/2 left-0">
						<button @click="activeSlide = activeSlide === 1 ? slides.length : activeSlide - 1"
							class="bg-white text-black rounded-full shadow-lg arrow-button">
						&lt;
						</button>
					</div>
					<div class="absolute top-1/2 transform -translate-y-1/2 right-0">
						<button @click="activeSlide = activeSlide === slides.length ? 1 : activeSlide + 1"
							class="bg-white text-black rounded-full shadow-lg arrow-button">
						&gt;
						</button>
					</div>
				</div>
			</div>
			
			<div class="absolute inset-x-0 top-[calc(100%-30rem)] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[calc(100%-30rem)]" aria-hidden="true">
				<div class="relative left-[calc(50%+3rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%+36rem)] sm:w-[72.1875rem]" style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"></div>
			</div>
		</div>
		<script>
			function bookRoom() {
				var room_id = document.getElementById('room_id').innerText.trim();
				var service_id = "<?php echo $service_id ?>";
				var checkin = "<?php echo $checkin ?>";
				var checkout = "<?php echo $checkout ?>";

				var url = './bookingHotel.html?service_id=' + service_id + '&checkout=' + checkout + '&checkin=' + checkin + '&room_id=' + room_id;
				
				// Redirect to the constructed URL
				location.href = url;
			}

			document.addEventListener('DOMContentLoaded', function () {
				async function fetchHotelData(serviceId) {
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
					const url = serviceIdToIpMap[serviceId];

					try {
						const response = await fetch(url, {
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
				const serviceId = <?php echo json_encode($service_id); ?>; 
				fetchHotelData(serviceId)
			});

			function getRoomType(serviceId) {
				return {
					activeSlide: 1,
					slides: [],
					modalData: {},

					async fetchRoomType() {
						const serviceIdToIpMap = {
							1: 'http://52.200.174.164:8003/hotel/room_type',
							2: 'http://44.218.207.165:8009/hotel/room_type',
							3: 'http://50.16.176.111:8005/hotel/room_type',
							4: 'http://3.215.46.161:8011/hotel/room_type',
							5: 'http://3.215.46.161:8013/hotel/room_type',
							6: 'http://100.28.104.239:8007/hotel/room_type'
							// Add more mappings as needed
						}; 
						
						// ganti ip ketika serviceId berbeda
						const url = serviceIdToIpMap[<?php echo json_encode($service_id); ?>];
						// console.log("aaaa",url)
						try {
							const response = await fetch(url, {
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

				const roomTypeComponent = getRoomType($service_id);
            	roomTypeComponent.init();
			}

		</script>
		<!-- <script src="assets/js/fetchAPI.js" defer></script> -->
	</body>
</html>