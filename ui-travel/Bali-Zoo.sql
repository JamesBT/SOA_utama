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
(1, 'Bali Zoo', 'Bali-Zoo', '<div id="section-description-pdp" class="RichText_description_preview__X9xZ4 SectionDescription_description_preview__bQyOL Text_text__DSnue"><p>Bali Zoo adalah taman satwa pertama di Bali yang menawarkan berbagai macam aktivitas dengan satwa. Kamu juga bisa berinteraksi lebih dekat dan belajar soal satwa-satwa yang ada. Selain itu, kamu juga bisa melihat secara langsung lebih dari 500 satwa di dalam taman dengan luas lebih dari 12 hektar.</p> <p>Pas lagi di Bali, datang ke kebun binatang pertama di Bali, Bali Zoo cocok banget jadi pilihan. Kamu bisa lihat satwa dari dekat, dan tentunya anak-anak akan antusias buat memberi makan satwa di program <em>Fed the Animals. </em>Mereka juga bisa mendapatkan pengalaman tak terlupakan lewat program <em>Animal Encounters, </em>di mana mereka bisa belajar lebih jauh soal satwa-satwa yang ada. Jangan lupa buat nonton <em>Animal Presentation, </em>di mana kamu dapat melihat burung-burung terbang dan melakukan aksi!</p> <p>Tunggu apalagi? Segera pesan tiketnya lewat tiket.com sekarang!</p> <br> <p>Jalan-jalan ke tempat wisata di Bali tidak harus selalu ke pantai. Kamu juga bisa berkunjung ke Bali Zoo yang spektakuler untuk melihat kumpulan satwa Indonesia yang menakjubkan! Berlokasi di desa Singapadu, Bali Zoo yang rindang dipenuhi dengan pepohonan tropis, memiliki lebih dari 500 satwa termasuk satwa langka seperti Gajah Sumatera, Orangutan, Harimau Benggala, Binturong, dan Singa Afrika. Para pengunjung dapat berinteraksi secara langsung dengan satwa-satwa jinak yang terlatih dan jangan lewatkan kesempatan untuk berfoto bersama satwa langka ini! Ada juga wahana di Bali Zoo yang tak kalah menyenangkan, yaitu Night Safari. Jangan lewatkan aktivitas unik yang satu ini, ya!</p> <br>  <br> <p>Selain itu, fasilitas di Bali Zoo juga memadai, termasuk restoran dengan santapan yang nikmat serta pemandangan tak terkalahkan.</p> <p>Sudah siap beli tiket Bali Zoo dari <em>online travel agent </em>terpercaya yang jual tiket Bali Zoo dengan harga terjangkau? Langsung saja unduh aplikasi tiket.com secara gratis! Cek harga tiket Bali Zoo dan pesan sekarang untuk momen wisata tak terlupakan! Tapi, sebelum itu, selalu mampir ke halaman Promo kami dulu, ya! Kamu bisa menghemat lebih lagi jika sedang ada promo tiket Bali Zoo yang berlangsung!</p> <br>   <br> <br></div>, <section role="contentinfo" class="SectionDescription_section_container__3PedA"><h3 class="SectionDescription_description_heading__nBhGp Text_text__DSnue Text_size_h3__qFeEO">Deskripsi</h3><div id="section-description-pdp" class="RichText_description_preview__X9xZ4 SectionDescription_description_preview__bQyOL Text_text__DSnue"><p>Bali Zoo adalah taman satwa pertama di Bali yang menawarkan berbagai macam aktivitas dengan satwa. Kamu juga bisa berinteraksi lebih dekat dan belajar soal satwa-satwa yang ada. Selain itu, kamu juga bisa melihat secara langsung lebih dari 500 satwa di dalam taman dengan luas lebih dari 12 hektar.</p> <p>Pas lagi di Bali, datang ke kebun binatang pertama di Bali, Bali Zoo cocok banget jadi pilihan. Kamu bisa lihat satwa dari dekat, dan tentunya anak-anak akan antusias buat memberi makan satwa di program <em>Fed the Animals. </em>Mereka juga bisa mendapatkan pengalaman tak terlupakan lewat program <em>Animal Encounters, </em>di mana mereka bisa belajar lebih jauh soal satwa-satwa yang ada. Jangan lupa buat nonton <em>Animal Presentation, </em>di mana kamu dapat melihat burung-burung terbang dan melakukan aksi!</p> <p>Tunggu apalagi? Segera pesan tiketnya lewat tiket.com sekarang!</p> <br> <p>Jalan-jalan ke tempat wisata di Bali</a> tidak harus selalu ke pantai. Kamu juga bisa berkunjung ke Bali Zoo yang spektakuler untuk melihat kumpulan satwa Indonesia yang menakjubkan! Berlokasi di desa Singapadu, Bali Zoo yang rindang dipenuhi dengan pepohonan tropis, memiliki lebih dari 500 satwa termasuk satwa langka seperti Gajah Sumatera, Orangutan, Harimau Benggala, Binturong, dan Singa Afrika. Para pengunjung dapat berinteraksi secara langsung dengan satwa-satwa jinak yang terlatih dan jangan lewatkan kesempatan untuk berfoto bersama satwa langka ini! Ada juga wahana di Bali Zoo yang tak kalah menyenangkan, yaitu Night Safari. Jangan lewatkan aktivitas unik yang satu ini, ya!</p> <br>  <br> <p>Selain itu, fasilitas di Bali Zoo juga memadai, termasuk restoran dengan santapan yang nikmat serta pemandangan tak terkalahkan.</p> <p>Sudah siap beli tiket Bali Zoo dari <em>online travel agent </em>terpercaya yang jual tiket Bali Zoo dengan harga terjangkau? Langsung saja unduh aplikasi tiket.com secara gratis! Cek harga tiket Bali Zoo dan pesan sekarang untuk momen wisata tak terlupakan! Tapi, sebelum itu, selalu mampir ke halaman Promo kami dulu, ya! Kamu bisa menghemat lebih lagi jika sedang ada promo tiket Bali Zoo yang berlangsung!</p> <br>   <br> <br></div></section>', 'Jl. Lodan Timur No.7, Ancol, Kec. Pademangan, Jkt Utara, Daerah Khusus Ibukota Jakarta 14430','<div id="section-description-pdp" class="RichText_description_preview__X9xZ4 SectionDescription_description_preview__bQyOL Text_text__DSnue"><p>Bali Zoo adalah taman satwa pertama di Bali yang menawarkan berbagai macam aktivitas dengan satwa. Kamu juga bisa berinteraksi lebih dekat dan belajar soal satwa-satwa yang ada. Selain itu, kamu juga bisa melihat secara langsung lebih dari 500 satwa di dalam taman dengan luas lebih dari 12 hektar.</p> <p>Pas lagi di Bali, datang ke kebun binatang pertama di Bali, Bali Zoo cocok banget jadi pilihan. Kamu bisa lihat satwa dari dekat, dan tentunya anak-anak akan antusias buat memberi makan satwa di program <em>Fed the Animals. </em>Mereka juga bisa mendapatkan pengalaman tak terlupakan lewat program <em>Animal Encounters, </em>di mana mereka bisa belajar lebih jauh soal satwa-satwa yang ada. Jangan lupa buat nonton <em>Animal Presentation, </em>di mana kamu dapat melihat burung-burung terbang dan melakukan aksi!</p> <p>Tunggu apalagi? Segera pesan tiketnya lewat tiket.com sekarang!</p> <br> <p>Jalan-jalan ke tempat wisata di Bali tidak harus selalu ke pantai. Kamu juga bisa berkunjung ke Bali Zoo yang spektakuler untuk melihat kumpulan satwa Indonesia yang menakjubkan! Berlokasi di desa Singapadu, Bali Zoo yang rindang dipenuhi dengan pepohonan tropis, memiliki lebih dari 500 satwa termasuk satwa langka seperti Gajah Sumatera, Orangutan, Harimau Benggala, Binturong, dan Singa Afrika. Para pengunjung dapat berinteraksi secara langsung dengan satwa-satwa jinak yang terlatih dan jangan lewatkan kesempatan untuk berfoto bersama satwa langka ini! Ada juga wahana di Bali Zoo yang tak kalah menyenangkan, yaitu Night Safari. Jangan lewatkan aktivitas unik yang satu ini, ya!</p> <br>  <br> <p>Selain itu, fasilitas di Bali Zoo juga memadai, termasuk restoran dengan santapan yang nikmat serta pemandangan tak terkalahkan.</p> <p>Sudah siap beli tiket Bali Zoo dari <em>online travel agent </em>terpercaya yang jual tiket Bali Zoo dengan harga terjangkau? Langsung saja unduh aplikasi tiket.com secara gratis! Cek harga tiket Bali Zoo dan pesan sekarang untuk momen wisata tak terlupakan! Tapi, sebelum itu, selalu mampir ke halaman Promo kami dulu, ya! Kamu bisa menghemat lebih lagi jika sedang ada promo tiket Bali Zoo yang berlangsung!</p> <br>   <br> <br></div>', '<span class="SectionLocation_full_address__11EQ8 Text_text__DSnue Text_size_b2__y3Q2E">Singapadu, Sukawati, Gianyar, Bali 80582, Sukawati, Gianyar, Bali, Indonesia</span>', '1', 'Bali', '128', 'Gianyar', 'Indonesia', '-8.591983, 115.265687', 90000, 1, '2024-06-25 13:07:12', '2024-06-25 13:07:12');





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
(1, 1, 1, `Tiket Masuk - Wisatawan Domestik & KITAS`, `<ul> <li>Berlaku untuk pengunjung yang berstatus warga negara Indonesia (pemegang KTP/KITAS).</li> </ul>`, `<ul class="SectionWhatsIncluded_item_wrapper__VFBPs"><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E">Tiket masuk</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Jungle Splash Waterplay</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Animal Encounters &amp; Show</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Asuransi</li></ul>`, `<p>Membawa e-voucher tiket dan kartu identitas saat tiba di lokasi.</p>`, `<div data-testid="package-tnc" class="RichText_description_preview__X9xZ4 Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"><p><strong>Umum</strong></p> <ul> <li>Harga sudah termasuk pajak.</li> <li>Tiket yang sudah dibeli tidak dapat dikembalikan / <em>non-refundable</em>.</li> <li>Tiket yang sudah dibeli tidak dapat diganti jadwalnya</li> <li>Pembeli wajib mengisi data diri pribadi saat memesan.</li> <li>Penjualan tiket sewaktu-waktu dapat dihentikan atau dimulai oleh tiket.com sesuai dengan kebijakan dari promotor atau tiket.com.</li> </ul> <p><strong>E-voucher</strong></p> <ul> <li>E-voucher tidak dapat diuangkan.</li> </ul> <p><strong>Syarat dan Ketentuan Bali Zoo</strong></p> <ul> <li>Pengunjung berusia di bawah 2 tahun bisa masuk secara gratis.</li> <li>Pengunjung yang masuk kategori anak-anak adalah yang berusia 2-12 tahun.</li> <li>Acara dan jadwalnya bisa berubah tanpa pemberitahuan sebelumnya karena kondisi cuaca.</li> </ul></div>`, 90000, 100, 1, `2024-06-25 16:54:21`, `2024-06-25 16:54:21`),
(2, 1, 2, '[Domestik] Zoo Admission + Elephant Expedition', `<div data-testid="package-description" class="RichText_description_preview__X9xZ4 Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"><p>Berlaku untuk Domestik + KITAS (pemegang paspor)</p></div>`, `<ul class="SectionWhatsIncluded_item_wrapper__VFBPs"><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E">Elephant ride (20 menit)</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Tiket masuk</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Jungle Splash waterplay</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Animal encounters &amp; show</li><li class="SectionWhatsIncluded_item__zBu_z Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"> Asuransi</li></ul>`, `<p>Saat tiba di lokasi, wajib membawa dan menunjukkan e-tiket (dalam bentuk cetak atau email konfirmasi) dan juga kartu identitas yang berlaku (paspor).</p>`, `<div data-testid="package-tnc" class="RichText_description_preview__X9xZ4 Text_text__DSnue Text_variant_lowEmphasis__VihAq Text_size_b2__y3Q2E"><p><strong>Umum</strong></p> <ul> <li><strong>Wajib reservasi via email email : info@bali-zoo.com</strong></li> <li>Harga sudah termasuk pajak.</li> <li>Tiket yang sudah dibeli tidak dapat dikembalikan / <em>non-refundable.</em></li> <li>Tiket yang sudah dibeli tidak dapat diganti jadwalnya</li> <li>Pembeli wajib mengisi data diri pribadi saat memesan.</li> <li>Penjualan tiket sewaktu-waktu dapat dihentikan atau dimulai oleh tiket.com sesuai dengan kebijakan dari promotor atau tiket.com.</li> </ul> <p><strong>E-voucher</strong></p> <ul> <li>E-voucher tidak dapat diuangkan.</li> </ul> <p><strong>Validitias</strong></p> <ul> <li>Berlaku untuk pengunjung yang berstatus warga negara asing (WNA).</li> </ul> <p><strong>Syarat dan Ketentuan Bali Zoo</strong></p> <ul> <li>Pengunjung berusia di bawah 2 tahun bisa masuk secara gratis.</li> <li>Pengunjung yang masuk kategori anak-anak adalah yang berusia 2-12 tahun.</li> <li>Acara dan jadwalnya bisa berubah tanpa pemberitahuan sebelumnya karena kondisi cuaca.</li> </ul></div>`, 495000, 100, 1, `2024-06-25 16:58:38`, `2024-06-25 16:58:38`);

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
(1, 1, 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit1440960gsm/events/2022/01/24/325f5be9-5ee3-481b-b9bf-c4b91c64c4cd-1643018195456-b4373f0f5b8d5479edb84bb7887faad9.jpg', 'bali-zoo1', NULL, NULL),
(2, 1, 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit1440960gsm/events/2020/12/22/00036252-bce1-4bee-9d28-96bb5f51045f-1608649123618-b476b6b49600fc7a2a0c7ea46a18e38b.jpg', 'bali-zoo2', NULL, NULL),
(3, 1, 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit1440960gsm/events/2020/11/22/9ad705cb-8205-41cb-a2f6-3bcf3b7132e8-1606018664584-784a8c78aeb605431e3968512489b676.jpg', 'bali-zoo3', NULL, NULL);

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
