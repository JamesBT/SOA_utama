CREATE TABLE IF NOT EXISTS `user` (
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
