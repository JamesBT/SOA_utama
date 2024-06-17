-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2024 at 07:48 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soa_utama`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(100) NOT NULL,
  `user_status` int(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jenis` int(1) NOT NULL,
  `password` varchar(72) NOT NULL,
  `tgl_ultah` date NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `gender` int(1) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `negara` varchar(100) NOT NULL,
  `request_acc_forgot` int(1) DEFAULT NULL,
  `request_forgot_date` date DEFAULT NULL,
  `request_forgot_code` int(10) DEFAULT NULL,
  `request_acc_delete` tinyint(1) DEFAULT NULL,
  `request_delete_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_status`, `name`, `username`, `email`, `jenis`, `password`, `tgl_ultah`, `no_telp`, `gender`, `kota`, `negara`, `request_acc_forgot`, `request_forgot_date`, `request_forgot_code`, `request_acc_delete`, `request_delete_date`) VALUES
(1, 1, 'dummy1', 'dummy1', 'dummy1@gmail.com', 1, 'dummy1', '2006-01-22', '081234567890', 2, 'dummy1', 'dummy1', NULL, NULL, NULL, NULL, NULL),
(2, 1, 'dummy2', 'dummy2', 'dummy2@gmail.com', 1, 'dummy2', '2024-06-04', '12345678901', 1, 'dummy2', 'dummy2', NULL, NULL, NULL, NULL, NULL),
(3, 1, 'dummy3', 'dummy3', 'dummy3@gmail.com', 1, 'dummy12345', '2006-01-22', '081234567890', 1, 'dummy3', 'dummy3', NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
