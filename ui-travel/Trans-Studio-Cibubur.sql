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
(1, 'Trans Studio Cibubur', 'Trans-Studio-Cibubur', `<div id="section-description-pdp" class="RichText_description_preview__X9xZ4 SectionDescription_description_preview__bQyOL Text_text__DSnue"><p>Trans Studio Cibubur adalah indoor theme park berkelas dunia yang memiliki letak yang sangat strategis.</p> <br> <p>TSM Cibubur merupakan <a href="https://www.tiket.com/to-do/region/jawa-barat" title="tempat wisata di Jawa Barat">tempat wisata di Jawa Barat</a> yang menyuguhkan berbagai wahana dan atraksi yang sangat menarik, hingga wahana ekstrim yang didukung dengan kemajuan teknologi yang canggih dan berstandar internasional, sehingga menjadikan tempat ini menjadi pilihan destinasi wisata yang sangat cocok untuk menghabiskan waktu bersama dengan anak-anak, keluarga maupun orang terkasih.</p> <br> <p>Tak perlu khawatir Trans Studio Cibubur harga tiket masuknya sangat terjangkau dan kamu dapat menggunakan kartu kreditmu selama di sana!</p> <br></div>`, `<ul> <li><strong>PERHATIAN: Trans Studio Cibubur tutup untuk publik pada tanggal 29 Juni 2024 hingga pukul 13.00 WIB</strong></li> <li>Jam buka pada hari libur nasional sama dengan jam buka Sabtu &amp; Minggu.</li> </ul>`, `<ul> <li>Trans Studio Cibubur merupakan destinasi wisata keluarga untuk menikmati petualangan tak terlupakan.</li> <li>Bersenang-senanglah di taman hiburan indoor terbesar di Indonesia.</li> <li>Coba wahana 4D di Pacific Rim.</li> <li>Cetak foto keren kamu saat menaiki wahana.</li> <li>Cocok untuk: <strong>Keluarga Asyik </strong>dan <strong>Geng Asyik.</strong></li> </ul>`, `<span class="SectionLocation_full_address__11EQ8 Text_text__DSnue Text_size_b2__y3Q2E">Jl. Alternatif Cibubur No.230, Harjamukti, Kec. Cimanggis, Kota Depok, Jawa Barat 16454, Indonesia, Cimanggis, Depok, Jawa Barat, Indonesia</span>`, `9`, `Jawa Barat`, `====`, `Depok`, `Indonesia`, `-6.375269, 106.901801`, `250000`, `1`, `2024-06-25 13:19:10`, `2024-06-25 13:19:10`);

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
(1, 1, 1, `Tiket Peak Season`, `<ul> <li>1 e-tiket berlaku untuk 1 orang.</li> </ul>`, `<ul class="SectionWhatsIncluded_item_wrapper__VFBPs"><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E">Akses masuk ke Trans Studio Cibubur</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Akses gratis ke semua wahana (kecuali i-Fly)</li></ul>`, `<p>Bawa dan tunjukkan e-tiket ke staf yang bertugas di loket penukaran tiket untuk ditukarkan menjadi tiket asli.</p>`, `<ul> <li>Harga sudah termasuk pajak.</li> <li>Tiket yang sudah dibeli tidak dapat diganti jadwalnya</li> <li>Pembeli wajib mengisi data diri pribadi saat memesan.</li> <li>Penjualan tiket sewaktu-waktu dapat dihentikan atau dimulai oleh tiket.com sesuai dengan kebijakan dari Trans Studio Cibubur atau tiket.com.</li> </ul>`, 250000, 100, 1, `2024-06-25 16:40:51`, `2024-06-25 16:40:51`),
(2, 1, 1, `<div data-testid="package-description" class="RichText_description_preview__X9xZ4 Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"><p><strong>Validitas</strong></p> <ul> <li>1 e-tiket berlaku untuk 1 orang.</li> </ul> <br> <p><strong>Jam buka</strong></p> <ul> <li>Sabtu 11 Mei : 12.00 - 17.00</li> <li>Sabtu 18 Mei : 13.00 - 17.00</li> </ul></div>`, `<div data-testid="package-whats-included" class="SectionWhatsIncluded_content_list__BAWtj"><h6 title="Termasuk" class="Text_text__DSnue Text_size_b2__y3Q2E Text_weight_bold__m4BAY">Termasuk</h6><ul class="SectionWhatsIncluded_item_wrapper__VFBPs"><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E">Akses masuk ke Trans Studio Cibubur</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Tiket i-Fly</li></ul></div>`, `<p>Bawa dan tunjukkan e-tiket ke staf yang bertugas di loket penukaran tiket untuk ditukarkan menjadi tiket asli.</p>`, `<div data-testid="package-tnc" class="RichText_description_preview__X9xZ4 Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"><p><strong>Umum</strong></p> <ul> <li>Harga sudah termasuk pajak.</li> <li>Tiket yang sudah dibeli tidak dapat diganti jadwalnya</li> <li>Pembeli wajib mengisi data diri pribadi saat memesan.</li> <li>Penjualan tiket sewaktu-waktu dapat dihentikan atau dimulai oleh tiket.com sesuai dengan kebijakan dari Trans Studio Cibubur atau tiket.com.</li> </ul> <p><strong>E-tiket</strong></p> <ul> <li>E-tiket tidak dapat diuangkan.</li> </ul> <p><strong>Syarat dan Ketentuan di Lokasi</strong></p> <ul> <li>Makanan dan minuman dari luar tidak diperbolehkan.</li> <li>Hewan peliharaan, benda tajam, dan senjata api tidak diperbolehkan di dalam taman bermain.</li> <li>Ada minimal dan maksimal tinggi pengunjung untuk sejumlah wahana.</li> <li>Mohon diingat bahwa harga tiket berlaku untuk semua umur.</li> <li>Wahana I-FLY memerlukan biaya tambahan.</li> </ul></div>`, 450000, 100, 1, `2024-06-25 16:40:51`, `2024-06-25 16:40:51` );

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
(1, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/4026947611151/Trans-Studio-Cibubur--12dadfe3-426e-4503-a7f8-aa3789158109.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'trans studio cibubur 1', NULL, NULL),
(2, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/4026947611151/Trans-Studio-Cibubur--ef35435a-1c5a-4bca-b71c-b760f405c9ea.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'trans studio cibubur 2', NULL, NULL),
(3, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/4026947611151/Trans-Studio-Cibubur--b9a30a26-b628-4866-9ddb-0212ba327835.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'trans studio cibubur 3', NULL, NULL);
--
-- Indexes for dumped tables
--

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
