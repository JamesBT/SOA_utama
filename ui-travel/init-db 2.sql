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
-- Database: `travel_agent_2`
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
(1, 1, 'Pink Beach', '2024-07-01', 1000000, NULL, NULL),
(2, 2, '-', '2024-07-02', 0, NULL, NULL),
(3, 3, '-', '2024-07-03', 0, NULL, NULL),
(4, 4, 'Nara Park', '2024-07-10', 500000, NULL, NULL),
(5, 5, 'Todaiji Temple', '2024-07-11', 100000, NULL, NULL),
(6, 6, 'Padar Island', '2024-08-01', 15000, NULL, NULL),
(7, 7, 'Kanawa Island', '2024-08-02', 150000, NULL, NULL),
(8, 8, 'Warebo Village', '2024-08-03', 100000, NULL, NULL),
(9, 9, 'Myeongdong Shopping Street', '2024-08-10', 0, NULL, NULL),
(10, 10, 'Gyeongbokgung Palace', '2024-08-11', 1000000, NULL, NULL);

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
(1, 1, 'ML123', 'Maldives Airlines', '08:00', '14:00', 'Economy', NULL, NULL),
(2, 2, '-', '-', '-', '-', '-', NULL, NULL),
(3, 3, 'ML124', 'Maldives Airlines', '16:00', '22:00', 'Economy', NULL, NULL),
(4, 4, 'Garuda Indonesia', 'GA456', '09:00', '11:00', 'Business', NULL, NULL),
(5, 5, 'Garuda Indonesia', 'GA457', '18:00', '20:00', 'Business', NULL, NULL),
(6, 6, 'Air Asia', 'AA789', '10:00', '22:00', 'Economy', NULL, NULL),
(7, 7, '-', '-', '-', '-', '-', NULL, NULL),
(8, 8, 'Air Asia', 'AA790', '12.00', '24.00', 'Economy', NULL, NULL),
(9, 9, 'Korean Airlines', 'KR987', '08:00', '10:00', 'Economy', NULL, NULL),
(10, 10, 'Korean Airlines', 'KR988', '20:00', '22:00', 'Economy', NULL, NULL);

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
(1, 1, 'Hotel Maldives 1', '123 Maldives St', 'Double', 101, NULL, NULL),
(2, 2, 'Hotel Maldives 2', '456 Maldives St', 'Family ', 102, NULL, NULL),
(3, 3, 'Hotel Maldives 3', '789 Maldives St', 'Suite', 103, NULL, NULL),
(4, 4, 'Hotel Japan 1', '123 Sta Rd', 'Double', 201, NULL, NULL),
(5, 5, 'Hotel Japan 2', '456 Sta Rd', 'Single', 202, NULL, NULL),
(6, 6, 'Hotel LBJ 1', '123 LBJ Str', 'Double', 301, NULL, NULL),
(7, 7, 'Hotel LBJ 2', '456 LBJ Str', 'Single', 302, NULL, NULL),
(8, 8, 'Hotel LBJ 3', '789 LBJ Str', 'Suite', 303, NULL, NULL),
(9, 9, 'Hotel Seoul 1', '123 Seoul St', 'Double', 401, NULL, NULL),
(10, 10, 'Hotel Seoul 2', '456 Seoul St', 'Suite', 402, NULL, NULL);

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
(1, 'Maldives Honeymoon', 'Enjoy a delightful 3-day trip to Maldives with visits to popular attractions.', '2024-07-01', '2024-07-03', '2', 10, 20000000, 'https://travelagentimages.s3.amazonaws.com/maldives_honeymoon.jpg', NULL, NULL),
(2, 'Japan Arcade', 'A relaxing 2-day escape to Japan with scenic views and cultural experiences.', '2024-07-10', '2024-07-11', '4', 15, 15200000, 'https://travelagentimages.s3.amazonaws.com/japan_arcade.jpg', NULL, NULL),
(3, 'Labuan Bajo Escape', 'A 3-day adventure in Labuan Bajo with visits to iconic landmarks.', '2024-08-01', '2024-08-03', '2', 20, 6000000, 'https://travelagentimages.s3.amazonaws.com/labuan_bajo_escape.jpg', NULL, NULL),
(4, 'Korea Sonata', 'A quick 2-day getaway to Korea with shopping and sightseeing', '2024-08-10', '2024-08-11', '3', 25, 15000000, 'https://travelagentimages.s3.amazonaws.com/korea_sonata.jpg', NULL, NULL);

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
(1, 1, 1, 'Depart from Surabaya and arrive in Maldives. Visit Beach in Maldives.', 'Surabaya', 'Maldives City', NULL, NULL),
(2, 1, 2, 'Stay in Maldives and Free Time.', 'Maldives', 'Maldives', NULL, NULL),
(3, 1, 3, 'Free Time. Return to Surabaya.', 'Maldives', 'Surabaya', NULL, NULL),
(4, 2, 1, 'Depart from Jakarta and arrive in Tokyo. Visit Nara Park.', 'Jakarta', 'Nara', NULL, NULL),
(5, 2, 2, 'Visit Todaiji Temple. Return to Jakarta.', 'Nara', 'Jakarta', NULL, NULL),
(6, 3, 1, 'Depart from Surabaya and arrive in Labuan Bajo. Visit Padar Island.', 'Surabaya', 'Labuan Bajo', NULL, NULL),
(7, 3, 2, 'Visit Kanawa Island.', 'Labuan Bajo', 'Labuan Bajo', NULL, NULL),
(8, 3, 3, 'Visit Warebo Village. Return to Surabaya', 'Labuan Bajo', 'Surabaya', NULL, NULL),
(9, 4, 1, 'Depart from Jakarta and arrive in Seoul. Visit Myeongdong Shopping Street.', 'Jakarta', 'Seoul', NULL, NULL),
(10, 4, 2, 'Visit Gyeongbokgung. Return to Jakarta.', 'Seoul', 'Jakarta', NULL, NULL);

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
(1, 'Nicholas Tour', 'nicholastour@gmail.com', '081357924680', NULL, NULL);

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
