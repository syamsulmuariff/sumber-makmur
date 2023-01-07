-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table sumber_makmur.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kategori_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.categories: ~7 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `kategori_obat`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
	(3, 'obat pertanian', 'mengatasi penyakit pada tanaman', '16728866364.webp', '2022-12-31 04:16:38', '2023-01-05 02:43:56');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.members
CREATE TABLE IF NOT EXISTS `members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_member` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.members: ~1 rows (approximately)
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`id`, `nama_member`, `provinsi`, `kabupaten`, `kecamatan`, `detail_alamat`, `no_hp`, `email`, `password`, `created_at`, `updated_at`) VALUES
	(3, 'arif', 'jateng', 'pati', 'tlogowungu', 'sangklur', '085803886761', 'syamsulmuarif62@gmail.com', '$2y$10$S.SkhuS2nZamc44hV53/G.eIfCBT5w65bnLEeej1Y2ZMID00IlfFa', '2022-12-28 03:50:02', '2022-12-28 03:50:02');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.migrations: ~11 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(17, '2014_10_12_000000_create_users_table', 1),
	(18, '2014_10_12_100000_create_password_resets_table', 1),
	(19, '2019_08_19_000000_create_failed_jobs_table', 1),
	(20, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(21, '2022_12_04_070721_create_categories_table', 1),
	(22, '2022_12_14_112242_create_suppliers_table', 1),
	(23, '2022_12_16_070029_create_products_table', 1),
	(24, '2022_12_17_054813_create_members_table', 1),
	(25, '2022_12_18_044252_create_orders_table', 1),
	(26, '2022_12_18_044309_create_order_details_table', 1),
	(27, '2022_12_23_010946_create_subcategories_table', 1),
	(28, '2022_12_23_054500_create_testimonis_table', 2),
	(29, '2022_12_23_064143_create_reviews_table', 3),
	(30, '2022_12_23_120205_create_orders_table', 4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.orders: ~5 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `id_member`, `invoice`, `grand_total`, `status`, `created_at`, `updated_at`) VALUES
	(1, 3, 1, 15000, 'selesai', '2022-12-24 13:20:36', '2023-01-04 18:00:51'),
	(2, 3, 2, 20000, 'diterima', '2022-02-04 23:52:17', '2023-01-04 18:03:05'),
	(3, 3, 3, 50000, 'Dikirim', '2022-03-06 23:52:55', '2023-01-04 18:01:20'),
	(4, 3, 4, 60000, 'Dikemas', '2022-04-03 23:53:29', '2023-01-04 18:01:11'),
	(5, 3, 5, 80000, 'Dikonfirmasi', '2023-03-04 23:53:45', '2023-01-04 18:01:00'),
	(6, 3, 6, 90000, 'baru', '2022-11-04 23:54:15', '2023-01-04 23:54:16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.order_details: ~2 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`, `id_order`, `id_produk`, `jumlah`, `total`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 2, 60000, '2022-12-22 12:59:23', NULL),
	(2, 2, 2, 2, 30000, '2022-12-24 12:59:24', NULL),
	(3, 1, 1, 3, 90000, '2022-12-24 14:23:19', NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_subkategori` int(11) NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `id_kategori`, `id_supplier`, `id_subkategori`, `nama_barang`, `gambar`, `deskripsi`, `harga`, `created_at`, `updated_at`) VALUES
	(4, 3, 1, 5, 'Dharmabas 500EC 400ml', '16728890403.jpg', 'Insektisida Pembasmi Hama Wereng Tanaman', 54000, '2023-01-05 03:24:00', '2023-01-05 03:24:00'),
	(6, 3, 1, 5, 'Spontan 400SL 500ml', '16728895015.jpeg', 'Obat Pencegah dan Pembasmi Hama Tanaman', 60000, '2023-01-05 03:30:33', '2023-01-05 03:31:41'),
	(7, 3, 1, 5, 'REGENT 50 SC', '16728896608.jpg', 'nsektisida dan zat pengatur tumbuh sistemik berbentuk suspensi berwarna putih berdaya racun kontak dan lambung Untuk mengedalikan hama', 25000, '2023-01-05 03:34:20', '2023-01-05 03:34:20'),
	(8, 3, 3, 6, 'Gramoxon 250 ml', '16728904603.jpg', 'pembasmi rumput liar', 30000, '2023-01-05 03:41:21', '2023-01-05 03:47:40'),
	(9, 3, 3, 6, 'ALLY ALI PLUS 77 WP 40GRAM', '16728905234.jpg', 'HERBISIDA RUMPUT PADA TANAMAN PADI', 15000, '2023-01-05 03:44:17', '2023-01-05 03:48:43'),
	(10, 3, 3, 6, 'Roundup 486 SL - ( 200ml )', '16728906065.jpg', 'OBAT PEMBASMI RUMPUT LIAR & GULMA', 35000, '2023-01-05 03:46:24', '2023-01-05 03:50:06'),
	(11, 3, 1, 7, 'topsin 500 SC 500ml', '16728907591.jpg', 'Pembasmi Jamur Tanaman', 80000, '2023-01-05 03:52:39', '2023-01-05 03:52:39'),
	(12, 3, 1, 7, 'Fungisida Antracol 70 WP + Zinc 250 Gram', '16728909421.jpg', 'Fungi Hama Jamur Busuk', 45000, '2023-01-05 03:55:42', '2023-01-05 03:55:42'),
	(13, 3, 1, 7, 'AmistarTop 325sc 50 ml', '16728910621.jpg', 'Obat Semprot Tanaman/bercak daun/busuk batang', 70000, '2023-01-05 03:57:42', '2023-01-05 03:57:42');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.reviews: ~2 rows (approximately)
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `id_member`, `id_produk`, `review`, `rating`, `created_at`, `updated_at`) VALUES
	(2, 2, 1, 'sangat bagus sekali', 3, '2022-12-23 07:46:54', '2022-12-23 07:46:54');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.subcategories
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) NOT NULL,
  `nama_subkategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.subcategories: ~3 rows (approximately)
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` (`id`, `id_kategori`, `nama_subkategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
	(5, 3, 'INSEKTISIDA', 'bahan yang mengandung senyawa kimia yang bisa mematikan semua jenis serangga.', '16728869494.jpg', '2023-01-05 02:49:09', '2023-01-05 02:49:09'),
	(6, 3, 'HERBISIDA', 'bahan kimia yang digunakan untuk mengendalikan tumbuhan pengganggu (gulma), seperti rumput, alang-alang dan semak liar', '16728887849.jpg', '2023-01-05 03:19:44', '2023-01-05 03:19:44'),
	(7, 3, 'FUNGISIDA', 'jenis pestisida untuk memberantas jamur atau fungi', '16728888756.png', '2023-01-05 03:21:15', '2023-01-05 03:21:15');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.suppliers: ~2 rows (approximately)
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` (`id`, `nama_supplier`, `alamat`, `created_at`, `updated_at`) VALUES
	(1, 'sulis tyo wibowo', 'desa lahar dukuh dopang kecamatan tlogowungu kabupaten pati', '2023-01-03 13:19:03', '2023-01-03 13:19:03'),
	(3, 'sukron', 'desa sumbermulyo dukuh sangklur kecamatan tlogowungu kabupaten pati', '2023-01-03 13:19:51', '2023-01-03 13:19:51');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.testimonis
CREATE TABLE IF NOT EXISTS `testimonis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_testimoni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.testimonis: ~2 rows (approximately)
/*!40000 ALTER TABLE `testimonis` DISABLE KEYS */;
INSERT INTO `testimonis` (`id`, `nama_testimoni`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
	(1, 'arif revano', 'sangat ampuh sekali', '16717754407.png', '2022-12-23 06:00:17', '2022-12-23 06:04:00'),
	(2, 'ana', 'bagus', '16727628151.jpg', '2023-01-03 16:20:15', '2023-01-03 16:20:31');
/*!40000 ALTER TABLE `testimonis` ENABLE KEYS */;

-- Dumping structure for table sumber_makmur.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sumber_makmur.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'admin@admin.com', '2022-12-23 05:37:40', '$2y$10$Ka7e1ri06Puka90gzMupH.qFfGN33osYCvQtI3fIKkwfFPbFB6qMO', NULL, '2022-12-23 05:37:40', '2022-12-23 05:37:40'),
	(3, 'admin', 'arif@arif.com', '2022-12-30 15:29:56', '123', NULL, '2022-12-30 15:29:57', '2022-12-30 15:29:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
