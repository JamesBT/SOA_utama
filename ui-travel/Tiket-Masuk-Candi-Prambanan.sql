-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221113.0eded7bb43
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 06:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atraksi_soa`
--

-- --------------------------------------------------------

--
-- Table structure for table `atraksis`
--

CREATE TABLE `atraksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_penting` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `highlight` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `negara` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gps_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lowest_price` double NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `atraksis`
--



INSERT INTO `atraksis` (`id`, `title`, `slug`, `deskripsi`, `info_penting`, `highlight`, `alamat`, `provinsi`, `provinsi_name`, `kota`, `kota_name`, `negara`, `gps_location`, `lowest_price`, `is_active`, `created_at`, `updated_at`) VALUES
(`1`, `Tiket Masuk Candi Prambanan`, `Tiket-Masuk-Candi-Prambanan`, `<div id="section-description-pdp" class="RichText_description_preview__X9xZ4 SectionDescription_description_preview__bQyOL Text_text__DSnue"><p>Candi Prambanan adalah destinasi wisata yang wajib dikunjungi saat liburan di Jogja. Nikmati petualangan jalan-jalan di Yogyakarta dengan mengunjungi berbagai tempat wisata hits bersama orang yang kamu cintai, keluarga, bersama pasangan, dan teman-temanmu.</p> <br> <p>Selama perjalanan, kamu akan mengunjungi beberapa tempat wisata di Jogja yang terkenal. Di Candi Prambanan, kamu akan disuguhkan kisah Roro Jonggrang yang memberikan tantangan bagi Bandung Bondowoso untuk membangun 1.000 candi dalam waktu 1 malam.</p> <br> <p>Eksplor beragam area di Candi Prambanan sambil menikmati sejarah dan budaya Indonesia.</p> <br></div>`, `<div class="RichText_description_preview__X9xZ4 SectionHighlight_rich_text__1TPtd Text_text__DSnue"><p><strong>Jadwal A Tale of Love and Wisdom Ramayana Ballet Prambanan</strong></p> <ul> <li>Indoor: 1,6,8,13,15,20,22,27,29</li> <li>Outdoor: 3,10,17,24,31</li> <li>Start pukul 20.30</li> </ul> <p><strong>Penting</strong></p> <ul> <li>Wajib mematuhi protokol kesehatan (CHSE).</li> <li>Pengunjung dapat mengunjungi Zona 1 Candi Prambanan sampai ke pelataran/halaman candi. Tidak diperbolehkan untuk memasuki bilik / menaiki bangunan candi.</li> <li>Setiap hari Senin, zona 1 (halaman candi) tutup untuk kunjungan. Tamu dapat mengunjungi zona 2 (taman-taman sekitar candi).</li> <li>Setiap Selasa-Minggu, pengunjung dapat berkunjung sampai ke Zona 1 (sampai ke halaman candi).</li> </ul> <p><strong>Jam Operasional</strong></p> <ul> <li>Jam Buka Pelataran Candi (Zona 1): 07.00-17.00 WIB</li> <li>Jam Operasional Candi Prambanan: 06.30 - 16.30 WIB</li> <li>Jam Buka Gate Parkir: 06.00-16.30 WIB</li> </ul></div>`, `<ul> <li>Candi Prambanan merupakan tempat untuk mempelajari cerita-cerita bersejarah. Dengan harga tiket Candi Prambanan Yogyakarta yang terjangkau, kamu sudah bisa memasuki kompleks candi.</li> <li>Tiket masuk Prambanan Jogja juga memberikanmu akses ke beberapa area di dalam kompleks.</li> <li>Cocok untuk: <strong>Keluarga Asyik </strong>dan <strong>Geng Asyik.</strong></li> </ul>`, `<span class="SectionLocation_full_address__11EQ8 Text_text__DSnue Text_size_b2__y3Q2E">Prambanan, Sleman, Provinsi Yogyakarta, Indonesia</span>`, `5`, `DI Yogyakarta`, `===`, `Sleman`, `Indonesia`, `-7.752021, 110.491467`, 50000, 1, '2024-06-25 13:58:21', `2024-06-25 13:58:21`);



-- --------------------------------------------------------

--
-- Table structure for table `etickets`
--

CREATE TABLE `etickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paket_id` bigint(20) UNSIGNED NOT NULL,
  `jenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_at` date NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etickets`
--

INSERT INTO `etickets` (`id`, `booking_code`, `ticket_code`, `paket_id`, `jenis`, `valid_at`, `check_in`, `created_at`, `updated_at`) VALUES
(1, 'JAAHD34', 'YVT58Y', 1, 'Regular', '2024-06-12', NULL, '2024-06-12 06:39:02', NULL),
(2, 'JAAHD34', '4GSON2', 1, 'Regular', '2024-06-12', NULL, '2024-06-12 06:39:02', NULL),
(3, 'JAAHD34', 'FYI8RH', 1, 'Regular', '2024-06-16', '2024-06-16 13:47:56', '2024-06-16 06:47:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jam_bukas`
--

CREATE TABLE `jam_bukas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `atraksi_id` bigint(20) UNSIGNED NOT NULL,
  `hari` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jam_bukas`
--

INSERT INTO `jam_bukas` (`id`, `atraksi_id`, `hari`, `waktu`, `is_open`, `created_at`, `updated_at`) VALUES
(1, 1, 'Senin', '09:00 - 17:00', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(2, 1, 'Selasa', '09:00 - 17:00', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(3, 1, 'Rabu', '09:00 - 17:00', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(4, 1, 'Kamis', '09:00 - 17:00', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(5, 1, 'Jumat', '09:00 - 17:00', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(6, 1, 'Sabtu', '09:00 - 17:00', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(7, 1, 'Minggu', '09:00 - 17:00', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `pakets`
--

CREATE TABLE `pakets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `atraksi_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fasilitas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cara_penukaran` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `syarat_dan_ketentuan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double NOT NULL,
  `kuota` int(11) NOT NULL,
  `is_refundable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pakets`
--

INSERT INTO `pakets` (`id`, `atraksi_id`, `type_id`, `title`, `deskripsi`, `fasilitas`, `cara_penukaran`, `syarat_dan_ketentuan`, `harga`, `kuota`, `is_refundable`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Tiket WNI', '<p>Berlaku untuk WNI (pemegang KTP/KITAS)</p>', `<li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E">Tiket Masuk</li>`, `<ul> <li>Tukarkan e-tiket dengan tiket asli langsung di <em>self-printing machine </em>Kiosk di lokasi.</li> <li>Cukup <em>scan </em>QR Code<strong> </strong>pada mesin dan cetak tiket aslinya.</li> </ul>`, `<div data-testid="package-tnc" class="RichText_description_preview__X9xZ4 Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"><p><strong>Umum</strong></p> <ul> <li>Harga sudah termasuk pajak.</li> <li>Tiket yang sudah dibeli tidak dapat dikembalikan (<em>non-refundable</em>).</li> <li>Tiket yang sudah dibeli tidak dapat diganti jadwalnya</li> <li>Pembeli wajib mengisi data diri pribadi saat memesan.</li> <li>Penjualan tiket sewaktu-waktu dapat dihentikan atau dimulai oleh tiket.com sesuai dengan kebijakan dari promotor atau tiket.com.</li> <li>Pihak manajemen tidak bertanggung jawab atas kesalahan pembeli pada saat proses reservasi online.</li> </ul> <p><strong>E-tiket</strong></p> <ul> <li>E-tiket tidak dapat diuangkan.</li> </ul> <p><strong>Kategori Usia</strong></p> <ul> <li>Anak: 3-10 tahun</li> <li>Dewasa: 11 tahun ke atas</li> <li>Bayi tidak dikenakan biaya tiket (1-2 tahun).</li> </ul></div>`, 50000, 100, 1, `2024-06-25 16:23:21`, `2024-06-25 16:23:21`),

(2, 1, 2, 'Tiket WNA', `<div data-testid="package-description" class="RichText_description_preview__X9xZ4 Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"><p>Berlaku untuk WNA (pemegang paspor)</p></div>`, `<ul class="SectionWhatsIncluded_item_wrapper__VFBPs"><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E">Tiket Masuk</li></ul>`, `<ul> <li>Tukarkan e-tiket dengan tiket asli langsung di <em>self-printing machine </em>Kiosk di lokasi.</li> <li>Cukup <em>scan </em>QR Code<strong> </strong>pada mesin dan cetak tiket aslinya.</li> </ul>`, `<div data-testid="package-tnc" class="RichText_description_preview__X9xZ4 Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"><p><strong>Umum</strong></p> <ul> <li>Harga sudah termasuk pajak.</li> <li>Tiket yang sudah dibeli tidak dapat dikembalikan (<em>non-refundable</em>).</li> <li>Tiket yang sudah dibeli tidak dapat diganti jadwalnya</li> <li>Pembeli wajib mengisi data diri pribadi saat memesan.</li> <li>Penjualan tiket sewaktu-waktu dapat dihentikan atau dimulai oleh tiket.com sesuai dengan kebijakan dari promotor atau tiket.com.</li> <li>Pihak manajemen tidak bertanggung jawab atas kesalahan pembeli pada saat proses reservasi online.</li> </ul> <p><strong>E-tiket</strong></p> <ul> <li>E-tiket tidak dapat diuangkan.</li> </ul> <p><strong>Kategori Usia</strong></p> <ul> <li>Anak: 3-10 tahun</li> <li>Dewasa: 11 tahun ke atas</li> <li>Bayi tidak dikenakan biaya tiket (1-2 tahun).</li> </ul></div>`, 398750, 100, 1, `2024-06-25 16:28:41`, `2024-06-25 16:28:41`);

-- --------------------------------------------------------

--
-- Table structure for table `tgl_tutups`
--

CREATE TABLE `tgl_tutups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `atraksi_id` bigint(20) UNSIGNED NOT NULL,
  `tgl` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tgl_tutups`
--

INSERT INTO `tgl_tutups` (`id`, `atraksi_id`, `tgl`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-06-13', '2024-06-12 15:10:09', NULL),
(2, 1, '2024-06-26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2024-06-11 08:22:53', '2024-06-11 08:22:53', 'Regular'),
(2, '2024-06-11 08:22:53', '2024-06-11 08:22:53', 'Fast Track');

--
-- Indexes for dumped tables
--

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `atraksi_id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `atraksi_id`, `image`, `placeholder`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2001162996889/Tiket-Candi-Prambanan-2de95c9b-262e-4bb4-b74e-a3920cef3222.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'prambanan1', NULL, NULL),
(2, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2001162996889/Tiket-Candi-Prambanan-194e6a55-987b-485b-bd69-baae8d38fafa.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'prambanan2', NULL, NULL),
(3, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2001162996889/Tiket-Candi-Prambanan-4b113a62-847d-4f99-a2b3-f2fc8b3079b8.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'prambanan3', NULL, NULL);

--
-- Indexes for table `atraksis`
--
ALTER TABLE `atraksis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `atraksis_slug_unique` (`slug`);

--
-- Indexes for table `etickets`
--
ALTER TABLE `etickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `etickets_ticket_code_unique` (`ticket_code`);

--
-- Indexes for table `jam_bukas`
--
ALTER TABLE `jam_bukas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pakets`
--
ALTER TABLE `pakets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pakets_atraksi_id_foreign` (`atraksi_id`);

--
-- Indexes for table `tgl_tutups`
--
ALTER TABLE `tgl_tutups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_atraksi_id_foreign` (`atraksi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atraksis`
--
ALTER TABLE `atraksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `etickets`
--
ALTER TABLE `etickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jam_bukas`
--
ALTER TABLE `jam_bukas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pakets`
--
ALTER TABLE `pakets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tgl_tutups`
--
ALTER TABLE `tgl_tutups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pakets`
--
ALTER TABLE `pakets`
  ADD CONSTRAINT `pakets_atraksi_id_foreign` FOREIGN KEY (`atraksi_id`) REFERENCES `atraksis` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
