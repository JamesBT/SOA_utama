-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 04:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_agent_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `attraction_details`
--

CREATE TABLE `attraction_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_details_id` bigint(20) UNSIGNED NOT NULL,
  `attraction_name` varchar(255) NOT NULL,
  `visit_date` date NOT NULL,
  `entry_fee` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attraction_details`
--

INSERT INTO `attraction_details` (`id`, `package_details_id`, `attraction_name`, `visit_date`, `entry_fee`, `created_at`, `updated_at`) VALUES
(1, 1, 'Disney Land', '2024-07-01', 1000000, NULL, NULL),
(2, 2, 'Tokyo National Museum', '2024-07-02', 500000, NULL, NULL),
(3, 3, 'Ueno Park', '2024-07-03', 0, NULL, NULL),
(4, 4, 'Tanah Lot', '2024-07-10', 300000, NULL, NULL),
(5, 5, 'Uluwatu Temple', '2024-07-11', 250000, NULL, NULL),
(6, 6, 'Eiffel Tower', '2024-08-01', 2500000, NULL, NULL),
(7, 7, 'Louvre Museum', '2024-08-02', 1500000, NULL, NULL),
(8, 8, 'Notre Dame', '2024-08-03', 1000000, NULL, NULL),
(9, 9, 'Grand Palace', '2024-08-10', 500000, NULL, NULL),
(10, 10, 'Chatuchak Market', '2024-08-11', 0, NULL, NULL),
(11, 11, 'Sydney Opera House', '2024-09-01', 2000000, NULL, NULL),
(12, 12, 'Bondi Beach', '2024-09-02', 0, NULL, NULL),
(13, 13, 'Taronga Zoo', '2024-09-03', 350000, NULL, NULL),
(14, 14, 'Tanah Lot', '2024-06-18', 300000, NULL, NULL),
(15, 15, 'Uluwatu Temple', '2024-06-19', 250000, NULL, NULL),
(16, 16, '-', '2024-06-20', 0, NULL, NULL),
(17, 17, 'Prambanan Temple', '2024-06-25', 250000, NULL, NULL),
(18, 18, 'Borobudur Temple', '2024-06-26', 300000, NULL, NULL),
(19, 19, 'Malioboro Street', '2024-06-27', 0, NULL, NULL),
(20, 20, '-', '2024-06-28', 0, NULL, NULL),
(21, 21, '-', '2024-07-05', 0, NULL, NULL),
(22, 22, 'Gardens by the Bay', '2024-07-06', 500000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `user_id`, `package_id`, `created_at`, `updated_at`) VALUES
(11, 1, 3, NULL, NULL),
(12, 1, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flight_details`
--

CREATE TABLE `flight_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_details_id` bigint(20) UNSIGNED NOT NULL,
  `airline_name` varchar(255) NOT NULL,
  `flight_number` varchar(255) NOT NULL,
  `departure_time` varchar(255) NOT NULL,
  `arrival_time` varchar(255) NOT NULL,
  `flight_class` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight_details`
--

INSERT INTO `flight_details` (`id`, `package_details_id`, `airline_name`, `flight_number`, `departure_time`, `arrival_time`, `flight_class`, `created_at`, `updated_at`) VALUES
(1, 1, 'JL123', 'Japan Airlines', '08:00', '14:00', 'Economy', NULL, NULL),
(2, 2, '-', '-', '-', '-', '-', NULL, NULL),
(3, 3, 'JL124', 'Japan Airlines', '16:00', '22:00', 'Economy', NULL, NULL),
(4, 4, 'Garuda Indonesia', 'GA456', '09:00', '11:00', 'Business', NULL, NULL),
(5, 5, 'Garuda Indonesia', 'GA457', '18:00', '20:00', 'Business', NULL, NULL),
(6, 6, 'Air France', 'AF789', '10:00', '22:00', 'Economy', NULL, NULL),
(7, 7, '-', '-', '-', '-', '-', NULL, NULL),
(8, 8, 'Air France', 'AF790', '12.00', '24.00', 'Economy', NULL, NULL),
(9, 9, 'Singapore Airlines', 'SQ987', '08:00', '10:00', 'Economy', NULL, NULL),
(10, 10, 'Singapore Airlines', 'SQ988', '20:00', '22:00', 'Economy', NULL, NULL),
(11, 11, 'Qantas', 'QF123', '09:00', '10:30', 'Economy', NULL, NULL),
(12, 12, '-', '-', '-', '-', '-', NULL, NULL),
(13, 13, 'Qantas', 'QF124', '18:00', '19;30', 'Economy', NULL, NULL),
(14, 14, 'Air Asia', 'AA123', '10:00', '11:00', 'Economy', NULL, NULL),
(15, 15, '-', '-', '-', '-', '-', NULL, NULL),
(16, 16, 'Air Asia', 'AA456', '15:00', '16:00', 'Economy', NULL, NULL),
(17, 17, 'Garuda Indonesia', 'GA135', '08:30', '09:30', 'Economy', NULL, NULL),
(18, 18, '-', '-', '-', '-', '-', NULL, NULL),
(19, 19, '-', '-', '-', '-', '-', NULL, NULL),
(20, 20, 'Garuda Indonesia', 'GA246', '17:00', '18:30', 'Business', NULL, NULL),
(21, 21, 'Singapore Airlines', 'SQ345', '18:00', '21:00', 'Business', NULL, NULL),
(22, 22, 'Singapore Airlines', 'SQ890', '19:00', '22:00', 'Business', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_details`
--

CREATE TABLE `hotel_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_details_id` bigint(20) UNSIGNED NOT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `room_type` varchar(255) NOT NULL,
  `room_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotel_details`
--

INSERT INTO `hotel_details` (`id`, `package_details_id`, `hotel_name`, `address`, `room_type`, `room_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hotel Tokyo 1', '123 Tokyo St', 'Double', 101, NULL, NULL),
(2, 2, 'Hotel Tokyo 2', '456 Tokyo St', 'Family ', 102, NULL, NULL),
(3, 3, 'Hotel Tokyo 3', '789 Tokyo St', 'Suite', 103, NULL, NULL),
(4, 4, 'Hotel Bali 1', '123 Bali Rd', 'Double', 201, NULL, NULL),
(5, 5, 'Hotel Bali 2', '456 Bali Rd', 'Suite', 202, NULL, NULL),
(6, 6, 'Hotel Paris 1', '123 Paris Ave', 'Double', 301, NULL, NULL),
(7, 7, 'Hotel Paris 2', '456 Paris Ave', 'Single', 302, NULL, NULL),
(8, 8, 'Hotel Paris 3', '789 Paris Ave', 'Suite', 303, NULL, NULL),
(9, 9, 'Hotel Bangkok 1', '123 Bangkok St', 'Double', 401, NULL, NULL),
(10, 10, 'Hotel Bangkok 2', '456 Bangkok St', 'Suite', 402, NULL, NULL),
(11, 11, 'Hotel Sydney 1', '123 Sydney Rd', 'Suite', 501, NULL, NULL),
(12, 12, 'Hotel Sydney 2', '456 Sydney Rd', 'Single', 502, NULL, NULL),
(13, 13, 'Hotel Sydney 3', '789 Sydney Rd', 'Double', 503, NULL, NULL),
(14, 14, 'Grand Inna Kuta', 'Jl. Pantai Kuta No.1, Kuta, Bali', 'Deluxe', 601, NULL, NULL),
(15, 15, 'Grand Inna Kuta', 'Jl. Pantai Kuta No.1, Kuta, Bali', 'Premium', 602, NULL, NULL),
(16, 16, 'Grand Inna Kuta', 'Jl. Pantai Kuta No.1, Kuta, Bali', 'Suite', 603, NULL, NULL),
(17, 17, 'Hyatt Regency Yogyakarta', 'Jl. Palagan Tentara Pelajar, Ngaglik, Sleman, Yogyakarta', 'Suite', 701, NULL, NULL),
(18, 18, 'Hyatt Regency Yogyakarta', 'Jl. Palagan Tentara Pelajar, Ngaglik, Sleman, Yogyakarta', 'Suite', 701, NULL, NULL),
(19, 19, 'Hyatt Regency Yogyakarta', 'Jl. Palagan Tentara Pelajar, Ngaglik, Sleman, Yogyakarta', 'Suite', 701, NULL, NULL),
(20, 20, 'Hyatt Regency Yogyakarta', 'Jl. Palagan Tentara Pelajar, Ngaglik, Sleman, Yogyakarta', 'Suite', 701, NULL, NULL),
(21, 21, 'Marina Bay Sands', '10 Bayfront Ave, Singapore', 'Deluxe', 801, NULL, NULL),
(22, 22, 'Marina Bay Sands', '10 Bayfront Ave, Singapore', 'Deluxe', 801, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `departure_date` date NOT NULL,
  `return_date` date NOT NULL,
  `number_of_people` varchar(255) NOT NULL,
  `quota` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `name`, `description`, `departure_date`, `return_date`, `number_of_people`, `quota`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Tokyo Delight', 'Enjoy a delightful 3-day trip to Tokyo with visits to popular attractions.', '2024-07-01', '2024-07-03', '2', 6, 16500000, 'https://travelagentimages.s3.amazonaws.com/tokyo_delight.jpg', NULL, NULL),
(2, 'Bali Escape', 'A relaxing 2-day escape to Bali with scenic views and cultural experiences.', '2024-07-10', '2024-07-11', '4', 11, 13200000, 'https://travelagentimages.s3.amazonaws.com/bali_escape.jpg', NULL, NULL),
(3, 'Paris Adventure', 'A 3-day adventure in Paris with visits to iconic landmarks.', '2024-08-01', '2024-08-03', '2', 15, 33000000, 'https://travelagentimages.s3.amazonaws.com/paris_adventure.jpg', NULL, NULL),
(4, 'Bangkok Getaway', 'A quick 2-day getaway to Bangkok with shopping and sightseeing', '2024-08-10', '2024-08-11', '2', 21, 14800000, 'https://travelagentimages.s3.amazonaws.com/bangkok_getaway.jpg', NULL, NULL),
(5, 'Sydney Explorer', 'Explore Sydney over a 3-day period with visits to iconic spots.', '2024-09-01', '2024-09-03', '3', 26, 20000000, 'https://travelagentimages.s3.amazonaws.com/sydney_explorer.jpg', NULL, NULL),
(6, 'Bali Retreat', 'Explore Bali including Tanah Lot and Uluwatu Temple', '2024-06-18', '2024-06-20', '2', 17, 8000000, 'https://travelagentimages.s3.amazonaws.com/bali_retreat.jpg', NULL, NULL),
(7, 'Yogyakarta Journey', 'Discover Yogyakarta including Prambanan and Borobudur', '2024-06-25', '2024-06-28', '4', 11, 12000000, 'https://travelagentimages.s3.amazonaws.com/yogyakarta_journey.jpg', NULL, NULL),
(8, 'Singapore Trip', 'Short trip to Singapore and visit Gardens by the Bay', '2024-07-05', '2024-07-06', '2', 7, 10000000, 'https://travelagentimages.s3.amazonaws.com/singapore_trip.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_details`
--

CREATE TABLE `package_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `origin_city` varchar(255) NOT NULL,
  `destination_city` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_details`
--

INSERT INTO `package_details` (`id`, `package_id`, `day`, `description`, `origin_city`, `destination_city`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Depart from Surabaya and arrive in Tokyo. Visit Disney Land.', 'Surabaya', 'Tokyo', NULL, NULL),
(2, 1, 2, 'Stay in Tokyo and visit Tokyo National Museum.', 'Tokyo', 'Tokyo', NULL, NULL),
(3, 1, 3, 'Visit Ueno Park. Return to Surabaya.', 'Tokyo', 'Surabaya', NULL, NULL),
(4, 2, 1, 'Depart from Jakarta and arrive in Bali. Visit Tanah Lot.', 'Jakarta', 'Bali', NULL, NULL),
(5, 2, 2, 'Visit Uluwatu Temple. Return to Jakarta.', 'Bali', 'Jakarta', NULL, NULL),
(6, 3, 1, 'Depart from New York and arrive in Paris. Visit Eiffel Tower.', 'New York', 'Paris', NULL, NULL),
(7, 3, 2, 'Stay in Paris. Visit Louvre Museum.', 'Paris', 'Paris', NULL, NULL),
(8, 3, 3, 'Visit Notre Dame. Return to New York.', 'Paris', 'New York', NULL, NULL),
(9, 4, 1, 'Depart from Singapore and arrive in Bangkok. Visit Grand Palace.', 'Singapore', 'Bangkok', NULL, NULL),
(10, 4, 2, 'Visit Chatuchak Market. Return to Singapore.', 'Bangkok', 'Singapore', NULL, NULL),
(11, 5, 1, 'Depart from Melbourne and arrive in Sydney. Visit Sydney Opera House.', 'Melbourne', 'Sydney', NULL, NULL),
(12, 5, 2, 'Stay in Sydney. Visit Bondi Beach.', 'Sydney', 'Sydney', NULL, NULL),
(13, 5, 3, 'Visit Taronga Zoo. Return to Melbourne.', 'Sydney', 'Melbourne', NULL, NULL),
(14, 6, 1, 'Flight from Surabaya to Bali and visit Tanah Lot', 'Surabaya', 'Bali', NULL, NULL),
(15, 6, 2, 'Stay in Bali and visit Uluwatu Temple', 'Bali', 'Bali', NULL, NULL),
(16, 6, 3, 'Flight back to Surabaya', 'Bali', 'Surabaya', NULL, NULL),
(17, 7, 1, 'Flight from Jakarta to Yogyakarta and visit Prambanan Temple', 'Jakarta', 'Yogyakarta', NULL, NULL),
(18, 7, 2, 'Stay in Yogyakarta and visit Borobudur Temple.', 'Yogyakarta', 'Yogyakarta', NULL, NULL),
(19, 7, 3, 'Stay in Yogyakarta and explore Malioboro Street.', 'Yogyakarta', 'Yogyakarta', NULL, NULL),
(20, 7, 4, 'Flight back to Jakarta', 'Yogyakarta', 'Jakarta', NULL, NULL),
(21, 8, 1, 'Flight from Bandung to Singapore', 'Bandung', 'Jurong', NULL, NULL),
(22, 8, 2, 'Visit Gardens by the Bay and flight back to Bandung', 'Jurong', 'Bandung', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `travel_agent`
--

CREATE TABLE `travel_agent` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `travel_agent`
--

INSERT INTO `travel_agent` (`id`, `name`, `email`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 'Louis Tour', 'louistour@gmail.com', '08123456789', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attraction_details`
--
ALTER TABLE `attraction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attraction_details_package_details_id_foreign` (`package_details_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_user_id_foreign` (`user_id`),
  ADD KEY `booking_package_id_foreign` (`package_id`);

--
-- Indexes for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_details_package_details_id_foreign` (`package_details_id`);

--
-- Indexes for table `hotel_details`
--
ALTER TABLE `hotel_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_details_package_details_id_foreign` (`package_details_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_details`
--
ALTER TABLE `package_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_details_package_id_foreign` (`package_id`);

--
-- Indexes for table `travel_agent`
--
ALTER TABLE `travel_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attraction_details`
--
ALTER TABLE `attraction_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `flight_details`
--
ALTER TABLE `flight_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `hotel_details`
--
ALTER TABLE `hotel_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `package_details`
--
ALTER TABLE `package_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `travel_agent`
--
ALTER TABLE `travel_agent`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attraction_details`
--
ALTER TABLE `attraction_details`
  ADD CONSTRAINT `attraction_details_package_details_id_foreign` FOREIGN KEY (`package_details_id`) REFERENCES `package_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD CONSTRAINT `flight_details_package_details_id_foreign` FOREIGN KEY (`package_details_id`) REFERENCES `package_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hotel_details`
--
ALTER TABLE `hotel_details`
  ADD CONSTRAINT `hotel_details_package_details_id_foreign` FOREIGN KEY (`package_details_id`) REFERENCES `package_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_details`
--
ALTER TABLE `package_details`
  ADD CONSTRAINT `package_details_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
