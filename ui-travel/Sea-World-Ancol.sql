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
(1, 'Sea World Ancol', 'Sea-World-Ancol', '<p>Sedang mencari destinasi wisata Jakarta yang cocok untuk seluruh keluarga? Ayo, segera kunjungi Sea World Ancol Jakarta sekarang!</p><br><p>SeaWorld Indonesia merupakan tempat wisata keluarga yang mengusung tema pendidikan, konservasi, dan hiburan. Di tempat ini, kamu akan disuguhkan dengan pemandangan hewan-hewan laut, seperti 7.300 ekor biota air tawar, reptil, dan vertebrata. Semua biota laut yang ada di SeaWorld ini dibagi ke dalam 28 display, yaitu 9 akuarium air tawar, 19 akuarium air laut, dan 4 kolam terbuka. </p><p><strong>Jam kunjungan</strong> <strong>KHUSUS di Pantai sepanjang kawasan Symphony of The Sea:</strong> </p><ul> <li>Kunjungan Sesi 1: 06.00-11.00 WIB</li> <li>Kunjungan Sesi 2: 11.00-16.00 WIB</li> <li>Kunjungan Sesi 3: 16.00-21.00 WIB </li> </ul><p>Pembatasan ini hanya berlaku di pantai sepanjang kawasan Symphony of The Sea sesuai tiket masuk pantai yang kamu pilih. Di luar jam kunjungan, kamu tetap dapat melakukan rekreasi sesuai jam operasional di Dunia Fantasi, Seaworld Ancol, Ocean Dream Samudra, Faunaland, Gondola, Allianz Ecopark, Pasar Seni, Pantai Indah, Pantai Festival, dan Restoran.</p><br>', '<ul> <li><strong>Tidak termasuk tiket masuk kendaraan motor/ mobil Pintu Gerbang Utama Ancol</strong>. Beli tiket masuk kendaraan Pintu Gerbang Utama Ancol di sini untuk pengalaman liburan yang tak terlupakan.</li> <li>Pengunjung dilarang membawa makanan dan minuman ke dalam area Sea World</li> <li>Loket tiket di lokasi akan ditutup 1 jam lebih awal dari jam operasional SeaWorld Ancol.</li> </ul>', '<ul> <li>Sea World Ancol merupakan atraksi akuarium di Jakarta yang memamerkan berbagai macam hewan-hewan laut.</li> <li>Lihat langsung hewan air laut yang menakjubkan di 28 display yang tersedia, yaitu 9 akuarium air tawar, 19 akuarium air laut, dan 4 kolam terbuka.</li> <li>Interaksi langsung dengan hewan laut yang jinak dan lucu di Touch Pool.</li> <li>Saksikan 2.000 ekor piranha menghabiskan makanannya di Beware Piranha.</li> <li>Cocok untuk: <strong>Keluarga Asyik.</strong></li> </ul>', 'Jl. Lodan Timur No.7, Ancol, Kec. Pademangan, Jkt Utara, Daerah Khusus Ibukota Jakarta 14430', '2', 'DKI jakarta', '155', 'Jakarta Utara', 'Indonesia', '-6.126478, 106.842963', 185000, 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53');

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
(1, 1, 'Senin', '09:00 - 16:30', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(2, 1, 'Selasa', '09:00 - 16:30', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(3, 1, 'Rabu', '09:00 - 16:30', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(4, 1, 'Kamis', '09:00 - 16:30', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(5, 1, 'Jumat', '09:00 - 16:30', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(6, 1, 'Sabtu', '09:00 - 16:30', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(7, 1, 'Minggu', '09:00 - 16:30', 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53');

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
(1, 1, 1, '(High Season) Reguler Sea World Bonus Jakarta Bird Land (belum termasuk tiket Ancol)', '<ul> <li>Anda akan mendapatkan 1 e-tiket Reguler Sea World dan 1 e-tiket Reguler Jakarta Bird Land yang dapat digunakan pada periode High Season berlaku untuk kunjungan pada tanggal yang dipilih antara tanggal 23 Juni – 7 Juli 2024</li> <li>Belum termasuk Tiket Masuk Gerbang Utama Ancol dan Tiket Masuk Kendaraan</li> </ul>', 'Hand Sanitizer, Toko Suvenir, Parkir, Restoran/Food Court, Mushola', '<ul> <li>Untuk mengakses e-tiket kamu, buka menu "Your Orders" pada aplikasi tiket.com.</li> <li>E-tiket tidak perlu dicetak. Cukup tunjukkan e-ticket dari smartphone kamu saat proses penukaran tiket atau di gerbang masuk (harus menunjukkan e-tiket langsung dari aplikasi tiket.com, bukan tangkapan layar). Pastikan untuk menyesuaikan kecerahan layar kamu.</li> <li>Harap tunjukkan kartu identitas yang masih berlaku saat proses penukaran tiket.</li> </ul>', '<p><strong>Umum</strong></p><ul> <li>Harga tiket sudah termasuk pajak.</li> <li>Tiket yang sudah dibeli tidak dapat dikembalikan.</li> <li>Tiket yang sudah dibeli tidak dapat diganti jadwalnya</li> <li>Pembeli wajib mengisi data diri pribadi saat memesan.</li> <li>Penjualan tiket sewaktu-waktu dapat dihentikan atau dimulai oleh tiket.com sesuai dengan kebijakan dari promotor atau tiket.com.</li> </ul><p><strong>E-voucher</strong></p><ul> <li>E-voucher tidak dapat diuangkan.</li> </ul><p><strong>Syarat dan Ketentuan Ancol</strong></p><ul> <li>Pengunjung dengan tinggi badan 80 cm ke atas akan dikenakan biaya tiket penuh. Pengunjung dengan tinggi badan di bawah 80 cm bisa masuk secara gratis.</li> <li>Tiket reguler = tiket 1 kali kunjungan, sedangkan Tiket Annual Pass = tiket member 1 tahun.</li> <li>Masing-masing kategori tiket hanya bisa digunakan pada kategori hari yang sudah ditentukan (misalnya, tiket <em>weekday </em>hanya berlaku di hari Senin - Jumat, tidak termasuk hari libur nasional). Mohon cek Detail masing-masing paket untuk informasi selengkapnya.</li> </ul>', 185000, 100, 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53'),
(2, 1, 1, '(High Season) Bundling Reguler Jakarta Bird Land + Sea World + Samudra (belum termasuk tiket Ancol)', '<ul> <li>Anda akan mendapatkan 1 e-tiket Reguler Sea World dan 1 e-tiket Reguler Jakarta Bird Land yang dapat digunakan pada periode High Season berlaku untuk kunjungan pada tanggal yang dipilih antara tanggal 23 Juni – 7 Juli 2024</li> <li>Belum termasuk Tiket Masuk Gerbang Utama Ancol dan Tiket Masuk Kendaraan</li> </ul>', 'Hand Sanitizer, Toko Suvenir, Parkir, Restoran/Food Court, Mushola', '<ul> <li>Untuk mengakses e-tiket kamu, buka menu "Your Orders" pada aplikasi tiket.com.</li> <li>E-tiket tidak perlu dicetak. Cukup tunjukkan e-ticket dari smartphone kamu saat proses penukaran tiket atau di gerbang masuk (harus menunjukkan e-tiket langsung dari aplikasi tiket.com, bukan tangkapan layar). Pastikan untuk menyesuaikan kecerahan layar kamu.</li> <li>Harap tunjukkan kartu identitas yang masih berlaku saat proses penukaran tiket.</li> </ul>', '<p><strong>Umum</strong></p><ul> <li>Harga tiket sudah termasuk pajak.</li> <li>Tiket yang sudah dibeli tidak dapat dikembalikan.</li> <li>Tiket yang sudah dibeli tidak dapat diganti jadwalnya</li> <li>Pembeli wajib mengisi data diri pribadi saat memesan.</li> <li>Penjualan tiket sewaktu-waktu dapat dihentikan atau dimulai oleh tiket.com sesuai dengan kebijakan dari promotor atau tiket.com.</li> </ul><p><strong>E-voucher</strong></p><ul> <li>E-voucher tidak dapat diuangkan.</li> </ul><p><strong>Syarat dan Ketentuan Ancol</strong></p><ul> <li>Pengunjung dengan tinggi badan 80 cm ke atas akan dikenakan biaya tiket penuh. Pengunjung dengan tinggi badan di bawah 80 cm bisa masuk secara gratis.</li> <li>Tiket reguler = tiket 1 kali kunjungan, sedangkan Tiket Annual Pass = tiket member 1 tahun.</li> <li>Masing-masing kategori tiket hanya bisa digunakan pada kategori hari yang sudah ditentukan (misalnya, tiket <em>weekday </em>hanya berlaku di hari Senin - Jumat, tidak termasuk hari libur nasional). Mohon cek Detail masing-masing paket untuk informasi selengkapnya.</li> </ul>', 250000, 100, 1, '2024-06-11 08:22:53', '2024-06-11 08:22:53');

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
(2, 1, '2024-06-28', NULL, NULL),
(2, 1, '2024-07-05', NULL, NULL),
(2, 1, '2024-07-01', NULL, NULL);

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
(1, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2002053221267/Sea-World-Ancol-Tickets-07f2ff6b-6f07-46aa-a52d-1b43173ae69a.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'seaworld1', NULL, NULL),
(2, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2002053221267/Sea-World-Ancol-Tickets-f2eb0440-ac29-49a1-8190-1829d769c30c.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'seaworld2', NULL, NULL),
(2, 1, 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2002053221267/Sea-World-Ancol-Tickets-820fe4a4-d03a-4060-9540-c497c1874522.jpeg?_src=imagekit&tr=c-at_max,h-750,q-100,w-1000', 'seaworld3', NULL, NULL);

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
