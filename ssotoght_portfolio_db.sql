-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 05, 2026 at 12:00 PM
-- Server version: 10.11.14-MariaDB-cll-lve
-- PHP Version: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssotoght_portfolio_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `automation_strategies`
--

CREATE TABLE `automation_strategies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `term_type` enum('short','middle','long') NOT NULL DEFAULT 'short',
  `category` enum('manufacturing','digitalization') NOT NULL DEFAULT 'manufacturing',
  `title` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `automation_strategies`
--

INSERT INTO `automation_strategies` (`id`, `term_type`, `category`, `title`, `items`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'short', 'manufacturing', NULL, '[\"Menetapkan baseline biaya produksi per kategori (material utama, Unit Man Hour dominan, overhead) sebagai acuan kontrol biaya.\",\"Menyusun standar evaluasi similar part untuk mempercepat estimasi dan menjaga konsistensi perhitungan.\"]', 0, 1, '2026-01-20 18:47:25', '2026-01-21 02:09:44'),
(2, 'middle', 'digitalization', NULL, '[\"Membuat sistem\\/aplikasi semi-otomatis untuk perhitungan COGM, monitoring similar part, dan kontrol revisi pricebook (mengurangi pekerjaan manual dan error).\",\"Membangun dashboard per kategori berisi tren volume, biaya per unit, margin, serta indikator Product Life Cycle secara periodik.\",\"Menetapkan kerangka Product Life Cycle per kategori: parameter pertumbuhan, volume, biaya, margin, dan kurva pembelajaran beserta metode pengukurannya.\",\"Menerapkan quality gate (input\\u2013validasi\\u2013finalisasi\\u2013resume) dan audit berkala sebagai standar kontrol mutu costing.\"]', 0, 1, '2026-01-20 18:50:54', '2026-01-21 02:10:42'),
(3, 'short', 'digitalization', NULL, '[\"Menstandarkan proses input COGM (format Part List, Unit Man Hour, similar part, referensi pricebook) agar konsisten lintas proyek.\",\"Membuat checklist validasi akurasi COGM (kontrol formula, kontrol revisi dokumen A00\\/A04\\/A05, dan keterlacakan data).\",\"Membentuk struktur master data per kategori bisnis (kode part, klasifikasi, mapping dokumen, dan struktur cost driver).\",\"Menyusun format Resume COGM yang seragam untuk koordinasi dan pelaporan yang cepat\"]', 0, 1, '2026-01-21 02:01:03', '2026-01-21 02:09:36'),
(4, 'middle', 'manufacturing', NULL, '[\"Membangun model costing per kategori berbasis proses (process-based costing) untuk melihat kontribusi biaya per proses\\/aktivitas.\",\"Mengembangkan analisis kurva pembelajaran: tren penurunan Unit Man Hour, scrap\\/rework, serta stabilitas proses untuk memproyeksikan penurunan biaya.\",\"Membuat model costing yang disesuaikan untuk kategori baru (Power & Energy Solution dan AMR System) karena karakteristik produk dan prosesnya masih berkembang.\"]', 0, 1, '2026-01-21 02:11:25', '2026-01-21 02:11:25'),
(5, 'long', 'manufacturing', NULL, '[\"Menjadikan analisis biaya sebagai alat pengambilan keputusan strategis: prioritas efisiensi, standardisasi desain, dan strategi penurunan biaya per kategori.\",\"Mengintegrasikan rekomendasi costing dengan program peningkatan produktivitas (penurunan Unit Man Hour, pengurangan waste, dan stabilisasi proses)\",\"Membuat peta kematangan Product Life Cycle per kategori untuk menentukan strategi produksi jangka panjang (scale-up, stabilisasi, atau transformasi produk\\/proses).\"]', 0, 1, '2026-01-21 02:12:38', '2026-01-21 02:12:38'),
(6, 'short', 'digitalization', NULL, '[\"Mengembangkan sistem menjadi platform costing-analytics terintegrasi lintas fungsi (Project Management\\u2013Procurement\\u2013Finance) sebagai single source of truth.\",\"Mengimplementasikan analitik prediktif untuk proyeksi biaya dan margin berdasarkan volume, tren harga, kurva pembelajaran, dan perubahan teknologi.\",\"Membangun governance data jangka panjang (master data, version control, audit trail) agar perhitungan dan keputusan selalu dapat ditelusuri.\",\"Menyediakan dashboard eksekutif untuk memantau pertumbuhan jangka panjang setiap kategori bisnis berbasis Product Life Cycle.\"]', 0, 1, '2026-01-21 02:13:18', '2026-01-21 02:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `business_process_flows`
--

CREATE TABLE `business_process_flows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL,
  `action` text NOT NULL,
  `description` text DEFAULT NULL,
  `badge_text` varchar(255) DEFAULT NULL,
  `badge_color` varchar(255) DEFAULT NULL,
  `step_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_process_flows`
--

INSERT INTO `business_process_flows` (`id`, `role`, `action`, `description`, `badge_text`, `badge_color`, `step_order`, `created_at`, `updated_at`) VALUES
(1, 'Drawing', 'tes', 'tes', 'tes', NULL, 0, '2026-01-20 23:38:36', '2026-01-20 23:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '#00b4d8',
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `color`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'UI/UX Design', 'ui-ux-design', '#00b4d8', NULL, '2025-12-25 08:00:26', '2025-12-25 08:00:26'),
(2, 'Web Development', 'web-development', '#48bb78', NULL, '2025-12-25 08:00:26', '2025-12-25 08:00:26'),
(3, 'Mobile Apps', 'mobile-apps', '#ed8936', NULL, '2025-12-25 08:00:26', '2025-12-25 08:00:26'),
(4, 'Branding', 'branding', '#9f7aea', NULL, '2025-12-25 08:00:26', '2025-12-25 08:00:26'),
(5, 'Dashboard', 'dashboard', '#f56565', NULL, '2025-12-25 08:00:26', '2025-12-25 08:00:26');

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE `certifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `issuer` varchar(255) NOT NULL,
  `issuer_en` varchar(255) DEFAULT NULL,
  `issued_at` date NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `credential_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `committee_activities`
--

CREATE TABLE `committee_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `role_en` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `committee_activities`
--

INSERT INTO `committee_activities` (`id`, `title`, `title_en`, `role`, `role_en`, `description`, `description_en`, `organization`, `event_date`, `end_date`, `location`, `image`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Family Gathering DEM 2024', NULL, 'Pic Bus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'committee/ajU6QsdGPgVEnUGVHDotaVrPpcb07ApJPD1oxY6D.jpg', 0, 1, '2026-01-21 00:34:58', '2026-01-21 01:08:35'),
(2, 'Culture Day 2024', NULL, 'Peserta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'committee/vFZeoaeGTwakIJjPjDpv7FlTJZAaiZwl2vOATMkM.jpg', 0, 1, '2026-01-21 00:42:56', '2026-01-21 00:42:56'),
(3, 'Family Gathering DEM 2025', NULL, 'Konsumsi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'committee/QhtvnmtqpJp7CgAKMvVD2XGTaUWV9aAtyyWBkM94.jpg', 0, 1, '2026-01-21 00:48:19', '2026-01-21 01:02:02'),
(4, 'HUT DEM Ke 23', NULL, 'Konsumsi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'committee/4yqCe3eta4Kjr5RlKzXGP11hU1ijRWQPzkw33JEK.jpg', 0, 1, '2026-01-21 00:49:34', '2026-01-21 00:58:17'),
(5, 'Family Gathering Engineering', NULL, 'Bendahara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'committee/h6n6P3bLd5uLo7yenzaPna2kRAjV3JIuAP0eeR1A.jpg', 0, 1, '2026-01-21 01:01:08', '2026-01-21 01:03:32'),
(6, 'Culture Day 2025', NULL, 'Peserta', NULL, NULL, NULL, 'Juara 1 Cerdas Cermat', NULL, NULL, NULL, 'committee/rAr996LfoEsv1SsXjRIwZndIqzEmKPmbtUUPToLo.jpg', 0, 1, '2026-01-21 01:04:51', '2026-01-21 01:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `company_profiles`
--

CREATE TABLE `company_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'PT DHARMA ELECTRINDO MFG.',
  `logo` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT 'Exist To Contribute',
  `description` longtext DEFAULT NULL,
  `plant_1_name` varchar(255) DEFAULT NULL,
  `plant_1_image` varchar(255) DEFAULT NULL,
  `plant_2_name` varchar(255) DEFAULT NULL,
  `plant_2_image` varchar(255) DEFAULT NULL,
  `employees_cikarang` int(11) NOT NULL DEFAULT 0,
  `employees_cirebon` int(11) NOT NULL DEFAULT 0,
  `business_model_title` varchar(255) NOT NULL DEFAULT 'BISNIS MODEL DEM',
  `business_models` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`business_models`)),
  `director_name` varchar(255) DEFAULT NULL,
  `director_title` varchar(255) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `director_image` varchar(255) DEFAULT NULL,
  `triputra_dna_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_profiles`
--

INSERT INTO `company_profiles` (`id`, `name`, `logo`, `slogan`, `description`, `plant_1_name`, `plant_1_image`, `plant_2_name`, `plant_2_image`, `employees_cikarang`, `employees_cirebon`, `business_model_title`, `business_models`, `director_name`, `director_title`, `footer_text`, `director_image`, `triputra_dna_image`, `created_at`, `updated_at`) VALUES
(1, 'PT Dharma Electrindo Mfg.', 'company/misc/kSgAlbU3QLE1sRsYcSMTiEwzeZ82Od7okURfILda.png', 'Exist To Contribute', 'Sejak berdiri pada 14 Agustus 2002, PT Dharma Electrindo Manufacturing merupakan salah satu sub-co dari Dharma Group dan sub holding dari Triputra Group yang bergerak di bidang Manufacturing Automotive (produksi Wiring Harness,Automotive Electronic Parts, Power & Energy Solution, AMR System). Perusahaan ini tidak hanya fokus pada produksi, tetapi juga senantiasa berinovasi dan mengembangkan produk-produk yang berkualitas tinggi untuk memenuhi kebutuhan pasar otomotif yang saat ini terus berkembang.', 'PT. Dharma Electrindo Mfg. Plant 1 Cikarang', 'company/plants/oGIJsmuML0jc92uWmhKew7nuKnAkBbDR6RlBxxAo.jpg', 'PT. Dharma Electrindo Mfg. Plant 2 Cikarang', 'company/plants/3Cq2R6RljSUv9uAglZ9L49Ppufg5MfJdwvbis7gk.png', 169, 1660, 'BISNIS MODEL DEM', '[{\"title\":\"Wiring Harness\",\"description\":\"Wiring Harness 2W and 4W\",\"image\":\"company\\/business_models\\/S28V1TKXqf2fUL1EtFsHews9b36SMq4h5z0ZaGpM.png\"},{\"title\":\"Automotive Electronic Part\",\"description\":\"Head Unit, RSE, Antenna, USB Charger, Parking Sensor, Speaker\",\"image\":\"company\\/business_models\\/SxMQ99K32WRR8ehxLR8GzTvZXEapvOkj1qFHJc8V.png\"},{\"title\":\"Power & Energy Solution\",\"description\":\"Charging Station, Battery Pack, Battery Cell\",\"image\":\"company\\/business_models\\/8z5VaVydgxbirlhPImoC5yKIYYY3JQ88sLYvkjhK.png\"},{\"title\":\"AMR System\",\"description\":\"AGV (Automated Guided Vehicle)\",\"image\":\"company\\/business_models\\/tOlyqPJnatHRAU7AjxjUZgzv8TZVLgS0rKf07NuK.png\"}]', 'Yohanes Susanto', 'President Director', 'Knowledge & Technology Transformation By Innovation For Employee Engagement', 'company/directors/nzRLdg2rSic9gtiMyz3fhSls9olTQY5rrMhzv0qD.jpg', NULL, '2026-01-20 00:08:01', '2026-01-20 16:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution` varchar(255) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `date_format` varchar(255) NOT NULL DEFAULT 'Y',
  `is_current` tinyint(1) NOT NULL DEFAULT 0,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `gpa` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `institution`, `degree`, `start_date`, `end_date`, `date_format`, `is_current`, `location`, `description`, `gpa`, `order`, `created_at`, `updated_at`) VALUES
(1, 'POLITEKNIK META INDUSTRI', 'D4 Teknologi Rekayasa Perangkat Lunak', '2025-01-08', NULL, 'Y', 1, 'Cikarang Utara, Jawa Barat, Indonesia', NULL, '-', 1, '2025-12-29 10:30:17', '2026-01-20 23:45:49'),
(2, 'MA NEGERI 1 BOGOR', 'IPA', '2015-07-01', '2018-06-01', 'Y', 0, 'Bogor, Indonesia', NULL, '82.9', 2, '2025-12-29 10:30:17', '2025-12-29 12:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `company_en` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `date_format` varchar(255) NOT NULL DEFAULT 'F Y',
  `location` varchar(255) DEFAULT NULL,
  `location_en` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `show_description` tinyint(1) NOT NULL DEFAULT 1,
  `show_tags` tinyint(1) NOT NULL DEFAULT 1,
  `technologies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`technologies`)),
  `technologies_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`technologies_en`)),
  `order` int(11) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `title`, `title_en`, `company`, `company_en`, `type`, `start_date`, `end_date`, `date_format`, `location`, `location_en`, `description`, `description_en`, `show_description`, `show_tags`, `technologies`, `technologies_en`, `order`, `featured`, `created_at`, `updated_at`) VALUES
(1, 'Issuing', 'Issuing', 'PT. Sumber Alfaria Trijaya Tbk.', 'PT. Sumber Alfaria Trijaya Tbk.', 'Contract', '2018-01-01', '2020-01-01', 'Y', 'Bogor, Indonesia', 'Bogor, Indonesia', '- Mengecek barang masuk dan keluar\r\n- Menyiapkan barang untuk distribusi\r\n- Membuat administrasi pengiriman dan penerimaan barang', '- Checking items in and out\r\n- Preparing goods for distribution\r\n- Making administration of the delivery and receipt of goods', 0, 0, '[\"Pallet Mover\",\"Inventory Management\",\"Teamwork\"]', '[\"Pallet Mover\",\"Inventory Management\",\"Teamwork\"]', 6, 1, '2025-12-25 08:00:26', '2026-01-21 00:12:22'),
(2, 'Admin Produksi', 'Production Admin', 'PT. Mitra Metal Perkasa', 'PT. Mitra Metal Perkasa', 'Contract', '2020-03-01', '2021-12-31', 'Y', 'Karawang, Indonesia', 'Karawang, Indonesia', '- Menginput data hasil produksi harian ke dalam sistem database.\r\n- Membuat laporan produksi harian, mingguan, dan bulanan.\r\n- Memastikan ketersediaan bahan baku untuk kelancaran proses produksi.\r\n- Berkoordinasi dengan tim gudang dan PPIC terkait jadwal produksi.\r\n- Mengarsipkan dokumen-dokumen produksi (Surat Jalan, DO, Invoice) dengan rapi.\r\n- Memonitor stok barang jadi (finish goods) dan barang dalam proses (WIP).', '- Inputting daily production data into the database system.\r\n- Create daily, weekly, and monthly production reports.\r\n- Ensure the availability of raw materials for a smooth production process.\r\n- Coordinate with warehouse and PPIC teams regarding production schedules.\r\n- Filing production documents (Road Letters, DOs, Invoices) neatly.\r\n- Monitor the stock of finished goods (finish goods) and in-process goods (WIP).', 0, 0, '[\"WMS\",\"SAP\",\"Excel (Termasuk pivot table & VBA Excel)\"]', '[\"WMS\",\"SAP\",\"Excel (Includes Excel pivot table & VBA)\"]', 2, 1, '2025-12-25 08:00:26', '2026-01-21 00:12:04'),
(3, 'Checker Warehouse (Raw Material)', 'Checker Warehouse (Raw Material)', 'PT. Mayora Indah Tbk.', 'PT. Mayora Indah Tbk.', 'Contract', '2021-06-01', '2022-02-28', 'Y', 'Balaraja, Indonesia', 'Balaraja, Indonesia', '- Mengelola administrasi keluar masuk barang dan inventory.\r\n- Membuat laporan stok gudang secara berkala.\r\n- Menginput data penerimaan dan pengiriman barang ke sistem.\r\n- Mencocokkan data fisik barang dengan catatan sistem (Stock Opname).\r\n- Berkoordinasi dengan tim logistik untuk pengiriman barang.', '- Managing administration in and out of goods and inventory.\r\n- Generate warehouse stock reports on a regular basis.\r\n- Inputting data on the receipt and delivery of goods to the system.\r\n- Match the physical data of the goods with the system records (Stock Opname).\r\n- Coordinate with the logistics team for the delivery of goods.', 0, 0, '[\"WMS\",\"SAP\",\"Pallet Movers\",\"Forklift\",\"Inventory Management\",\"Supply Chain Management\"]', '[\"WMS\",\"SAP\",\"Pallet Movers\",\"Forklift\",\"Inventory Management\",\"Supply Chain Management\"]', 3, 1, '2025-12-25 08:00:26', '2026-01-21 00:11:55'),
(4, 'Staff Admin', 'Staff Admin', 'PT. Furnimart Mebelindo Sakti', 'PT. Furnimart Mebelindo Sakti', 'Contract', '2022-01-01', '2023-01-01', 'Y', 'Bogor, Indonesia', 'Bogor, Indonesia', '- Mengontrol keluar masuk barang serta membuat surat jalan dan delivery order.\r\n- Melakukan input data stok ke dalam sistem inventory (SAP/WMS/Excel).\r\n- Melakukan stock opname rutin untuk memastikan akurasi data fisik dan sistem.\r\n- Mengarsipkan dokumen logistik dan surat jalan dengan rapi.\r\n- Berkoordinasi dengan tim helper dan supir untuk jadwal pengiriman.', '- Controlling the entry and exit of goods and making road mail and delivery orders.\r\n- Input stock data into the inventory system (SAP/WMS/Excel).\r\n- Conduct routine stock taking to ensure the accuracy of physical and system data.\r\n- Filing logistical documents and road letters neatly.\r\n- Coordinate with helper and driver teams for delivery schedules.', 0, 0, '[\"Odoo\",\"Excel (Termasuk pivot table & VBA Excel)\",\"Sales\",\"Editing\"]', '[\"Odoo\",\"Excel (Includes Excel pivot table & VBA)\",\"Sales\",\"Editing\"]', 3, 1, '2026-01-03 13:11:28', '2026-01-21 00:11:10'),
(5, 'Admin Doc Control', 'Admin Doc Control', 'PT. Dharma Electrindo Mfg', 'PT. Dharma Electrindo Mfg', 'Contract', '2023-08-08', '2023-11-01', 'F Y', 'Bekasi, Indonesia', 'Bekasi, Indonesia', '- Melalukan penerimaan drawing dari marketing dan dokumen dari Project Management (PMWH, PMA, PMPEIS)\r\n- Meregistrasi drawing dan dokumen sesuai dengan ketentuan yang berlaku\r\n- Mendistribusikan drawing dan dokumen sesuai dengan ketentuan yang berlaku\r\n- Menyimpan drawing dan dokumen sesuai dengan standart perusahaan dan customer\r\n- Menjaga dan menjamin ruang dokumen hanya dapat diakses oleh pihak yang terdaftar pada confidentiality perusahaan\r\n- Bertanggung jawab menjaga kebersihan lingkungan dan 5R di area kerja dan mencegah kecelakaan kerja serta pencemaran lingkungan', '- Receiving drawings from marketing and documents from Project Management (PMWH, PMA, PMPEIS)\r\n- Register drawings and documents in accordance with applicable regulations\r\n- Distribute drawings and documents in accordance with applicable regulations\r\n- Storing drawings and documents in accordance with company and customer standards\r\n- Maintain and guarantee that document space can only be accessed by parties registered with the company\'s confidentiality\r\n- Responsible for maintaining environmental cleanliness and 5R in the work area and preventing work accidents and environmental pollution', 0, 0, '[\"SAP\",\"Excel (Termasuk pivot table & VBA Excel)\",\"PowerPoint\",\"Kerjasama tim\"]', '[\"SAP\",\"Excel (Includes Excel pivot table & VBA)\",\"Powerpoint\",\"Teamwork\"]', 2, 1, '2026-01-03 13:23:32', '2026-01-21 00:11:40'),
(6, 'Admin Eng Costing', 'Costing Eng Admin', 'PT. Dharma Electrindo Mfg', 'PT. Dharma Electrindo Mfg', 'Contract', '2023-11-01', NULL, 'F Y', 'Bekasi, Indonesia', 'Bekasi, Indonesia', '- Melakukan penginputan data dan perhitungan COGM berdasarkan Part List dan UMH dari Project Management\r\n- Membuat Form Request New Part untuk kebutuhan Procurement & Vendor Project Management (PNP)\r\n- Melakukan update data serta monitoring estimasi similar part agar perhitungan biaya selalu up to date\r\n- Memastikan perhitungan COGM benar, akurat, dan sesuai referensi data yang berlaku\r\n- Menyusun Resume COGM sebagai ringkasan biaya produksi untuk kebutuhan pelaporan/koordinasi\r\n- Menjaga kebersihan area kerja dan menerapkan 5R, serta berperan aktif dalam pencegahan kecelakaan kerja dan pencemaran lingkungan', '- Perform data input and COGM calculation based on Part List and UMM from Project Management\r\n- Creating a New Part Request Form for Procurement & Vendor Project Management (PNP) needs\r\n- Update data and monitor similar part estimates so that cost calculations are always up to date\r\n- Ensure that COGM calculations are correct, accurate, and in accordance with applicable data references\r\n- Preparing the COGM Resume as a summary of production costs for reporting/coordination needs\r\n- Maintain the cleanliness of the work area and implement the 5Rs, and play an active role in the prevention of work accidents and environmental pollution', 0, 0, '[\"SAP\",\"Costing\",\"COGM Analysis\",\"Excel (Termasuk pivot table & VBA Excel)\",\"Microsoft Word\",\"PowerPoint\",\"Kerjasama tim\",\"Disiplin\",\"Problem solving\",\"Kreativitas\"]', '[\"SAP\",\"Costing\",\"COGM Analysis\",\"Excel (Includes Excel pivot table & VBA)\",\"Microsoft Word\",\"Powerpoint\",\"Teamwork\",\"Discipline\",\"Problem-Solving\",\"Creativity\"]', 1, 1, '2026-01-03 13:32:10', '2026-01-21 00:10:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_descriptions`
--

CREATE TABLE `job_descriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('description','activity') NOT NULL DEFAULT 'description',
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_descriptions`
--

INSERT INTO `job_descriptions` (`id`, `type`, `title`, `description`, `items`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'description', 'Admin Doc Control', '- Melalukan penerimaan drawing dari marketing dan dokumen dari Project Management (PMWH, PMA, PMPEIS)\r\n- Meregistrasi drawing dan dokumen sesuai dengan ketentuan yang berlaku\r\n- Mendistribusikan drawing dan dokumen sesuai dengan ketentuan yang berlaku\r\n- Menyimpan drawing dan dokumen sesuai dengan standart perusahaan dan customer\r\n- Menjaga dan menjamin ruang dokumen hanya dapat diakses oleh pihak yang terdaftar pada confidentiality perusahaan\r\n- Bertanggung jawab menjaga kebersihan lingkungan dan 5R di area kerja dan mencegah kecelakaan kerja serta pencemaran lingkungan', '[]', 0, 1, '2026-01-21 00:17:23', '2026-01-21 00:19:08'),
(2, 'description', 'Admin Eng Costing', '- Melakukan penginputan data dan perhitungan COGM berdasarkan Part List dan UMH dari Project Management\r\n- Membuat Form Request New Part untuk kebutuhan Procurement & Vendor Project Management (PNP)\r\n- Melakukan update data serta monitoring estimasi similar part agar perhitungan biaya selalu up to date\r\n- Memastikan perhitungan COGM benar, akurat, dan sesuai referensi data yang berlaku\r\n- Menyusun Resume COGM sebagai ringkasan biaya produksi untuk kebutuhan pelaporan/koordinasi\r\n- Menjaga kebersihan area kerja dan menerapkan 5R, serta berperan aktif dalam pencegahan kecelakaan kerja dan pencemaran lingkungan', '[]', 0, 1, '2026-01-21 00:19:40', '2026-01-21 00:19:40'),
(3, 'activity', 'Admin Doc Control', '- Menerima, memeriksa kelengkapan, dan meregistrasi drawing/dokumen dari Marketing dan Project Management.\r\n- Mengarsipkan serta mengelola revisi dokumen sesuai standar perusahaan/customer.\r\n- Mendistribusikan dokumen kepada pihak terkait sesuai ketentuan dan menjaga kerahasiaan akses dokumen.\r\n- Menerapkan 5R/5S serta mendukung pencegahan kecelakaan kerja dan pencemaran lingkungan.', '[]', 0, 1, '2026-01-21 00:28:29', '2026-01-21 00:28:29'),
(4, 'activity', 'Admin Eng Costing', '- Menginput dan menghitung COGM berdasarkan Part List, UMH, dan estimasi similar part dari Project Management.\r\n- Membuat Form Request New Part untuk Procurement & Vendor Project Management serta update/monitor estimasi similar part.\r\n- Memastikan akurasi perhitungan dan menyusun Resume COGM, termasuk pengelolaan dokumen pendukung.\r\n- Menerapkan 5R/5S serta mendukung pencegahan kecelakaan kerja dan pencemaran lingkungan.', '[]', 0, 1, '2026-01-21 00:30:28', '2026-01-21 00:30:28'),
(5, 'activity', 'Addtitional Job', '- Berkontribusi pembuatan PR, ID Code, dan BOM\r\n- Berkontribusi pembuatan control pemakaian budget investasi yang tercantum dalam form A11', '[]', 0, 1, '2026-01-21 00:32:30', '2026-01-21 00:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john@example.com', 'Project Inquiry', 'Hi, I am interested in working with you on a new e-commerce project. Would love to discuss further.', 0, '2025-12-25 08:00:27', '2025-12-25 08:00:27'),
(2, 'Jane Smith', 'jane@example.com', 'Collaboration Opportunity', 'Hello! I saw your portfolio and would love to collaborate on an upcoming mobile app project.', 1, '2025-12-25 08:00:27', '2025-12-25 08:00:27'),
(3, 'Mike Johnson', 'mike@company.com', 'Full-time Position', 'We have an opening for a senior developer role and your profile caught our attention. Would you be interested?', 0, '2025-12-25 08:00:27', '2025-12-25 08:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_25_000001_create_categories_table', 1),
(5, '2025_12_25_000002_create_projects_table', 1),
(6, '2025_12_25_000003_create_skills_table', 1),
(7, '2025_12_25_000004_create_experiences_table', 1),
(8, '2025_12_25_000005_create_profiles_table', 1),
(9, '2025_12_25_000006_create_messages_table', 1),
(10, '2025_12_29_172748_create_education_table', 1),
(11, '2025_12_29_173456_add_location_to_experiences_and_education_tables', 1),
(12, '2025_12_29_175944_add_bio_id_to_profiles_table', 1),
(13, '2025_12_29_192346_add_is_current_to_education_table', 1),
(14, '2025_12_29_194226_create_technologies_table', 1),
(15, '2025_12_30_123400_add_featured_to_technologies_and_experiences_tables', 1),
(16, '2025_12_30_174248_create_visitor_logs_table', 1),
(17, '2025_12_30_180508_add_location_to_visitor_logs_table', 1),
(18, '2025_12_30_191545_add_website_settings_to_profiles_table', 1),
(19, '2026_01_03_183045_modify_skills_table_structure', 1),
(20, '2026_01_03_192257_add_date_format_to_experiences_and_education_tables', 1),
(21, '2026_01_03_194337_make_category_nullable_in_skills_table', 1),
(22, '2026_01_03_194649_make_items_nullable_in_skills_table', 1),
(23, '2026_01_03_205216_add_english_columns_to_experiences_table', 1),
(24, '2026_01_03_212248_add_english_fields_to_skills_table', 1),
(25, '2026_01_03_213710_add_technologies_en_to_experiences_table', 1),
(26, '2026_01_03_215141_create_certifications_table', 1),
(27, '2026_01_03_215951_add_visible_sections_to_profiles_table', 1),
(28, '2026_01_20_065950_create_company_profiles_table', 1),
(29, '2026_01_20_080440_add_footer_text_to_company_profiles_table', 1),
(30, '2026_01_20_081417_add_logo_to_company_profiles_table', 1),
(31, '2026_01_20_204304_create_organization_structures_table', 1),
(32, '2026_01_20_211523_create_committee_activities_table', 1),
(33, '2026_01_20_225342_add_visible_sidebar_menus_to_profiles_table', 1),
(34, '2026_01_20_233026_add_career_aspiration_and_milestones_to_profiles_table', 1),
(35, '2026_01_21_013334_create_automation_strategies_table', 1),
(36, '2026_01_21_021235_create_obstacle_challenges_table', 1),
(37, '2026_01_21_023800_create_job_descriptions_table', 1),
(38, '2026_01_21_035454_add_section_order_to_profiles_table', 1),
(39, '2026_01_21_042327_add_button_visibility_to_profiles_table', 1),
(40, '2026_01_21_062518_create_business_process_flows_table', 1),
(41, '2026_01_21_070740_add_visibility_toggles_to_experiences_table', 1),
(42, '2026_01_21_090240_make_title_nullable_in_automation_strategies_table', 1),
(43, '2026_01_21_090250_make_title_nullable_in_automation_strategies_table', 1),
(44, '2026_01_22_044100_add_level_to_organization_structures_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `obstacle_challenges`
--

CREATE TABLE `obstacle_challenges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('obstacle','challenge') NOT NULL DEFAULT 'obstacle',
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obstacle_challenges`
--

INSERT INTO `obstacle_challenges` (`id`, `type`, `title`, `description`, `items`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'obstacle', 'Data input tidak lengkap atau berubah-ubah', '(Part List, UMH, estimasi similar part) sehingga perhitungan COGM sering revisi.', '[]', 0, 1, '2026-01-21 20:10:00', '2026-01-21 20:13:12'),
(3, 'obstacle', 'Akses dan konsistensi referensi harga', '(pricebook) terbatas atau update tidak seragam antar proyek/vendor.', '[]', 0, 1, '2026-01-21 20:16:54', '2026-01-21 20:16:54'),
(4, 'obstacle', 'Kontrol revisi dokumen', '(A00, A04/A05, draft investasi) kurang rapi sehingga berisiko salah versi saat menghitung.', '[]', 0, 1, '2026-01-21 20:17:38', '2026-01-21 20:17:38'),
(5, 'obstacle', 'Banyak aktivitas masih manual', 'Format dan struktur data berbeda antar kategori bisnis', '[\"(copy-paste, dokumen excel, rekap) sehingga rawan human error dan memakan waktu.\"]', 0, 1, '2026-01-21 20:19:37', '2026-01-21 20:19:37'),
(6, 'challenge', 'Membangun standard costing lintas proyek dan lintas kategori', 'tanpa mengurangi fleksibilitas kebutuhan masing-masing proyek.', '[]', 0, 1, '2026-01-21 20:21:55', '2026-01-21 20:21:55'),
(7, 'challenge', 'Menyusun costing model untuk kategori baru', '(Power & Energy Solution dan AMR System) yang masih berkembang', '[]', 0, 1, '2026-01-21 20:22:44', '2026-01-21 20:23:40'),
(8, 'challenge', 'Menciptakan sistem atau aplikasi', 'yang mengurangi pekerjaan manual, mempercepat proses, dan meningkatkan akurasi (termasuk kontrol revisi dan audit trail).', '[]', 0, 1, '2026-01-21 20:23:13', '2026-01-21 20:23:50'),
(9, 'challenge', 'Menerapkan kerangka Product Life Cycle', 'untuk mengukur pertumbuhan jangka panjang tiap kategori, yang membutuhkan data historis rapi dan definisi parameter yang konsisten.', '[]', 0, 1, '2026-01-21 20:24:42', '2026-01-21 20:24:42'),
(10, 'challenge', 'Menjaga keseimbangan antara kecepatan dan kualitas', 'tuntutan deadline tinggi, namun akurasi dan dokumentasi tetap wajib kuat.', '[]', 0, 1, '2026-01-21 20:25:21', '2026-01-21 20:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `organization_structures`
--

CREATE TABLE `organization_structures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `level` varchar(255) NOT NULL DEFAULT 'staff',
  `photo` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_structures`
--

INSERT INTO `organization_structures` (`id`, `name`, `position`, `department`, `level`, `photo`, `parent_id`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'LABERTE ANDRI HARYO', 'Division Head MPD', 'Division', 'division', NULL, 3, 0, 1, '2026-01-20 13:53:13', '2026-02-15 20:23:18'),
(2, 'MONICA BA', 'Costing Engineering Coordinator', 'Cost Analyst & Administration', 'staff', NULL, 1, 1, 1, '2026-01-20 13:54:15', '2026-02-15 20:22:26'),
(3, 'Y SUSANTO', 'BOARD OF DIRECTOR', 'President Director', 'board_of_director', NULL, NULL, 0, 1, '2026-01-21 20:34:55', '2026-02-15 20:23:02'),
(4, 'TUBAGUS IMRAN SHIDIQ', 'Costing Engineering Admin', 'Cost Analyst & Administration', 'admin', NULL, 2, 0, 1, '2026-01-21 20:36:30', '2026-02-15 20:26:42'),
(5, 'ERWAN DWI PRASETYO', 'Project Investment Control', 'Cost Analyst & Administration', 'staff', NULL, 1, 0, 1, '2026-01-21 20:36:55', '2026-02-15 19:59:18'),
(6, 'AHMAD RIA RAMADHLAN', 'Master Material & B.O.M', 'Cost Analyst & Administration', 'staff', NULL, 1, 0, 1, '2026-01-21 20:38:16', '2026-02-15 19:58:28'),
(7, 'HANI HANDAYANI', 'Document Control', 'Cost Analyst & Administration', 'admin', NULL, 2, 0, 1, '2026-01-21 20:38:55', '2026-02-15 19:59:36'),
(12, 'RINA MERRIANA', 'PD Administration', 'Cost Analyst & Administration', 'admin', NULL, 1, 0, 1, '2026-01-21 22:05:54', '2026-02-15 20:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `website_title` varchar(255) DEFAULT NULL,
  `visible_sections` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`visible_sections`)),
  `visible_sidebar_menus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`visible_sidebar_menus`)),
  `section_order` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`section_order`)),
  `title` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `bio_id` text DEFAULT NULL,
  `story` text DEFAULT NULL,
  `career_aspiration` text DEFAULT NULL,
  `career_aspiration_id` text DEFAULT NULL,
  `career_milestones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`career_milestones`)),
  `photo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `cv_file` varchar(255) DEFAULT NULL,
  `show_cv_button` tinyint(1) NOT NULL DEFAULT 1,
  `show_contact_button` tinyint(1) NOT NULL DEFAULT 1,
  `years_experience` int(11) NOT NULL DEFAULT 0,
  `total_projects` int(11) NOT NULL DEFAULT 0,
  `happy_clients` int(11) NOT NULL DEFAULT 0,
  `awards` int(11) NOT NULL DEFAULT 0,
  `hobbies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hobbies`)),
  `social_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`social_links`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `website_title`, `visible_sections`, `visible_sidebar_menus`, `section_order`, `title`, `bio`, `bio_id`, `story`, `career_aspiration`, `career_aspiration_id`, `career_milestones`, `photo`, `favicon`, `email`, `phone`, `whatsapp`, `location`, `cv_file`, `show_cv_button`, `show_contact_button`, `years_experience`, `total_projects`, `happy_clients`, `awards`, `hobbies`, `social_links`, `created_at`, `updated_at`) VALUES
(1, 'Tubagus Imran', 'Tubagus | New Portfolio', '[\"hero\",\"about\",\"education\",\"experience\",\"job_description\",\"committee_activities\",\"career_aspiration\",\"automation_strategy\",\"obstacle_challenge\",\"company_profile\",\"organization_structure\",\"projects\"]', '[\"dashboard\",\"projects\",\"experience\",\"education\",\"tech_stack\",\"skills\",\"certifications\",\"company_profile\",\"organization_structure\",\"committee_activities\",\"career_aspiration\",\"automation_strategy\",\"obstacle_challenge\",\"job_description\",\"cv\",\"visitors\",\"settings\"]', '[\"hero\",\"stats\",\"about\",\"education\",\"experience\",\"quote\",\"job_description\",\"tech_stack\",\"skills\",\"certifications\",\"committee_activities\",\"career_aspiration\",\"automation_strategy\",\"obstacle_challenge\",\"company_profile\",\"organization_structure\",\"projects\",\"contact\",\"social\",\"business_process_flow\"]', 'Costing Eng Admin', 'Engineering Costing Admin responsible for inputting COGM data based on the Part List and UMH received from Project Management, preparing New Part Request Forms for Procurement & Vendor Project Management, updating and monitoring similar-part cost estimates, ensuring COGM is calculated correctly and accurately, and compiling the COGM summary; in carrying out these duties, ensures the availability of the latest Part List, UMH, and new similar-part estimates from Project Management, obtains access to open the Pricebook file from Procurement & Vendor Project Management, secures copies of documents A00 and A04/A05 from Document Control, as well as a copy of the draft investment plan document, while also maintaining workplace cleanliness and implementing 5R, and preventing workplace accidents and environmental pollution.', 'Perkenalkan, saya lahir di Bogor pada 19 Oktober 1999 dan saat ini berusia 26 tahun. Saya merupakan anak ke-3 dari 6 bersaudara. Saya memiliki minat besar teknologi, khususnya software, untuk memahami cara kerja sistem, mencoba tools baru, dan terus mengikuti perkembangan digital. Saya dikenal sebagai pribadi yang proaktif dan berorientasi pada hasil, cepat belajar, serta nyaman bekerja secara terstruktur maupun kolaboratif, dengan komitmen untuk terus berkembang dan memberikan kontribusi terbaik.', 'Admin Engineering Costing yang bertanggung jawab melakukan penginputan data COGM sesuai Part List dan UMH dari Project Management, membuat Form Request New Part untuk PNP, melakukan update serta monitoring estimasi similar part, memastikan COGM dihitung benar dan akurat, serta menyusun Resume COGM; dalam pelaksanaannya memastikan ketersediaan Part List, UMH, dan estimasi similar part terbaru dari Project Management, memperoleh akses membuka file Pricebook dari PNP, mendapatkan copy dokumen A00 dan A04/A05 dari Document Control, serta copy dokumen draft rencana investasi, sekaligus menjaga kebersihan lingkungan kerja dan penerapan 5R serta mencegah kecelakaan kerja dan pencemaran lingkungan.', 'Saya ingin berkembang dari Admin Engineering Costing menjadi pemimpin fungsi Costing/Cost Analyst yang mampu membangun sistem costing dan analitik berbasis Product Life Cycle (PLC) untuk mengukur pertumbuhan jangka panjang pada 4 kategori bisnis (Wiring Harness, Automotive Electronics Parts, Power & Energy Solution, dan AMR System), termasuk menyiapkan penyesuaian model costing bagi kategori baru (Power & Energy Solution dan AMR System) agar keputusan bisnis lebih cepat, akurat, dan berbasis data.', 'Menjadi arsitek perangkat lunak kelas dunia.', '[{\"year\":\"2023 - 2026\",\"title\":\"Admin Engineering Costing\",\"description\":\"- Menstandarkan input dan kontrol akurasi COGM (Part List, UMH, similar part, pricebook) lintas proyek.  \\r\\n- Menyusun \\u201cdata foundation\\u201d untuk 4 kategori: struktur master data, template costing, dan aturan dokumen pendukung.  \\r\\n- Kontribusi awal ke analitik: rekap biaya per kategori dan tren dasar (biaya material, UMH, perubahan estimasi).\"},{\"year\":\"2026 - 2028\",\"title\":\"Costing Engineering Coordinator\",\"description\":\"- Memimpin koordinasi costing lintas fungsi untuk 4 kategori bisnis dan menetapkan quality gate (review, audit formula, traceability).\\r\\n- Membuat prototype sistem\\/program (mis. Excel automation \\/ database sederhana \\/ dashboard) untuk: \\r\\n - perhitungan COGM konsisten,\\r\\n - monitoring similar part,\\r\\n - kontrol revisi pricebook,\\r\\n - reporting biaya per kategori.\\r\\n- Mulai kerangka Product Life Cycle costing: definisi parameter Product Life Cycle per kategori (indikator growth, volume, biaya, margin, learning curve).\"},{\"year\":\"2029 - 2030\",\"title\":\"Section Head Cost Analyst\",\"description\":\"- Mengelola tim dan KPI (akurasi, lead time, compliance) serta memastikan costing berjalan stabil untuk semua kategori.\\r\\n- Mengembangkan sistem menjadi aplikasi internal\\/alat analitik yang lebih terintegrasi (workflow input\\u2013validasi\\u2013approval\\u2013report).\\r\\n- Menguatkan model untuk kategori baru (Power & Energy Solution & AMR System): penyesuaian struktur BoM, cost driver, dan asumsi standar (karena karakteristiknya masih berkembang).\"}]', NULL, NULL, 'tebeeimran@gmail.com', '085789710340', '6285789710340', 'Cikarang Utara, Kabupaten Bekasi, Jawa Barat', 'cv/EINn5YjRgSGZjdT4fos3PYnHHntXTCs0hhA44kF6.pdf', 0, 0, 5, 40, 25, 12, '[{\"name\":\"Photography\",\"icon\":\"camera\"},{\"name\":\"Gaming\",\"icon\":\"gamepad\"},{\"name\":\"Hiking\",\"icon\":\"mountain\"},{\"name\":\"Reading\",\"icon\":\"book\"}]', '{\"linkedin\":\"https:\\/\\/www.linkedin.com\\/in\\/tubagus-imran\\/\",\"github\":\"https:\\/\\/github.com\\/tebeeimran-bit\",\"instagram\":\"https:\\/\\/www.instagram.com\\/tebeimran\\/\",\"facebook\":\"https:\\/\\/www.facebook.com\\/tb.imran19\\/\"}', '2025-12-25 08:00:26', '2026-03-04 20:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `client` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `timeline` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `challenge` text DEFAULT NULL,
  `solution` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `tools` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tools`)),
  `key_improvements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`key_improvements`)),
  `live_url` varchar(255) DEFAULT NULL,
  `code_url` varchar(255) DEFAULT NULL,
  `status` enum('published','draft') NOT NULL DEFAULT 'draft',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `category_id`, `title`, `slug`, `client`, `role`, `timeline`, `description`, `challenge`, `solution`, `thumbnail`, `images`, `tags`, `tools`, `key_improvements`, `live_url`, `code_url`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(2, 2, 'Budget & Investment System', 'budget-investment-system', 'Dharma Electrindo Mfg.', 'Full Stack Developer', '8 Weeks', 'Real-time data visualization tool for tracking investments and market trends.', '1. Budgeting masih manual dan data tersebar di banyak file, sehingga rawan salah input dan sulit dikontrol.\r\n\r\n2. Monitoring rencana vs realisasi terlambat, sehingga overbudget sering ketahuan belakangan.\r\n\r\n3. Alur approval Purchase Request (PR) tidak jelas dan bisa berjalan tanpa cek ketersediaan anggaran.\r\n\r\n4. Budget proyek/investasi tidak terhubung dengan transaksi, sehingga sulit memantau biaya per proyek.\r\n\r\n5. Transparansi dan kebutuhan audit lemah karena jejak approval serta dokumen pendukung tidak rapi.\r\n\r\n6. Master data (kategori, akun, vendor, proyek) tidak konsisten sehingga laporan jadi kurang akurat.', '1. Sediakan modul Budget Plan terpusat untuk input anggaran, revisi terkontrol, dan data rapi dalam satu sistem.\r\n\r\n2. Buat dashboard yang menampilkan Total Budget, Total Realisasi, dan Sisa Anggaran secara real-time.\r\n\r\n3. Terapkan modul Purchase Request dengan workflow status yang jelas dan validasi budget sebelum disetujui.\r\n\r\n4. Gunakan modul Projects untuk menghubungkan budget proyek + PR + realisasi agar monitoring per proyek mudah.\r\n\r\n5. Aktifkan audit trail (log aktivitas) dan penyimpanan lampiran/dokumen sebagai bukti proses.\r\n\r\n6. Buat modul Master Data dengan input berbasis pilihan (dropdown) agar data seragam dan laporan konsisten.', 'projects/BryK5QHi33M2H0nvOBfTPMeu9vQIkliaZFWXafRD.png', '[\"projects\\/BryK5QHi33M2H0nvOBfTPMeu9vQIkliaZFWXafRD.png\",\"projects\\/KU6PqjZZoSkrH91zHHArasIzjIKXhiTVZyZsTrtO.png\",\"projects\\/Vo9UPibS0PRlFZT4UTIm9jELOMJKqTIV7aYB1Zna.png\",\"projects\\/sKerIcZVzh9EVLDdwlqHJyySSK1PvUfB3ZFBkyrw.png\"]', '[\"Web App\",\"Laravel\"]', '[\"Laravel\",\"MySql\"]', NULL, 'https://bis.tubagus.my.id', NULL, 'published', 1, '2025-12-25 08:00:27', '2026-02-22 00:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0hyNQVCkjFnUjPZL9sIwGYAB3HSGmtpBMjQI4Su0', NULL, '84.246.85.11', '2ip bot/1.1 (+https://2ip.io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWk1peTZmSW5QaWJvRk1GTVA0bDE4dEhJSWJWRnhLYmdtZ1o0QUpJcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772603006),
('0xWINjsXFjsuBfS5M51rjW3ev9T3q5q3ZGCzvLjM', NULL, '20.63.102.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREhaeVBUeEg1UXB3Z0liZ3ZwZVpVV3JucFFWbUhqUkU0VnBSRWdNNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772449148),
('3FL9cwNC9r6jfarZ3K0ODejSleT5OfZaU7SjDnsA', NULL, '134.209.180.47', 'python-requests/2.32.5', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUpkZ2ZWZ3JWTmpBYTA4d0F3TnFjT2laNENIWDJYeGppbG5ENFg3SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772670960),
('7ZTyDra2cdNOxBJkHjAUlRQi6hPuACSDvYN4n38C', NULL, '20.89.52.173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidE94UFZrYm53VVlPQjhPRjZZYjlSNXEyalNUckp6bTNFZTdCSms4WCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772526771),
('8mx8L3GRhgm2PHFCChEayct61jn1G7MaXNAdSed5', NULL, '165.227.78.2', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW9RZGVDek5nOURVaVJZVlFKeXg1dmk1b0JDaTdaUWphU3dEcUhrYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnR1YmFndXMubXkuaWQiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1772503345),
('At9huPkA3JhNjPRVze6sU87PlgQuxYKW7mYEGmXr', NULL, '93.158.92.13', 'Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-A415F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/23.0 Chrome/115.0.0.0 Mobile Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWdObm90SzFmU0loRmNwT3h2ckVGdHIzdFhHRE1LODZzTWtaNGFJUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772496233),
('AVIMEPVtMdgsfy0FeV4bHwqXjmXqoqUEurhC4aeT', NULL, '109.199.112.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVc2OElLeUhqTDVRbWR1OEhoQ2hUSnAzYWRvd3RiTU00aUdIVnFncSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9jb250YWN0IjtzOjU6InJvdXRlIjtzOjc6ImNvbnRhY3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772588655),
('BFXyOrGDFr0JKvDxEg84IkSRzFogdLqlEg4wJxVp', NULL, '93.158.92.11', 'Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-A415F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/23.0 Chrome/115.0.0.0 Mobile Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNno2Ujd5bzZmWmRta2xTUkxGRTlPaVFPU3dFQnBMNEhiUHN1NVU1NyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772496238),
('cCqKjrzycEiC1xpOXyngZU98XOiZrOfJE5D870Kg', NULL, '74.7.227.157', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWk2NWNGTHU3Q2xjV3kyQnd2NGZUSTgzR2hnZ3dNdmFHYUlpQWlqWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772318280),
('CNyUUPTGY9mSqFOuz9jyFyT2qxxsptCluKF808ew', NULL, '111.67.102.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFJ2bHlZYjYzQU50UkJuMGw1Z0RVdE9tWkNIMnFSN0szUFVVbW1JZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772352410),
('cnYxcEIP8UER3bxMkp3a1xaxd21ltLkTTBrDMMtm', NULL, '20.219.132.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUFWd2NXMkVhZkZOOUoxeXpYYWRxbk5ac0Y5MUFZa3RvVjFya2JFaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772652974),
('cxHxtocFg9v3n0YJVASaqx0js9xlEQcTiCUzSnHL', NULL, '45.156.87.246', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjJQUmFOb2xiU3N5ZndHQ3BaaEtJR0FGSU5UVFBkY1kwZjZieVNtdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772428406),
('d4CDNNHkSDrDYH00kaGXZGcE0kJoYDH4uwfxmVoD', NULL, '185.191.171.7', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTlKb2VvZ3U0SkxBeEUxSENRdm5sNWFWZ0xtUUVScFViWlNMYTJjRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wcm9qZWN0cy9idWRnZXQtaW52ZXN0bWVudC1zeXN0ZW0iO3M6NToicm91dGUiO3M6MTM6InByb2plY3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772350431),
('dbebyYtdPm0tBOh7TfLXl1EW4wTfmF88S7e9IBEV', NULL, '5.182.17.159', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFhGMWh1Y2FrbWJvZVdicGRXR2VxV1VzekNjMHNFMGVMN0trSjJHUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772586836),
('Dg9IvkYhNsck6i4fi0zWENYxvPpH19T8OF4I6jaM', NULL, '185.12.250.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Safari/605.1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzAybjhGa0hZVzdCTlBHWXJNcVlwbDMxMnhtaFVQRGZNdm9DTkVlVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772481746),
('DVwXgOmyQs9dORsniW33vCJUhzZjFtNJ6Q5LJvMF', NULL, '84.246.85.11', '2ip bot/1.1 (+https://2ip.io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamRGRDJjVk14MWFLcDFoQkdXN0E0bXVwcFVZV1pybnhVN2J1QUd3MiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772603011),
('DWbrsInoLbO2zOURilVtyBB5AkCSVyHNRul7GCFk', NULL, '85.208.96.204', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicUVLaUUwYTVtN2JiV1JBUEFPa1BEa3hnM3BZanh2eDMxTXV6enc1RCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly90dWJhZ3VzLm15LmlkL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772362037),
('DY79XIAtZQOYtrs31I4jKsxk2tgtzfXTN7AmPZ3E', NULL, '20.104.87.220', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUNDQzg2ZUQ2bHUyTWxvMHR0TFVOYlFxZER6Vk9XeHVydnZRUkNxcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772453630),
('eChqNLTyJnzf4d31dkqi4YZHPni4KpYyv0qbgreM', NULL, '198.235.24.19', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGZQUWZ0OGFqczFLMkZrZ296WWo2Y25FVnFDdFlBbHRqb1RHUGlsSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772471072),
('edhPxizT3q3cqkDKToK7Uk0hYIwq1Fh6lmyreW2z', NULL, '20.89.52.173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGZSZFlVdjJxT1pTR3hZY0tQV01GcXliWEdNOVNVbFc0V05EeFhTaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772325406),
('EEVb0r78EQOGhiWoZd3wsaUxyy8fcbNbiTTazOwO', NULL, '20.220.211.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWhCbFpad1VmbmJKd3d0Sjd6SDRxTzNKbTNpNDN2c2VHU3hFTGhHdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772564605),
('egbHpOz1bzkeRzptxMHYGT9lZUbZlQt238btztw8', NULL, '74.7.227.41', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVFzTjEySWFLTDlyRDdPZDMwdGYyUFpJRDJpZU5ETVFRblpWVnpvYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772530916),
('EoowV5ulTOPlAoynU6rBLKufihtJ1c6jvTxOREsn', NULL, '121.127.34.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkswcExjcDdFMHU2VTY1aUtYeWpQM3pwVmpUZXpCY2FTNVlCaU1VUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772411477),
('EPHpxxYEmFFBU8QhMgqSZlUitTWmHdgno6AtEDLC', NULL, '84.246.85.11', '2ip bot/1.1 (+https://2ip.io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaE9DSHMxcmgybG9qTkZaY0RCamttQ3JTSUI4WWJhdXlFaWZqdU03YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772603008),
('G8itZEu6HA6CIa9C50bDj6bZTcTgQcSqFnkjzMrx', NULL, '20.63.102.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFpWMlQ1MDh6VmpSZWZhR3BaTjBPQ3VzekJ0V1l1MXJsZFZjTndTdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772466040),
('h0uz9Uat74bVLBG5BhblDcVAFcNRX1BAbPCGaemQ', 1, '103.165.122.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOXZEN1pXQ3R3MG0xZXVZalNQZ015YUduazczSlowNDJsY0Q4WGp3eCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wcm9qZWN0cy9idWRnZXQtaW52ZXN0bWVudC1zeXN0ZW0iO3M6NToicm91dGUiO3M6MTM6InByb2plY3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1772683932),
('h2sfAlCP9y6pqWxH60xK4HzcnDpwMm8Ne0Q81TUo', NULL, '20.89.52.173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ21TNWlHUmlYZjNicERGRHk5djROSkdXVVhwQ0lxTzR1dHRGajlTTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772481803),
('HfVziOUmgGEzHCKLafDe5iaIBkbiHC9d1KIyIxkW', NULL, '192.36.109.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWdVNTVFa0xZMnFVVVUzRVRNWWppUWxEdTRGSWZmTWRjN3JyT3pubSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wcm9qZWN0cy9idWRnZXQtaW52ZXN0bWVudC1zeXN0ZW0iO3M6NToicm91dGUiO3M6MTM6InByb2plY3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772582618),
('hmEHQ9CN981IuHRsYRmuwUkx3TgwCF54bJmgnbT7', NULL, '20.89.52.173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjdpODcwZEl0eHhjTzIwVlI3YjlRZU5XcnZBTElFMWRDeVFUSTA2aiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772445361),
('hN6hCKms4yHThTUKx3nCtS3JgLIyNIP4gWUeg6Q8', NULL, '20.219.8.79', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3dEWGhEOElXOXVleE83WFllWnBKbFVHb1RuV1hLNEZYWGcwbHowaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772388007),
('hZZn7vn7tKtKZMDpY42Aie1K2R4etXkDKo8WK6Pc', NULL, '103.165.122.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFZBTW9qeXZEYkpSbUJlMlNOaEtZQzRPNDRhcFNDVUFkSzZGakZRUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772682616),
('i2J0j6yXRvn1hawEBi7xCZijzE0TqGlphOD6rtho', NULL, '20.89.52.173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTFoZm1TZkVRdUpkMURuZXFyMmg2M2xRdVRVR1FCak9ESlRHWGNtTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772354022),
('IANztkNGDqknO9rKFB5AMtgQPFOJ10Fetwp9qMtD', NULL, '165.154.206.204', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/550.44 (KHTML, like Gecko) Chrome/64.0.1890 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzhWT3V4T1pOU0NSWTlTdlBsbGdlTzlndTcybUpQT1oydUxYcEJDRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772388868),
('IIeoiA5Qvg5bm3I1yq8cRBPrT2hKF0rgO1hWpgDs', NULL, '192.121.146.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjR2NTdobkJHd0FWMU1CcVdJVk5sbFVEY1ZqTmVlNnR5UjJKRmRyRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772582620),
('Ijbzpe9F80nCsfBujciWzebSOMotwzYIgOaqGlva', NULL, '54.196.145.210', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1FxdjRYSGwySzZadDRnZ1NtMzJtdFdzSUcxYXV6bWNVNjBzSzdYYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772666078),
('k9CbmnK9CsUG9Ei6YeSrXWVjCZE3pPzGuijqULTA', NULL, '130.61.17.31', 'Mozilla/5.0 (compatible; TechCrawler/1.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlJ5M0V4WjVNVHo1NnNLVkhTRTZnUHpkeVRUN3daOHF3THJLU2Q0cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772654861),
('kexA9SBEthacxqLou4b0bHPQwgyR66w5MZVCFQp9', NULL, '20.65.88.76', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemNJcjcyOFRRVk9kOEdhcFJRZW9mdm9JWVJkenExTWxueE1sc3FsSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772557644),
('kJTIOSg2ehCoKJ9mnHfnk7SYDoooD1hjUEa9GSh2', NULL, '20.220.162.180', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiall2cjYwdmloT2RFaUZxWEh2RFdHNWpaVHVnTHNJSDFndm43emxQNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772371897),
('Klbe1T4e7h9bjcjsiw7xjccZ0Gx0VnRBt165H7T5', NULL, '81.29.142.100', 'Mozilla/5.0 (Windows NT 6.1; rv:89.0) Gecko/20100101 Firefox/89.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUNDOEtRZjdRQ0hrQnpRbkswNGhTeHV1d3V0a25ueDhkRGltMEU5QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772353946),
('l0Oc8RmZ6qHD61eDdprQfaKnGHaF3a3U8FBlSlfs', NULL, '147.182.210.101', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW9aTklLOGtjZ3J4cFIxRkcwWlNHNERvY3MxZmtjZFNmblpodUVvZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnR1YmFndXMubXkuaWQiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1772543795),
('LCGrIV3ERYiIc5L78J2EaVJqI49GYuIxDFZvmGxJ', NULL, '192.36.166.94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTk10aUVvSGxZRFB2b3BBSDBRbzNPeTl2bHdIMEowTUxXWmxXaFFCZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772582621),
('LjmCyLOIfJquRUc0aKX6Vvwsux8SuMUviU9NyaaW', NULL, '93.158.91.244', 'Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-A415F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/23.0 Chrome/115.0.0.0 Mobile Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVI1bTlxU2psclpPTzlwbTgzUUdNdVU3SkxmMHJXYTQ4alk0cEZ5RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772496230),
('lnDXuZFQ1c7esmKRhVb7Tutj05rGOZTL9LBnJMAw', NULL, '217.160.202.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXVOcUVJWFhRWkh5Vm9Gb1VuQXF6Qmdxbk83OWkyb3RSTEpaMFNLTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772550394),
('lYO353o8xIGcAOASfHQHZR2oWjvceTEFhxteVzFy', NULL, '205.210.31.50', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2ZzbG5vb0VNYkd0V08xWnVTV291RDVKZHZBdnpqZlk3ZEZqMVl1diI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnR1YmFndXMubXkuaWQiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1772516011),
('NGAAaun7pTaP1jHFbKCcOq2vdNQsx4IMEsPI7R8y', NULL, '40.85.218.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3BvOVpWU2N1Y0x4Zk5vZ0x0ZndUejAxcm1nbjI3cTFxWjhpaVJaQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772461185),
('NZRpXtmYq25bUYsnN771JX9lqikt6XfWixK9HAWh', NULL, '167.71.166.171', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXJyYU1nWGtLSjFabEpudlYyYW55NjJLcmJrenhjZ2xGT2lOSXJrWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772538310),
('po3N1dXpLTu3JE1n06WiDYeGsk0AY36J0LHkfyUe', NULL, '185.191.171.14', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHJueWxnWllDU2hBTHd6eDhBbk5INlhzcjdEbjVJSnVMbTlGVkVVMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9mb3Jnb3QtcGFzc3dvcmQiO3M6NToicm91dGUiO3M6MTY6InBhc3N3b3JkLnJlcXVlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772587286),
('qb439Ub8QVp3wCYwH7cRSgqtoPwVxrLq62Fh9ZD0', NULL, '103.102.13.25', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXRhRGdmUUdiQ0k5Y09XUnVFVmVkenBMSHlCU3ZlbDhWZFZWRjdwVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772457519),
('QhakRxZ750Mim5qSa1pefYZ13I0eAJCOV2XxXk3T', NULL, '20.53.240.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0RkZ3B4ZUM1TWZLQXhqd0JVQTE3dFZWUnBQWk01R0lMTmc4b3JPbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772482296),
('QyOPbMD2tt4zLPHvxHQTrEnjMTjUslPWoUwBeS70', NULL, '20.151.114.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVktCM2VLRVUyQzgwR1Nud1ZHY2pXcFJHNUFNQmRoUlRxeUk3cTgxaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772474425),
('rqa1ksfQ3hFfxW7Fta2mlRH84sLb0CBtrhdqF2pB', NULL, '35.212.243.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BuiltWith/1.4; rb.gy/xprgqj) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNms5ZW9UaENjOWg3ZVE3b0hZQ3I3OXlMVlllNU1mSUZRUTRVSWQ2RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wcm9qZWN0cy9idWRnZXQtaW52ZXN0bWVudC1zeXN0ZW0iO3M6NToicm91dGUiO3M6MTM6InByb2plY3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772660861),
('rSlgArLnATyVzmppfqm8w81YPHcO8rEIF25Xdabr', NULL, '20.220.232.101', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTZseVJOSUFPeUxDMUFtQ1B0b2VtS3B6emxTbmgzS1lSSWxYNENNOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772655171),
('RXwzUTbWB7CfytXDV9TxOoo2XjabpJRCVdjeDBys', NULL, '181.177.86.29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0FBdmg0c1N6YmJ4NThZUWZreGxodDVoVXZ3emVoQngxM0FpY2VWSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772644652),
('SC5pWJVF54n7nlLGObVRgPOnnjw745m5QgGrZGM1', NULL, '20.214.137.177', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHVKdXp2bTRuM1lxaVMyNFVMYzdEbGo1MHFuSHJzTUVJbW1VUmlEdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772408697),
('tfbUYZqdrkhP5H8huwyeh2aEsDAK3RK7R5KwBPLs', NULL, '20.220.211.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVVtTzdtcE13a0lna2ZTOXZNMXNNNDJsOUNmNW9kQ0dHbGxaS2VUSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772556134),
('tK7FU23JPBLEsqiLzqaNvrBdtzADpe5QmHZZhtxG', NULL, '93.158.91.242', 'Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-A415F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/23.0 Chrome/115.0.0.0 Mobile Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlJ6Wll2N0RCZTFjamp2NlZacFhCbHV2SkJQRXpDTllrYXNSUTVFOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wcm9qZWN0cy9idWRnZXQtaW52ZXN0bWVudC1zeXN0ZW0iO3M6NToicm91dGUiO3M6MTM6InByb2plY3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772496231),
('TlPFYS4G2pktY3BTIl0UNmBlC7jNDPb6B0hDDMQW', NULL, '20.219.8.79', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEFEa0kxMzFXSlVjMW5wTVNpc2RzNmlXNkc5aloxb25EMk54M0trTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772388018),
('u0ztTGmqWWGFmEizuTxynJUswJ9L7102Qt6i8dEf', NULL, '85.208.96.207', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWhMU25ub0I2dlBEa3JlYWt5WDhGVFlEVTQ4bzE4Qms0aXhPandDUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1772362040),
('UkgBaEEdrggYv5slNGZSzNCAmHx6WIHgtcKqrUye', NULL, '68.183.188.187', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUtrdndYTjNreDhuaTlpbEhScHhZSHVCRENOb0llaWh3cTRsMGFnOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772337457),
('VMuu77qt1Tbe3aNdyL7YTIk0DAacQvWNgseyhFq4', NULL, '20.63.96.50', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODNkWXVBdVVTVTlETDlkOGhWUWRXSjZoQmhxMTBjWVhYOE43ODlCSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772486239),
('vtfWW5xgfEdVfXSEOVHP7AKSQ6EAvaX6Zzwndt8F', NULL, '103.102.13.25', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHJtbnNoTlNrb2lsendIQkJMaWpUSndJZVpGWmxqa1d2SE82ZU9GUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LnR1YmFndXMubXkuaWQiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1772475207),
('vYcPJUFSHIR5m2Lw6lmFu5suIrlxOEACpM7eAMe5', NULL, '34.56.210.20', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUJtSGlBMGlKQjZ5M1g2WG8zNDhORmhIZzVuU3REWDNsc2Q3REJSZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772553160),
('vYzlnQc0NMOqVIPtQZ7iBKVSWmf6B7BedG71BhY0', NULL, '152.32.168.34', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDY5ZU1ldUpHVkQwYzE1Nk9qVlV0Vmp2V25Bdm1ZVDBXRWxYcmxITSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772388851),
('WKvP5oGNqKa7p6L0mphciBiJWxSqnSNXGUkjx5Ku', NULL, '20.63.96.50', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2lWNWt3elVTWjI3bHl0WjU3MlBjU0h6N3B3ZGVveDZndVdCdG9qMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772486267),
('wO0J26it1xiiksffUIei4wUYAyv6EEv07fumuqS0', NULL, '103.214.23.106', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0V5OWQyYmo1aEE0QkF2R0Y3NFh2YnJxODNlMkJsNEhOdTFnbEZvSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772409494),
('wpbSVrRFsx63pEt5QXS8mlkwEA7QUC1SKF63FnHU', NULL, '20.63.102.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3BUWVFNb2dxa3FuYUllamV6Wm5La1hseXhwMUZtUWgyM2ZZR0dQUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772449138),
('xIThKSL87sN8roILYxARwAhcQRG3NEE8qtzGGG2Y', NULL, '20.219.8.79', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWZVODhvcDVUOVlzNWlGMEZvMVl4N3V0aHRIT2dmekRNc2R3c3pKaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772387999),
('xXQ0KEGcGtlfLrxavD29bvIbAWm6QyPUdEmqWSkq', NULL, '20.104.97.185', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU5ldzhUbDFhOUxZMkdkcWE3ZGJraG5kN2tQend2OFBEVEJ3ejdWeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772401170),
('yscj3FA4u9JFd0etCZTHog5kzi5ewaYIQe3SjWlT', NULL, '20.89.52.173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHYwNVNMRnRqRjUyVko5YzdOUXF6Y1VyV0c1R2xWTTFDT1k3ZXBsTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vdHViYWd1cy5teS5pZC9wdWJsaWMvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772399755),
('ZCMuMJg8Ctc57ePuYohf9EqWUhdsjJKP5Gtt5rkc', NULL, '192.36.226.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGNucFpjVDJwUTFROUxuSHlCTkVCZVo1TGhUYWF4Q0xBTkRUNU9qWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vdHViYWd1cy5teS5pZCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772582617);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `category_en` varchar(255) DEFAULT NULL,
  `items` text DEFAULT NULL,
  `items_en` text DEFAULT NULL,
  `type` enum('technical','soft') NOT NULL DEFAULT 'technical',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `category`, `category_en`, `items`, `items_en`, `type`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Web Development', NULL, 'HTML, CSS, JavaScript, PHP, LARAVEL', NULL, 'technical', 1, '2026-01-03 11:52:31', '2026-01-03 11:53:14'),
(2, 'Networking & System', NULL, 'Microtic Configuration, Linux Debian, LAN/WAN Setup, Computer Troubleshooting', NULL, 'technical', 2, '2026-01-03 11:54:20', '2026-01-03 11:54:20'),
(3, 'Hardware & Software Maintenance', 'Hardware & Software Maintenance', 'Perakitan dan instalasi hardware maupun software', 'Assembly and installation of hardware and software', 'technical', 3, '2026-01-03 11:56:53', '2026-01-03 14:34:45'),
(4, 'Database Management', NULL, 'MySQL, phpMyAdmin', NULL, 'technical', 4, '2026-01-03 12:00:29', '2026-01-03 12:00:29'),
(5, 'Office & Productivity Tools', 'Office & Productivity Tools', 'Microsoft Word, Excel (Termasuk pivot table & VBA Excel), PowerPoint', 'Microsoft Word, Excel (Includes Excel pivot table & VBA), Powerpoint', 'technical', 5, '2026-01-03 12:01:40', '2026-01-03 14:35:01'),
(6, 'Tools & Software', NULL, 'Visual Studio Code, Git, XAMPP, Postman, Laragon, WMS, SAP, Odoo', NULL, 'technical', 6, '2026-01-03 12:03:50', '2026-01-03 12:10:04'),
(7, 'Operational & Logistics', NULL, 'Costing, COGM Analysis, Inventory Management, Supply Chain Management, Forklift, Pallet Movers', NULL, 'technical', 7, '2026-01-03 12:09:10', '2026-01-03 12:16:41'),
(9, 'Komunikasi dan presentasi yang efektif', 'Effective communication and presentation', NULL, NULL, 'soft', 1, '2026-01-03 12:41:34', '2026-01-03 14:31:43'),
(10, 'Kerjasama tim', 'Teamwork', NULL, NULL, 'soft', 2, '2026-01-03 12:49:23', '2026-01-03 14:32:31'),
(11, 'Teliti', 'Detail-oriented', NULL, NULL, 'soft', 3, '2026-01-03 12:50:04', '2026-01-03 14:32:52'),
(12, 'Disiplin', 'Discipline', NULL, NULL, 'soft', 4, '2026-01-03 12:50:23', '2026-01-03 14:33:15'),
(13, 'Problem solving', NULL, NULL, NULL, 'soft', 6, '2026-01-03 12:50:39', '2026-01-03 12:50:39'),
(14, 'Kreativitas', 'Creativity', NULL, NULL, 'soft', 5, '2026-01-03 12:51:03', '2026-01-03 14:33:31'),
(15, 'Manajemen Waktu', 'Time Management', NULL, NULL, 'soft', 7, '2026-01-03 12:51:27', '2026-01-03 14:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `technologies`
--

CREATE TABLE `technologies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `technologies`
--

INSERT INTO `technologies` (`id`, `name`, `icon`, `order`, `is_active`, `featured`, `created_at`, `updated_at`) VALUES
(1, 'JavaScript', 'fab fa-js-square', 1, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:14:51'),
(2, 'PHP', 'fab fa-php', 2, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:15:03'),
(3, 'Python', 'fab fa-python', 3, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:15:11'),
(4, 'React', 'fab fa-react', 4, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:15:18'),
(5, 'Vue.js', 'fab fa-vuejs', 5, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:16:27'),
(6, 'Laravel', 'fab fa-laravel', 6, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:15:27'),
(7, 'Node.js', 'fab fa-node-js', 7, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:15:40'),
(8, 'Tailwind', 'fas fa-wind', 8, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:15:52'),
(9, 'Docker', 'fab fa-docker', 9, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:16:09'),
(10, 'MySQL', 'fas fa-database', 10, 1, 1, '2025-12-29 12:49:34', '2025-12-30 06:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@portfolio.com', NULL, '$2y$12$02W4LimAb8mhi/vyFrjwCukMdTtcI5vW6QhIkNyEQQiPsq.41X6HW', NULL, '2025-12-25 08:00:26', '2025-12-25 08:00:26'),
(2, 'Test Admin', 'test@example.com', NULL, '$2y$12$Jr/vg0LTsQllmrSVwzfS2eaZX48Ybv1AeCwVwhbAh/LYlLOJWO2gq', NULL, '2025-12-30 05:54:56', '2025-12-30 05:54:56'),
(3, 'Admin', 'admin@example.com', NULL, '$2y$12$VQZI.2uCG2iNmUpTP2Xnve1sQ5y.2a2y5b2Qt8aojw0z6yvNMZLLu', NULL, '2025-12-30 11:00:22', '2025-12-30 11:00:22'),
(4, 'Admin Test', 'admin@admin.com', NULL, '$2y$12$EG1NzBgN9Ye7vsYKEsrV1u8yROhHQ2GOG7EYwFoBCaSROTYmzw0ZS', NULL, '2026-01-03 15:23:35', '2026-01-03 15:23:35'),
(5, 'Admin Test', 'admintest@example.com', NULL, '$2y$12$yPI/4t.e3YPsla7tQ0UrR.IY0QusKFKvAsnStWTCoLOmVcLszma52', NULL, '2026-01-20 13:50:45', '2026-01-20 13:50:45'),
(6, 'Admin Test', 'admin@test.com', NULL, '$2y$12$XIAbybP6kjyegrKjr1t9mOIY1GQKPV49UdHT/.r0AgqbHJZ22znj.', NULL, '2026-01-21 21:45:48', '2026-01-21 21:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_logs`
--

CREATE TABLE `visitor_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_logs`
--

INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', NULL, NULL, NULL, '2025-12-30 10:46:32', '2025-12-30 10:46:32'),
(2, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', NULL, NULL, NULL, '2025-12-30 10:46:56', '2025-12-30 10:46:56'),
(3, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', NULL, NULL, NULL, '2025-12-30 10:48:57', '2025-12-30 10:48:57'),
(4, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', NULL, NULL, NULL, '2025-12-30 10:50:12', '2025-12-30 10:50:12'),
(5, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', NULL, NULL, NULL, '2025-12-30 10:50:14', '2025-12-30 10:50:14'),
(6, '127.0.0.1', 'http://127.0.0.1:8000/register', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', NULL, NULL, NULL, '2025-12-30 10:53:54', '2025-12-30 10:53:54'),
(7, '127.0.0.1', 'http://127.0.0.1:8000/register', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', NULL, NULL, NULL, '2025-12-30 11:00:20', '2025-12-30 11:00:20'),
(8, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', NULL, NULL, NULL, '2025-12-30 11:01:00', '2025-12-30 11:01:00'),
(9, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', NULL, NULL, NULL, '2025-12-30 11:02:59', '2025-12-30 11:02:59'),
(10, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2025-12-30 11:07:03', '2025-12-30 11:07:03'),
(11, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2025-12-30 12:13:29', '2025-12-30 12:13:29'),
(12, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2025-12-30 12:20:39', '2025-12-30 12:20:39'),
(13, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2025-12-30 12:23:14', '2025-12-30 12:23:14'),
(14, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2025-12-30 13:16:42', '2025-12-30 13:16:42'),
(15, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2025-12-30 13:32:34', '2025-12-30 13:32:34'),
(16, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2025-12-30 13:55:06', '2025-12-30 13:55:06'),
(17, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 05:22:40', '2026-01-03 05:22:40'),
(18, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 05:22:40', '2026-01-03 05:22:40'),
(19, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 05:26:21', '2026-01-03 05:26:21'),
(20, '127.0.0.1', 'http://127.0.0.1:8000', 'HEAD', 'curl/8.4.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 05:27:53', '2026-01-03 05:27:53'),
(21, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:36:15', '2026-01-03 11:36:15'),
(22, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:36:15', '2026-01-03 11:36:15'),
(23, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:36:19', '2026-01-03 11:36:19'),
(24, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:36:59', '2026-01-03 11:36:59'),
(25, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:38:14', '2026-01-03 11:38:14'),
(26, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:39:31', '2026-01-03 11:39:31'),
(27, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:40:35', '2026-01-03 11:40:35'),
(28, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:40:52', '2026-01-03 11:40:52'),
(29, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:41:03', '2026-01-03 11:41:03'),
(30, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:41:04', '2026-01-03 11:41:04'),
(31, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:41:22', '2026-01-03 11:41:22'),
(32, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:42:33', '2026-01-03 11:42:33'),
(33, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:43:40', '2026-01-03 11:43:40'),
(34, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:43:54', '2026-01-03 11:43:54'),
(35, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:44:55', '2026-01-03 11:44:55'),
(36, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:44:57', '2026-01-03 11:44:57'),
(37, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:45:10', '2026-01-03 11:45:10'),
(38, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:46:00', '2026-01-03 11:46:00'),
(39, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:47:44', '2026-01-03 11:47:44'),
(40, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:47:54', '2026-01-03 11:47:54'),
(41, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:47:55', '2026-01-03 11:47:55'),
(42, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:49:57', '2026-01-03 11:49:57'),
(43, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:49:59', '2026-01-03 11:49:59'),
(44, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:52:36', '2026-01-03 11:52:36'),
(45, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:54:24', '2026-01-03 11:54:24'),
(46, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:55:29', '2026-01-03 11:55:29'),
(47, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:55:31', '2026-01-03 11:55:31'),
(48, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:57:20', '2026-01-03 11:57:20'),
(49, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 11:59:21', '2026-01-03 11:59:21'),
(50, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:02:33', '2026-01-03 12:02:33'),
(51, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:03:54', '2026-01-03 12:03:54'),
(52, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:06:23', '2026-01-03 12:06:23'),
(53, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:07:07', '2026-01-03 12:07:07'),
(54, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:07:24', '2026-01-03 12:07:24'),
(55, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:17:11', '2026-01-03 12:17:11'),
(56, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:19:15', '2026-01-03 12:19:15'),
(57, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:19:47', '2026-01-03 12:19:47'),
(58, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:20:24', '2026-01-03 12:20:24'),
(59, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:24:12', '2026-01-03 12:24:12'),
(60, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:24:26', '2026-01-03 12:24:26'),
(61, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:24:51', '2026-01-03 12:24:51'),
(62, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:25:11', '2026-01-03 12:25:11'),
(63, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:25:12', '2026-01-03 12:25:12'),
(64, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:28:17', '2026-01-03 12:28:17'),
(65, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:29:55', '2026-01-03 12:29:55'),
(66, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:30:07', '2026-01-03 12:30:07'),
(67, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:30:09', '2026-01-03 12:30:09'),
(68, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:30:20', '2026-01-03 12:30:20'),
(69, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:30:22', '2026-01-03 12:30:22'),
(70, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:30:39', '2026-01-03 12:30:39'),
(71, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:30:48', '2026-01-03 12:30:48'),
(72, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:31:07', '2026-01-03 12:31:07'),
(73, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:32:06', '2026-01-03 12:32:06'),
(74, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:32:23', '2026-01-03 12:32:23'),
(75, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:32:25', '2026-01-03 12:32:25'),
(76, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:37:46', '2026-01-03 12:37:46'),
(77, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:37:59', '2026-01-03 12:37:59'),
(78, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:38:11', '2026-01-03 12:38:11'),
(79, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:38:24', '2026-01-03 12:38:24'),
(80, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:39:57', '2026-01-03 12:39:57'),
(81, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:40:17', '2026-01-03 12:40:17'),
(82, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:41:38', '2026-01-03 12:41:38'),
(83, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:41:52', '2026-01-03 12:41:52'),
(84, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:44:48', '2026-01-03 12:44:48'),
(85, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:45:07', '2026-01-03 12:45:07'),
(86, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:45:11', '2026-01-03 12:45:11'),
(87, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:45:51', '2026-01-03 12:45:51'),
(88, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:47:50', '2026-01-03 12:47:50'),
(89, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:47:53', '2026-01-03 12:47:53'),
(90, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:48:17', '2026-01-03 12:48:17'),
(91, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:51:30', '2026-01-03 12:51:30'),
(92, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:53:18', '2026-01-03 12:53:18'),
(93, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 12:57:45', '2026-01-03 12:57:45'),
(94, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:00:36', '2026-01-03 13:00:36'),
(95, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:01:14', '2026-01-03 13:01:14'),
(96, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:01:29', '2026-01-03 13:01:29'),
(97, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:05:42', '2026-01-03 13:05:42'),
(98, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:08:08', '2026-01-03 13:08:08'),
(99, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:29:23', '2026-01-03 13:29:23'),
(100, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:29:23', '2026-01-03 13:29:23'),
(101, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:29:24', '2026-01-03 13:29:24'),
(102, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:36:17', '2026-01-03 13:36:17'),
(103, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:38:38', '2026-01-03 13:38:38'),
(104, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:40:58', '2026-01-03 13:40:58'),
(105, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:41:47', '2026-01-03 13:41:47'),
(106, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:42:06', '2026-01-03 13:42:06'),
(107, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:43:33', '2026-01-03 13:43:33'),
(108, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:43:42', '2026-01-03 13:43:42'),
(109, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:45:12', '2026-01-03 13:45:12'),
(110, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:46:03', '2026-01-03 13:46:03'),
(111, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:49:04', '2026-01-03 13:49:04'),
(112, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:49:06', '2026-01-03 13:49:06'),
(113, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:49:45', '2026-01-03 13:49:45'),
(114, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:54:21', '2026-01-03 13:54:21'),
(115, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:54:24', '2026-01-03 13:54:24'),
(116, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:54:50', '2026-01-03 13:54:50'),
(117, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:55:32', '2026-01-03 13:55:32'),
(118, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:55:36', '2026-01-03 13:55:36'),
(119, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:55:37', '2026-01-03 13:55:37'),
(120, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:57:27', '2026-01-03 13:57:27'),
(121, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 13:58:56', '2026-01-03 13:58:56'),
(122, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:18:38', '2026-01-03 14:18:38'),
(123, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:20:57', '2026-01-03 14:20:57'),
(124, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:24:05', '2026-01-03 14:24:05'),
(125, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:24:05', '2026-01-03 14:24:05'),
(126, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:24:23', '2026-01-03 14:24:23'),
(127, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:24:48', '2026-01-03 14:24:48'),
(128, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:25:07', '2026-01-03 14:25:07'),
(129, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:26:33', '2026-01-03 14:26:33'),
(130, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:27:02', '2026-01-03 14:27:02'),
(131, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:30:45', '2026-01-03 14:30:45'),
(132, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:31:09', '2026-01-03 14:31:09'),
(133, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:33:54', '2026-01-03 14:33:54'),
(134, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:35:15', '2026-01-03 14:35:15'),
(135, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:39:19', '2026-01-03 14:39:19'),
(136, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:41:54', '2026-01-03 14:41:54'),
(137, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:42:11', '2026-01-03 14:42:11'),
(138, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:42:26', '2026-01-03 14:42:26'),
(139, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:42:37', '2026-01-03 14:42:37'),
(140, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:44:32', '2026-01-03 14:44:32'),
(141, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:47:46', '2026-01-03 14:47:46'),
(142, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:53:18', '2026-01-03 14:53:18'),
(143, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:53:31', '2026-01-03 14:53:31'),
(144, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:53:45', '2026-01-03 14:53:45'),
(145, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:54:06', '2026-01-03 14:54:06'),
(146, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:54:26', '2026-01-03 14:54:26'),
(147, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:54:34', '2026-01-03 14:54:34'),
(148, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:55:16', '2026-01-03 14:55:16'),
(149, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:55:41', '2026-01-03 14:55:41'),
(150, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:56:13', '2026-01-03 14:56:13'),
(151, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:57:23', '2026-01-03 14:57:23'),
(152, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 14:58:03', '2026-01-03 14:58:03'),
(153, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:01:42', '2026-01-03 15:01:42'),
(154, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:02:48', '2026-01-03 15:02:48'),
(155, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:03:12', '2026-01-03 15:03:12'),
(156, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:03:47', '2026-01-03 15:03:47'),
(157, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:04:04', '2026-01-03 15:04:04'),
(158, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:05:06', '2026-01-03 15:05:06'),
(159, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:05:32', '2026-01-03 15:05:32'),
(160, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:05:47', '2026-01-03 15:05:47'),
(161, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:06:47', '2026-01-03 15:06:47'),
(162, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:08:25', '2026-01-03 15:08:25'),
(163, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:08:28', '2026-01-03 15:08:28'),
(164, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:09:55', '2026-01-03 15:09:55'),
(165, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:10:09', '2026-01-03 15:10:09'),
(166, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:10:24', '2026-01-03 15:10:24'),
(167, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:10:40', '2026-01-03 15:10:40'),
(168, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:10:55', '2026-01-03 15:10:55'),
(169, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:11:11', '2026-01-03 15:11:11'),
(170, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:11:25', '2026-01-03 15:11:25'),
(171, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:11:43', '2026-01-03 15:11:43'),
(172, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:12:17', '2026-01-03 15:12:17'),
(173, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:13:09', '2026-01-03 15:13:09'),
(174, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:14:11', '2026-01-03 15:14:11'),
(175, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:14:12', '2026-01-03 15:14:12'),
(176, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:16:29', '2026-01-03 15:16:29'),
(177, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:16:30', '2026-01-03 15:16:30'),
(178, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:17:02', '2026-01-03 15:17:02'),
(179, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:17:04', '2026-01-03 15:17:04'),
(180, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:17:30', '2026-01-03 15:17:30'),
(181, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:17:42', '2026-01-03 15:17:42'),
(182, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:17:44', '2026-01-03 15:17:44'),
(183, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:18:23', '2026-01-03 15:18:23'),
(184, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:18:25', '2026-01-03 15:18:25'),
(185, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:18:54', '2026-01-03 15:18:54'),
(186, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:18:56', '2026-01-03 15:18:56'),
(187, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:19:24', '2026-01-03 15:19:24'),
(188, '127.0.0.1', 'http://127.0.0.1:8000/register', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:20:46', '2026-01-03 15:20:46'),
(189, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:21:53', '2026-01-03 15:21:53');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(190, '127.0.0.1', 'http://127.0.0.1:8000/register', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:23:18', '2026-01-03 15:23:18'),
(191, '127.0.0.1', 'http://127.0.0.1:8000/register', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:23:35', '2026-01-03 15:23:35'),
(192, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:24:24', '2026-01-03 15:24:24'),
(193, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:27:29', '2026-01-03 15:27:29'),
(194, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:27:47', '2026-01-03 15:27:47'),
(195, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:29:05', '2026-01-03 15:29:05'),
(196, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:29:22', '2026-01-03 15:29:22'),
(197, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:25', '2026-01-03 15:36:25'),
(198, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:25', '2026-01-03 15:36:25'),
(199, '127.0.0.1', 'http://127.0.0.1:8000/register', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:26', '2026-01-03 15:36:26'),
(200, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:27', '2026-01-03 15:36:27'),
(201, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:28', '2026-01-03 15:36:28'),
(202, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:28', '2026-01-03 15:36:28'),
(203, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:29', '2026-01-03 15:36:29'),
(204, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:29', '2026-01-03 15:36:29'),
(205, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:30', '2026-01-03 15:36:30'),
(206, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:44', '2026-01-03 15:36:44'),
(207, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:45', '2026-01-03 15:36:45'),
(208, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:46', '2026-01-03 15:36:46'),
(209, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:46', '2026-01-03 15:36:46'),
(210, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:47', '2026-01-03 15:36:47'),
(211, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:36:47', '2026-01-03 15:36:47'),
(212, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:09', '2026-01-03 15:37:09'),
(213, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:09', '2026-01-03 15:37:09'),
(214, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:11', '2026-01-03 15:37:11'),
(215, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:18', '2026-01-03 15:37:18'),
(216, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:25', '2026-01-03 15:37:25'),
(217, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:55', '2026-01-03 15:37:55'),
(218, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:55', '2026-01-03 15:37:55'),
(219, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:56', '2026-01-03 15:37:56'),
(220, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:56', '2026-01-03 15:37:56'),
(221, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:57', '2026-01-03 15:37:57'),
(222, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:58', '2026-01-03 15:37:58'),
(223, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:37:59', '2026-01-03 15:37:59'),
(224, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:00', '2026-01-03 15:38:00'),
(225, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:01', '2026-01-03 15:38:01'),
(226, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:02', '2026-01-03 15:38:02'),
(227, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:41', '2026-01-03 15:38:41'),
(228, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:41', '2026-01-03 15:38:41'),
(229, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:42', '2026-01-03 15:38:42'),
(230, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:42', '2026-01-03 15:38:42'),
(231, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:43', '2026-01-03 15:38:43'),
(232, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:45', '2026-01-03 15:38:45'),
(233, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:38:46', '2026-01-03 15:38:46'),
(234, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:25', '2026-01-03 15:43:25'),
(235, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:26', '2026-01-03 15:43:26'),
(236, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:26', '2026-01-03 15:43:26'),
(237, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:26', '2026-01-03 15:43:26'),
(238, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:27', '2026-01-03 15:43:27'),
(239, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:27', '2026-01-03 15:43:27'),
(240, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:28', '2026-01-03 15:43:28'),
(241, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:50', '2026-01-03 15:43:50'),
(242, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:51', '2026-01-03 15:43:51'),
(243, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:51', '2026-01-03 15:43:51'),
(244, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:52', '2026-01-03 15:43:52'),
(245, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:52', '2026-01-03 15:43:52'),
(246, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:53', '2026-01-03 15:43:53'),
(247, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:43:53', '2026-01-03 15:43:53'),
(248, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:51:47', '2026-01-03 15:51:47'),
(249, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:51:47', '2026-01-03 15:51:47'),
(250, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:51:47', '2026-01-03 15:51:47'),
(251, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:51:48', '2026-01-03 15:51:48'),
(252, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:51:48', '2026-01-03 15:51:48'),
(253, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:51:49', '2026-01-03 15:51:49'),
(254, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:51:49', '2026-01-03 15:51:49'),
(255, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:52:16', '2026-01-03 15:52:16'),
(256, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:52:17', '2026-01-03 15:52:17'),
(257, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:52:17', '2026-01-03 15:52:17'),
(258, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:52:18', '2026-01-03 15:52:18'),
(259, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:52:18', '2026-01-03 15:52:18'),
(260, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:52:19', '2026-01-03 15:52:19'),
(261, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 15:52:19', '2026-01-03 15:52:19'),
(262, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:03:10', '2026-01-03 16:03:10'),
(263, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:03:11', '2026-01-03 16:03:11'),
(264, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:03:11', '2026-01-03 16:03:11'),
(265, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:03:12', '2026-01-03 16:03:12'),
(266, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:03:12', '2026-01-03 16:03:12'),
(267, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:03:12', '2026-01-03 16:03:12'),
(268, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:05:46', '2026-01-03 16:05:46'),
(269, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:06:27', '2026-01-03 16:06:27'),
(270, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:13:33', '2026-01-03 16:13:33'),
(271, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:13:33', '2026-01-03 16:13:33'),
(272, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:13:33', '2026-01-03 16:13:33'),
(273, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:13:34', '2026-01-03 16:13:34'),
(274, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:13:35', '2026-01-03 16:13:35'),
(275, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:13:35', '2026-01-03 16:13:35'),
(276, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:13:36', '2026-01-03 16:13:36'),
(277, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:14:26', '2026-01-03 16:14:26'),
(278, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:14:27', '2026-01-03 16:14:27'),
(279, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:14:27', '2026-01-03 16:14:27'),
(280, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:14:28', '2026-01-03 16:14:28'),
(281, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:14:29', '2026-01-03 16:14:29'),
(282, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:14:29', '2026-01-03 16:14:29'),
(283, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:14:30', '2026-01-03 16:14:30'),
(284, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:15:06', '2026-01-03 16:15:06'),
(285, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:15:07', '2026-01-03 16:15:07'),
(286, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:15:07', '2026-01-03 16:15:07'),
(287, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:15:08', '2026-01-03 16:15:08'),
(288, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:15:08', '2026-01-03 16:15:08'),
(289, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:15:09', '2026-01-03 16:15:09'),
(290, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:15:10', '2026-01-03 16:15:10'),
(291, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:19:34', '2026-01-03 16:19:34'),
(292, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:19:34', '2026-01-03 16:19:34'),
(293, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:19:35', '2026-01-03 16:19:35'),
(294, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:19:35', '2026-01-03 16:19:35'),
(295, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:19:37', '2026-01-03 16:19:37'),
(296, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:19:37', '2026-01-03 16:19:37'),
(297, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:23:55', '2026-01-03 16:23:55'),
(298, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:23:55', '2026-01-03 16:23:55'),
(299, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:23:56', '2026-01-03 16:23:56'),
(300, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:23:56', '2026-01-03 16:23:56'),
(301, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:23:56', '2026-01-03 16:23:56'),
(302, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:23:57', '2026-01-03 16:23:57'),
(303, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:26:51', '2026-01-03 16:26:51'),
(304, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:26:51', '2026-01-03 16:26:51'),
(305, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:26:52', '2026-01-03 16:26:52'),
(306, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:26:52', '2026-01-03 16:26:52'),
(307, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:26:53', '2026-01-03 16:26:53'),
(308, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:26:53', '2026-01-03 16:26:53'),
(309, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:29:21', '2026-01-03 16:29:21'),
(310, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:29:21', '2026-01-03 16:29:21'),
(311, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:29:21', '2026-01-03 16:29:21'),
(312, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:29:22', '2026-01-03 16:29:22'),
(313, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:29:22', '2026-01-03 16:29:22'),
(314, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:29:23', '2026-01-03 16:29:23'),
(315, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:33:22', '2026-01-03 16:33:22'),
(316, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:33:22', '2026-01-03 16:33:22'),
(317, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:33:22', '2026-01-03 16:33:22'),
(318, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:33:23', '2026-01-03 16:33:23'),
(319, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:33:23', '2026-01-03 16:33:23'),
(320, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:33:24', '2026-01-03 16:33:24'),
(321, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:36:20', '2026-01-03 16:36:20'),
(322, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:36:20', '2026-01-03 16:36:20'),
(323, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:36:20', '2026-01-03 16:36:20'),
(324, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:36:21', '2026-01-03 16:36:21'),
(325, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:36:21', '2026-01-03 16:36:21'),
(326, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-03 16:36:21', '2026-01-03 16:36:21'),
(327, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-04 20:55:02', '2026-01-04 20:55:02'),
(328, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-04 20:55:02', '2026-01-04 20:55:02'),
(329, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-07 03:55:40', '2026-01-07 03:55:40'),
(330, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-07 04:45:08', '2026-01-07 04:45:08'),
(331, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 03:46:47', '2026-01-08 03:46:47'),
(332, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 04:36:26', '2026-01-08 04:36:26'),
(333, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 04:40:41', '2026-01-08 04:40:41'),
(334, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 04:40:59', '2026-01-08 04:40:59'),
(335, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 04:40:59', '2026-01-08 04:40:59'),
(336, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 04:41:17', '2026-01-08 04:41:17'),
(337, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 04:41:41', '2026-01-08 04:41:41'),
(338, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 04:42:31', '2026-01-08 04:42:31'),
(339, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-08 04:46:15', '2026-01-08 04:46:15'),
(340, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 21:49:30', '2026-01-19 21:49:30'),
(341, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 21:49:30', '2026-01-19 21:49:30'),
(342, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 21:49:34', '2026-01-19 21:49:34'),
(343, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:26:35', '2026-01-19 23:26:35'),
(344, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:26:35', '2026-01-19 23:26:35'),
(345, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:27:06', '2026-01-19 23:27:06'),
(346, '127.0.0.1', 'http://127.0.0.1:8001/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:27:15', '2026-01-19 23:27:15'),
(347, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:27:16', '2026-01-19 23:27:16'),
(348, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:27:26', '2026-01-19 23:27:26'),
(349, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:27:40', '2026-01-19 23:27:40'),
(350, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:27:50', '2026-01-19 23:27:50'),
(351, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:27:56', '2026-01-19 23:27:56'),
(352, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:27:59', '2026-01-19 23:27:59'),
(353, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:28:08', '2026-01-19 23:28:08'),
(354, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:28:12', '2026-01-19 23:28:12'),
(355, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:31:28', '2026-01-19 23:31:28'),
(356, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-19 23:31:55', '2026-01-19 23:31:55'),
(357, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:02:27', '2026-01-20 00:02:27'),
(358, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:02:27', '2026-01-20 00:02:27'),
(359, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:02:29', '2026-01-20 00:02:29'),
(360, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:02:44', '2026-01-20 00:02:44'),
(361, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:04:02', '2026-01-20 00:04:02'),
(362, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:04:02', '2026-01-20 00:04:02'),
(363, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:04:04', '2026-01-20 00:04:04'),
(364, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:04:32', '2026-01-20 00:04:32'),
(365, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:04:34', '2026-01-20 00:04:34'),
(366, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:04:36', '2026-01-20 00:04:36'),
(367, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:05:22', '2026-01-20 00:05:22'),
(368, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:08:06', '2026-01-20 00:08:06'),
(369, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:09:16', '2026-01-20 00:09:16'),
(370, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:16:12', '2026-01-20 00:16:12'),
(371, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:16:15', '2026-01-20 00:16:15'),
(372, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:18:39', '2026-01-20 00:18:39'),
(373, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:18:41', '2026-01-20 00:18:41'),
(374, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:26:02', '2026-01-20 00:26:02'),
(375, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Go-http-client/1.1', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:28:07', '2026-01-20 00:28:07'),
(376, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:33:06', '2026-01-20 00:33:06'),
(377, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:34:21', '2026-01-20 00:34:21'),
(378, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:34:50', '2026-01-20 00:34:50'),
(379, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:37:27', '2026-01-20 00:37:27'),
(380, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:38:08', '2026-01-20 00:38:08'),
(381, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:45:48', '2026-01-20 00:45:48');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(382, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:50:33', '2026-01-20 00:50:33'),
(383, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:50:44', '2026-01-20 00:50:44'),
(384, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:54:04', '2026-01-20 00:54:04'),
(385, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 00:56:54', '2026-01-20 00:56:54'),
(386, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:05:48', '2026-01-20 01:05:48'),
(387, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:06:14', '2026-01-20 01:06:14'),
(388, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:06:50', '2026-01-20 01:06:50'),
(389, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:07:52', '2026-01-20 01:07:52'),
(390, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:09:44', '2026-01-20 01:09:44'),
(391, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:10:37', '2026-01-20 01:10:37'),
(392, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:11:43', '2026-01-20 01:11:43'),
(393, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:12:36', '2026-01-20 01:12:36'),
(394, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:15:22', '2026-01-20 01:15:22'),
(395, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:15:49', '2026-01-20 01:15:49'),
(396, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:16:35', '2026-01-20 01:16:35'),
(397, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:16:36', '2026-01-20 01:16:36'),
(398, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:16:42', '2026-01-20 01:16:42'),
(399, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:17:48', '2026-01-20 01:17:48'),
(400, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:18:06', '2026-01-20 01:18:06'),
(401, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:19:06', '2026-01-20 01:19:06'),
(402, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:22:45', '2026-01-20 01:22:45'),
(403, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:24:32', '2026-01-20 01:24:32'),
(404, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:25:10', '2026-01-20 01:25:10'),
(405, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:26:47', '2026-01-20 01:26:47'),
(406, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:27:51', '2026-01-20 01:27:51'),
(407, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:29:58', '2026-01-20 01:29:58'),
(408, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:30:40', '2026-01-20 01:30:40'),
(409, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:41:51', '2026-01-20 01:41:51'),
(410, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:41:53', '2026-01-20 01:41:53'),
(411, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 01:56:24', '2026-01-20 01:56:24'),
(412, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:00:57', '2026-01-20 02:00:57'),
(413, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:03:54', '2026-01-20 02:03:54'),
(414, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:07:13', '2026-01-20 02:07:13'),
(415, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:08:44', '2026-01-20 02:08:44'),
(416, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:09:08', '2026-01-20 02:09:08'),
(417, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:09:37', '2026-01-20 02:09:37'),
(418, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:12:03', '2026-01-20 02:12:03'),
(419, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:15:12', '2026-01-20 02:15:12'),
(420, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:24:31', '2026-01-20 02:24:31'),
(421, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:40:40', '2026-01-20 02:40:40'),
(422, '127.0.0.1', 'http://127.0.0.1:8001/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 02:48:12', '2026-01-20 02:48:12'),
(423, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 12:38:33', '2026-01-20 12:38:33'),
(424, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:14:56', '2026-01-20 13:14:56'),
(425, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:15:01', '2026-01-20 13:15:01'),
(426, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:15:02', '2026-01-20 13:15:02'),
(427, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:15:07', '2026-01-20 13:15:07'),
(428, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:15:07', '2026-01-20 13:15:07'),
(429, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:15:50', '2026-01-20 13:15:50'),
(430, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:15:55', '2026-01-20 13:15:55'),
(431, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:16:52', '2026-01-20 13:16:52'),
(432, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:17:34', '2026-01-20 13:17:34'),
(433, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:21:03', '2026-01-20 13:21:03'),
(434, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:21:52', '2026-01-20 13:21:52'),
(435, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:22:19', '2026-01-20 13:22:19'),
(436, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:23:12', '2026-01-20 13:23:12'),
(437, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:25:35', '2026-01-20 13:25:35'),
(438, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:36:58', '2026-01-20 13:36:58'),
(439, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:38:11', '2026-01-20 13:38:11'),
(440, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:38:14', '2026-01-20 13:38:14'),
(441, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:38:28', '2026-01-20 13:38:28'),
(442, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:38:28', '2026-01-20 13:38:28'),
(443, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:39:02', '2026-01-20 13:39:02'),
(444, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:47:03', '2026-01-20 13:47:03'),
(445, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:47:53', '2026-01-20 13:47:53'),
(446, '127.0.0.1', 'http://127.0.0.1:8000/register', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:48:10', '2026-01-20 13:48:10'),
(447, '127.0.0.1', 'http://127.0.0.1:8000/register', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:50:44', '2026-01-20 13:50:44'),
(448, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:53:21', '2026-01-20 13:53:21'),
(449, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:54:24', '2026-01-20 13:54:24'),
(450, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:54:45', '2026-01-20 13:54:45'),
(451, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 13:55:10', '2026-01-20 13:55:10'),
(452, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:22:50', '2026-01-20 14:22:50'),
(453, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:22:50', '2026-01-20 14:22:50'),
(454, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:22:51', '2026-01-20 14:22:51'),
(455, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:22:52', '2026-01-20 14:22:52'),
(456, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:22:52', '2026-01-20 14:22:52'),
(457, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:23:54', '2026-01-20 14:23:54'),
(458, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:23:54', '2026-01-20 14:23:54'),
(459, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:24:22', '2026-01-20 14:24:22'),
(460, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:24:22', '2026-01-20 14:24:22'),
(461, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:24:22', '2026-01-20 14:24:22'),
(462, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:24:23', '2026-01-20 14:24:23'),
(463, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:24:24', '2026-01-20 14:24:24'),
(464, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:24:24', '2026-01-20 14:24:24'),
(465, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:25:42', '2026-01-20 14:25:42'),
(466, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:25:42', '2026-01-20 14:25:42'),
(467, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:28:17', '2026-01-20 14:28:17'),
(468, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:28:17', '2026-01-20 14:28:17'),
(469, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:28:19', '2026-01-20 14:28:19'),
(470, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:28:22', '2026-01-20 14:28:22'),
(471, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:28:35', '2026-01-20 14:28:35'),
(472, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:28:44', '2026-01-20 14:28:44'),
(473, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:28:56', '2026-01-20 14:28:56'),
(474, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:31:15', '2026-01-20 14:31:15'),
(475, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:31:53', '2026-01-20 14:31:53'),
(476, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:31:53', '2026-01-20 14:31:53'),
(477, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:31:54', '2026-01-20 14:31:54'),
(478, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:32:28', '2026-01-20 14:32:28'),
(479, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:32:29', '2026-01-20 14:32:29'),
(480, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:32:29', '2026-01-20 14:32:29'),
(481, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:05', '2026-01-20 14:33:05'),
(482, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:05', '2026-01-20 14:33:05'),
(483, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:05', '2026-01-20 14:33:05'),
(484, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:37', '2026-01-20 14:33:37'),
(485, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:38', '2026-01-20 14:33:38'),
(486, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:38', '2026-01-20 14:33:38'),
(487, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:39', '2026-01-20 14:33:39'),
(488, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:40', '2026-01-20 14:33:40'),
(489, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:40', '2026-01-20 14:33:40'),
(490, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:41', '2026-01-20 14:33:41'),
(491, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:41', '2026-01-20 14:33:41'),
(492, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:33:41', '2026-01-20 14:33:41'),
(493, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:34:35', '2026-01-20 14:34:35'),
(494, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:45:45', '2026-01-20 14:45:45'),
(495, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:46:10', '2026-01-20 14:46:10'),
(496, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:46:26', '2026-01-20 14:46:26'),
(497, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:46:39', '2026-01-20 14:46:39'),
(498, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:46:41', '2026-01-20 14:46:41'),
(499, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:48:46', '2026-01-20 14:48:46'),
(500, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:48:47', '2026-01-20 14:48:47'),
(501, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:48:48', '2026-01-20 14:48:48'),
(502, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:50:40', '2026-01-20 14:50:40'),
(503, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:50:52', '2026-01-20 14:50:52'),
(504, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:50:58', '2026-01-20 14:50:58'),
(505, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:52:56', '2026-01-20 14:52:56'),
(506, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 14:58:14', '2026-01-20 14:58:14'),
(507, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:01:55', '2026-01-20 15:01:55'),
(508, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:02:36', '2026-01-20 15:02:36'),
(509, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:03:05', '2026-01-20 15:03:05'),
(510, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:04:58', '2026-01-20 15:04:58'),
(511, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:04:58', '2026-01-20 15:04:58'),
(512, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:04:59', '2026-01-20 15:04:59'),
(513, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:04:59', '2026-01-20 15:04:59'),
(514, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:05:00', '2026-01-20 15:05:00'),
(515, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:05:00', '2026-01-20 15:05:00'),
(516, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:05:33', '2026-01-20 15:05:33'),
(517, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:09:14', '2026-01-20 15:09:14'),
(518, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:11:48', '2026-01-20 15:11:48'),
(519, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:12:17', '2026-01-20 15:12:17'),
(520, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:12:18', '2026-01-20 15:12:18'),
(521, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:12:23', '2026-01-20 15:12:23'),
(522, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:09', '2026-01-20 15:14:09'),
(523, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:10', '2026-01-20 15:14:10'),
(524, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:10', '2026-01-20 15:14:10'),
(525, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:11', '2026-01-20 15:14:11'),
(526, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:12', '2026-01-20 15:14:12'),
(527, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:12', '2026-01-20 15:14:12'),
(528, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:13', '2026-01-20 15:14:13'),
(529, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:13', '2026-01-20 15:14:13'),
(530, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:14', '2026-01-20 15:14:14'),
(531, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:14:41', '2026-01-20 15:14:41'),
(532, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:18:50', '2026-01-20 15:18:50'),
(533, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:22:14', '2026-01-20 15:22:14'),
(534, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:26:46', '2026-01-20 15:26:46'),
(535, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:50:23', '2026-01-20 15:50:23'),
(536, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:58:35', '2026-01-20 15:58:35'),
(537, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 15:59:20', '2026-01-20 15:59:20'),
(538, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:01:32', '2026-01-20 16:01:32'),
(539, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:01:48', '2026-01-20 16:01:48'),
(540, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:04:50', '2026-01-20 16:04:50'),
(541, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:06:30', '2026-01-20 16:06:30'),
(542, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:07:56', '2026-01-20 16:07:56'),
(543, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:08:05', '2026-01-20 16:08:05'),
(544, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:08:08', '2026-01-20 16:08:08'),
(545, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:08:10', '2026-01-20 16:08:10'),
(546, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:08:15', '2026-01-20 16:08:15'),
(547, '127.0.0.1', 'http://127.0.0.1:8000/company-profile', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:08:26', '2026-01-20 16:08:26'),
(548, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:08:28', '2026-01-20 16:08:28'),
(549, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:10:21', '2026-01-20 16:10:21'),
(550, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:10:22', '2026-01-20 16:10:22'),
(551, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:11:14', '2026-01-20 16:11:14'),
(552, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:11:17', '2026-01-20 16:11:17'),
(553, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:11:18', '2026-01-20 16:11:18'),
(554, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:11:18', '2026-01-20 16:11:18'),
(555, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:11:19', '2026-01-20 16:11:19'),
(556, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:11:19', '2026-01-20 16:11:19'),
(557, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:12:24', '2026-01-20 16:12:24'),
(558, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:15:12', '2026-01-20 16:15:12'),
(559, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:15:15', '2026-01-20 16:15:15'),
(560, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:15:38', '2026-01-20 16:15:38'),
(561, '127.0.0.1', 'http://127.0.0.1:8000/organization-structure', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:16:11', '2026-01-20 16:16:11'),
(562, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:16:25', '2026-01-20 16:16:25'),
(563, '127.0.0.1', 'http://127.0.0.1:8000/committee-activities', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:17:25', '2026-01-20 16:17:25'),
(564, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:17:25', '2026-01-20 16:17:25'),
(565, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:17:26', '2026-01-20 16:17:26'),
(566, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:17:27', '2026-01-20 16:17:27');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(567, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:17:41', '2026-01-20 16:17:41'),
(568, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:17:41', '2026-01-20 16:17:41'),
(569, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:17:42', '2026-01-20 16:17:42'),
(570, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:22:23', '2026-01-20 16:22:23'),
(571, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:22:41', '2026-01-20 16:22:41'),
(572, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:27:23', '2026-01-20 16:27:23'),
(573, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:16', '2026-01-20 16:31:16'),
(574, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:16', '2026-01-20 16:31:16'),
(575, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:17', '2026-01-20 16:31:17'),
(576, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:18', '2026-01-20 16:31:18'),
(577, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:19', '2026-01-20 16:31:19'),
(578, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:43', '2026-01-20 16:31:43'),
(579, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:43', '2026-01-20 16:31:43'),
(580, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:43', '2026-01-20 16:31:43'),
(581, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:44', '2026-01-20 16:31:44'),
(582, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:46', '2026-01-20 16:31:46'),
(583, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:47', '2026-01-20 16:31:47'),
(584, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:47', '2026-01-20 16:31:47'),
(585, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:48', '2026-01-20 16:31:48'),
(586, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:31:48', '2026-01-20 16:31:48'),
(587, '127.0.0.1', 'http://localhost:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:32:07', '2026-01-20 16:32:07'),
(588, '127.0.0.1', 'http://localhost:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:32:53', '2026-01-20 16:32:53'),
(589, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:46:07', '2026-01-20 16:46:07'),
(590, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:49:40', '2026-01-20 16:49:40'),
(591, '127.0.0.1', 'http://localhost:8000/?t=123456', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:51:02', '2026-01-20 16:51:02'),
(592, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 16:59:24', '2026-01-20 16:59:24'),
(593, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 17:00:54', '2026-01-20 17:00:54'),
(594, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 17:01:43', '2026-01-20 17:01:43'),
(595, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 17:14:21', '2026-01-20 17:14:21'),
(596, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 17:19:39', '2026-01-20 17:19:39'),
(597, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:08:57', '2026-01-20 18:08:57'),
(598, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:08:58', '2026-01-20 18:08:58'),
(599, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:09:10', '2026-01-20 18:09:10'),
(600, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:16:21', '2026-01-20 18:16:21'),
(601, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:16:35', '2026-01-20 18:16:35'),
(602, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:17:28', '2026-01-20 18:17:28'),
(603, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:18:34', '2026-01-20 18:18:34'),
(604, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:19:10', '2026-01-20 18:19:10'),
(605, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:19:40', '2026-01-20 18:19:40'),
(606, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:21:24', '2026-01-20 18:21:24'),
(607, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:25:02', '2026-01-20 18:25:02'),
(608, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:27:14', '2026-01-20 18:27:14'),
(609, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:27:33', '2026-01-20 18:27:33'),
(610, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:34:57', '2026-01-20 18:34:57'),
(611, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:34:57', '2026-01-20 18:34:57'),
(612, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:34:58', '2026-01-20 18:34:58'),
(613, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:35:51', '2026-01-20 18:35:51'),
(614, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:35:51', '2026-01-20 18:35:51'),
(615, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:35:53', '2026-01-20 18:35:53'),
(616, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:35:53', '2026-01-20 18:35:53'),
(617, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:35:54', '2026-01-20 18:35:54'),
(618, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:36:16', '2026-01-20 18:36:16'),
(619, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:36:17', '2026-01-20 18:36:17'),
(620, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:36:19', '2026-01-20 18:36:19'),
(621, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:36:19', '2026-01-20 18:36:19'),
(622, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:38:01', '2026-01-20 18:38:01'),
(623, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:38:01', '2026-01-20 18:38:01'),
(624, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:38:39', '2026-01-20 18:38:39'),
(625, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:38:39', '2026-01-20 18:38:39'),
(626, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:39:16', '2026-01-20 18:39:16'),
(627, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:42:13', '2026-01-20 18:42:13'),
(628, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:47:29', '2026-01-20 18:47:29'),
(629, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:48:44', '2026-01-20 18:48:44'),
(630, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:48:45', '2026-01-20 18:48:45'),
(631, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:48:45', '2026-01-20 18:48:45'),
(632, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:48:46', '2026-01-20 18:48:46'),
(633, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:48:47', '2026-01-20 18:48:47'),
(634, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:50:57', '2026-01-20 18:50:57'),
(635, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:54:13', '2026-01-20 18:54:13'),
(636, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:54:13', '2026-01-20 18:54:13'),
(637, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:54:14', '2026-01-20 18:54:14'),
(638, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:54:14', '2026-01-20 18:54:14'),
(639, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:54:15', '2026-01-20 18:54:15'),
(640, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:54:45', '2026-01-20 18:54:45'),
(641, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:57:52', '2026-01-20 18:57:52'),
(642, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:57:53', '2026-01-20 18:57:53'),
(643, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:57:53', '2026-01-20 18:57:53'),
(644, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:57:54', '2026-01-20 18:57:54'),
(645, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:57:55', '2026-01-20 18:57:55'),
(646, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 18:58:39', '2026-01-20 18:58:39'),
(647, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:00:10', '2026-01-20 19:00:10'),
(648, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:00:10', '2026-01-20 19:00:10'),
(649, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:00:11', '2026-01-20 19:00:11'),
(650, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:00:12', '2026-01-20 19:00:12'),
(651, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:00:13', '2026-01-20 19:00:13'),
(652, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:01:11', '2026-01-20 19:01:11'),
(653, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:01:11', '2026-01-20 19:01:11'),
(654, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:01:12', '2026-01-20 19:01:12'),
(655, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:01:12', '2026-01-20 19:01:12'),
(656, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:01:13', '2026-01-20 19:01:13'),
(657, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:02:38', '2026-01-20 19:02:38'),
(658, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:37', '2026-01-20 19:03:37'),
(659, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:37', '2026-01-20 19:03:37'),
(660, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:38', '2026-01-20 19:03:38'),
(661, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:38', '2026-01-20 19:03:38'),
(662, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:39', '2026-01-20 19:03:39'),
(663, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:53', '2026-01-20 19:03:53'),
(664, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:54', '2026-01-20 19:03:54'),
(665, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:54', '2026-01-20 19:03:54'),
(666, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:54', '2026-01-20 19:03:54'),
(667, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:03:55', '2026-01-20 19:03:55'),
(668, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:04:30', '2026-01-20 19:04:30'),
(669, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:04:30', '2026-01-20 19:04:30'),
(670, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:04:31', '2026-01-20 19:04:31'),
(671, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:04:31', '2026-01-20 19:04:31'),
(672, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:04:32', '2026-01-20 19:04:32'),
(673, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:07', '2026-01-20 19:05:07'),
(674, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:07', '2026-01-20 19:05:07'),
(675, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:08', '2026-01-20 19:05:08'),
(676, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:08', '2026-01-20 19:05:08'),
(677, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:09', '2026-01-20 19:05:09'),
(678, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:28', '2026-01-20 19:05:28'),
(679, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:28', '2026-01-20 19:05:28'),
(680, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:29', '2026-01-20 19:05:29'),
(681, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:29', '2026-01-20 19:05:29'),
(682, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:30', '2026-01-20 19:05:30'),
(683, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:56', '2026-01-20 19:05:56'),
(684, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:57', '2026-01-20 19:05:57'),
(685, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:57', '2026-01-20 19:05:57'),
(686, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:59', '2026-01-20 19:05:59'),
(687, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:05:59', '2026-01-20 19:05:59'),
(688, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:06:23', '2026-01-20 19:06:23'),
(689, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:06:26', '2026-01-20 19:06:26'),
(690, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:32', '2026-01-20 19:08:32'),
(691, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:32', '2026-01-20 19:08:32'),
(692, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:33', '2026-01-20 19:08:33'),
(693, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:34', '2026-01-20 19:08:34'),
(694, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:35', '2026-01-20 19:08:35'),
(695, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:52', '2026-01-20 19:08:52'),
(696, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:52', '2026-01-20 19:08:52'),
(697, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:53', '2026-01-20 19:08:53'),
(698, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:53', '2026-01-20 19:08:53'),
(699, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:08:54', '2026-01-20 19:08:54'),
(700, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:09:58', '2026-01-20 19:09:58'),
(701, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:09:58', '2026-01-20 19:09:58'),
(702, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:09:59', '2026-01-20 19:09:59'),
(703, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:09:59', '2026-01-20 19:09:59'),
(704, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:10:00', '2026-01-20 19:10:00'),
(705, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:20', '2026-01-20 19:14:20'),
(706, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:21', '2026-01-20 19:14:21'),
(707, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:21', '2026-01-20 19:14:21'),
(708, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:22', '2026-01-20 19:14:22'),
(709, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:22', '2026-01-20 19:14:22'),
(710, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:35', '2026-01-20 19:14:35'),
(711, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:35', '2026-01-20 19:14:35'),
(712, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:35', '2026-01-20 19:14:35'),
(713, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:36', '2026-01-20 19:14:36'),
(714, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:37', '2026-01-20 19:14:37'),
(715, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:38', '2026-01-20 19:14:38'),
(716, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:38', '2026-01-20 19:14:38'),
(717, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:39', '2026-01-20 19:14:39'),
(718, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:40', '2026-01-20 19:14:40'),
(719, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:14:41', '2026-01-20 19:14:41'),
(720, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:15:47', '2026-01-20 19:15:47'),
(721, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:15:48', '2026-01-20 19:15:48'),
(722, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:15:48', '2026-01-20 19:15:48'),
(723, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:15:48', '2026-01-20 19:15:48'),
(724, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:15:49', '2026-01-20 19:15:49'),
(725, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:17:01', '2026-01-20 19:17:01'),
(726, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:17:02', '2026-01-20 19:17:02'),
(727, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:17:02', '2026-01-20 19:17:02'),
(728, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:17:03', '2026-01-20 19:17:03'),
(729, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:17:03', '2026-01-20 19:17:03'),
(730, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:22:22', '2026-01-20 19:22:22'),
(731, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:22:23', '2026-01-20 19:22:23'),
(732, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:22:24', '2026-01-20 19:22:24'),
(733, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:22:24', '2026-01-20 19:22:24'),
(734, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:22:25', '2026-01-20 19:22:25'),
(735, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:23:31', '2026-01-20 19:23:31'),
(736, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:24:32', '2026-01-20 19:24:32'),
(737, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:24:33', '2026-01-20 19:24:33'),
(738, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:25:14', '2026-01-20 19:25:14'),
(739, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:33:52', '2026-01-20 19:33:52'),
(740, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:25', '2026-01-20 19:39:25'),
(741, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:26', '2026-01-20 19:39:26'),
(742, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:27', '2026-01-20 19:39:27'),
(743, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:28', '2026-01-20 19:39:28'),
(744, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:28', '2026-01-20 19:39:28'),
(745, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:29', '2026-01-20 19:39:29'),
(746, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:29', '2026-01-20 19:39:29'),
(747, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:38', '2026-01-20 19:39:38'),
(748, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:38', '2026-01-20 19:39:38'),
(749, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:39', '2026-01-20 19:39:39'),
(750, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:41', '2026-01-20 19:39:41'),
(751, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:41', '2026-01-20 19:39:41'),
(752, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:42', '2026-01-20 19:39:42'),
(753, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:43', '2026-01-20 19:39:43'),
(754, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:44', '2026-01-20 19:39:44'),
(755, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:39:45', '2026-01-20 19:39:45'),
(756, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:03', '2026-01-20 19:40:03'),
(757, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:04', '2026-01-20 19:40:04'),
(758, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:04', '2026-01-20 19:40:04'),
(759, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:05', '2026-01-20 19:40:05'),
(760, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:07', '2026-01-20 19:40:07');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(761, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:07', '2026-01-20 19:40:07'),
(762, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:08', '2026-01-20 19:40:08'),
(763, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:09', '2026-01-20 19:40:09'),
(764, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:40:09', '2026-01-20 19:40:09'),
(765, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:44:00', '2026-01-20 19:44:00'),
(766, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:44:01', '2026-01-20 19:44:01'),
(767, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:44:02', '2026-01-20 19:44:02'),
(768, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:44:02', '2026-01-20 19:44:02'),
(769, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:44:03', '2026-01-20 19:44:03'),
(770, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:44:04', '2026-01-20 19:44:04'),
(771, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:44:05', '2026-01-20 19:44:05'),
(772, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:45:17', '2026-01-20 19:45:17'),
(773, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:48:03', '2026-01-20 19:48:03'),
(774, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:48:31', '2026-01-20 19:48:31'),
(775, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:50:20', '2026-01-20 19:50:20'),
(776, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:52:41', '2026-01-20 19:52:41'),
(777, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:52:42', '2026-01-20 19:52:42'),
(778, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:52:42', '2026-01-20 19:52:42'),
(779, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:52:43', '2026-01-20 19:52:43'),
(780, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:52:43', '2026-01-20 19:52:43'),
(781, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:52:44', '2026-01-20 19:52:44'),
(782, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:52:45', '2026-01-20 19:52:45'),
(783, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:52:45', '2026-01-20 19:52:45'),
(784, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:53:52', '2026-01-20 19:53:52'),
(785, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:54:10', '2026-01-20 19:54:10'),
(786, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:54:11', '2026-01-20 19:54:11'),
(787, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:54:42', '2026-01-20 19:54:42'),
(788, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 19:55:38', '2026-01-20 19:55:38'),
(789, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:13', '2026-01-20 20:02:13'),
(790, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:19', '2026-01-20 20:02:19'),
(791, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:20', '2026-01-20 20:02:20'),
(792, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:20', '2026-01-20 20:02:20'),
(793, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:23', '2026-01-20 20:02:23'),
(794, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:23', '2026-01-20 20:02:23'),
(795, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:24', '2026-01-20 20:02:24'),
(796, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:25', '2026-01-20 20:02:25'),
(797, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:26', '2026-01-20 20:02:26'),
(798, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:27', '2026-01-20 20:02:27'),
(799, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:28', '2026-01-20 20:02:28'),
(800, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:29', '2026-01-20 20:02:29'),
(801, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:29', '2026-01-20 20:02:29'),
(802, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:30', '2026-01-20 20:02:30'),
(803, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:02:50', '2026-01-20 20:02:50'),
(804, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:03:11', '2026-01-20 20:03:11'),
(805, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:04:33', '2026-01-20 20:04:33'),
(806, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:04:44', '2026-01-20 20:04:44'),
(807, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:04:48', '2026-01-20 20:04:48'),
(808, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:07:20', '2026-01-20 20:07:20'),
(809, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:07:30', '2026-01-20 20:07:30'),
(810, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:09:58', '2026-01-20 20:09:58'),
(811, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:40', '2026-01-20 20:11:40'),
(812, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:41', '2026-01-20 20:11:41'),
(813, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:42', '2026-01-20 20:11:42'),
(814, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:43', '2026-01-20 20:11:43'),
(815, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:44', '2026-01-20 20:11:44'),
(816, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:45', '2026-01-20 20:11:45'),
(817, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:45', '2026-01-20 20:11:45'),
(818, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:46', '2026-01-20 20:11:46'),
(819, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:47', '2026-01-20 20:11:47'),
(820, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:47', '2026-01-20 20:11:47'),
(821, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:48', '2026-01-20 20:11:48'),
(822, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:11:49', '2026-01-20 20:11:49'),
(823, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:13:52', '2026-01-20 20:13:52'),
(824, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:17:37', '2026-01-20 20:17:37'),
(825, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:18:01', '2026-01-20 20:18:01'),
(826, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:19:55', '2026-01-20 20:19:55'),
(827, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:21:26', '2026-01-20 20:21:26'),
(828, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:22:36', '2026-01-20 20:22:36'),
(829, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:23:43', '2026-01-20 20:23:43'),
(830, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:23:46', '2026-01-20 20:23:46'),
(831, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:27:08', '2026-01-20 20:27:08'),
(832, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:27:35', '2026-01-20 20:27:35'),
(833, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:28:09', '2026-01-20 20:28:09'),
(834, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:30:45', '2026-01-20 20:30:45'),
(835, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:30:45', '2026-01-20 20:30:45'),
(836, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:31:51', '2026-01-20 20:31:51'),
(837, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:31:52', '2026-01-20 20:31:52'),
(838, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:32:09', '2026-01-20 20:32:09'),
(839, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:32:37', '2026-01-20 20:32:37'),
(840, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:32:40', '2026-01-20 20:32:40'),
(841, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:36:27', '2026-01-20 20:36:27'),
(842, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:36:47', '2026-01-20 20:36:47'),
(843, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:37:23', '2026-01-20 20:37:23'),
(844, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:37:33', '2026-01-20 20:37:33'),
(845, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:37:37', '2026-01-20 20:37:37'),
(846, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:37:44', '2026-01-20 20:37:44'),
(847, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:37:58', '2026-01-20 20:37:58'),
(848, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:38:01', '2026-01-20 20:38:01'),
(849, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:38:30', '2026-01-20 20:38:30'),
(850, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Go-http-client/1.1', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:43:25', '2026-01-20 20:43:25'),
(851, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.19041.3803', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:46:19', '2026-01-20 20:46:19'),
(852, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:48:31', '2026-01-20 20:48:31'),
(853, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:49:43', '2026-01-20 20:49:43'),
(854, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:49:45', '2026-01-20 20:49:45'),
(855, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:50:06', '2026-01-20 20:50:06'),
(856, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:50:07', '2026-01-20 20:50:07'),
(857, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:50:08', '2026-01-20 20:50:08'),
(858, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:50:30', '2026-01-20 20:50:30'),
(859, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:50:32', '2026-01-20 20:50:32'),
(860, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:50:44', '2026-01-20 20:50:44'),
(861, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:52:15', '2026-01-20 20:52:15'),
(862, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:52:16', '2026-01-20 20:52:16'),
(863, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:53:15', '2026-01-20 20:53:15'),
(864, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:57:12', '2026-01-20 20:57:12'),
(865, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:58:25', '2026-01-20 20:58:25'),
(866, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:58:37', '2026-01-20 20:58:37'),
(867, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 20:58:49', '2026-01-20 20:58:49'),
(868, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:00:04', '2026-01-20 21:00:04'),
(869, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:00:25', '2026-01-20 21:00:25'),
(870, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:00:25', '2026-01-20 21:00:25'),
(871, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:00:35', '2026-01-20 21:00:35'),
(872, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:00:35', '2026-01-20 21:00:35'),
(873, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:00:45', '2026-01-20 21:00:45'),
(874, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:00:46', '2026-01-20 21:00:46'),
(875, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:01:02', '2026-01-20 21:01:02'),
(876, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:01:03', '2026-01-20 21:01:03'),
(877, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:01:28', '2026-01-20 21:01:28'),
(878, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:01:28', '2026-01-20 21:01:28'),
(879, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:01:46', '2026-01-20 21:01:46'),
(880, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:01:47', '2026-01-20 21:01:47'),
(881, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:01:47', '2026-01-20 21:01:47'),
(882, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:02:02', '2026-01-20 21:02:02'),
(883, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:02:18', '2026-01-20 21:02:18'),
(884, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:02:18', '2026-01-20 21:02:18'),
(885, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:02:29', '2026-01-20 21:02:29'),
(886, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:02:30', '2026-01-20 21:02:30'),
(887, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:02:59', '2026-01-20 21:02:59'),
(888, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:02:59', '2026-01-20 21:02:59'),
(889, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:03:11', '2026-01-20 21:03:11'),
(890, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:03:12', '2026-01-20 21:03:12'),
(891, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:03:28', '2026-01-20 21:03:28'),
(892, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:03:28', '2026-01-20 21:03:28'),
(893, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:04:21', '2026-01-20 21:04:21'),
(894, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:04:21', '2026-01-20 21:04:21'),
(895, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:04:42', '2026-01-20 21:04:42'),
(896, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:04:43', '2026-01-20 21:04:43'),
(897, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:05:03', '2026-01-20 21:05:03'),
(898, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:05:03', '2026-01-20 21:05:03'),
(899, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:05:04', '2026-01-20 21:05:04'),
(900, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:07:25', '2026-01-20 21:07:25'),
(901, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:10:19', '2026-01-20 21:10:19'),
(902, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:10:21', '2026-01-20 21:10:21'),
(903, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:10:23', '2026-01-20 21:10:23'),
(904, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:10:38', '2026-01-20 21:10:38'),
(905, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:10:41', '2026-01-20 21:10:41'),
(906, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:10:48', '2026-01-20 21:10:48'),
(907, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:10:59', '2026-01-20 21:10:59'),
(908, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:12:11', '2026-01-20 21:12:11'),
(909, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:13:33', '2026-01-20 21:13:33'),
(910, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:13:34', '2026-01-20 21:13:34'),
(911, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:13:34', '2026-01-20 21:13:34'),
(912, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:13:34', '2026-01-20 21:13:34'),
(913, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:13:35', '2026-01-20 21:13:35'),
(914, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:13:56', '2026-01-20 21:13:56'),
(915, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:15:11', '2026-01-20 21:15:11'),
(916, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:28', '2026-01-20 21:17:28'),
(917, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:29', '2026-01-20 21:17:29'),
(918, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:29', '2026-01-20 21:17:29'),
(919, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:30', '2026-01-20 21:17:30'),
(920, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:30', '2026-01-20 21:17:30'),
(921, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:31', '2026-01-20 21:17:31'),
(922, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:31', '2026-01-20 21:17:31'),
(923, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:32', '2026-01-20 21:17:32'),
(924, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:32', '2026-01-20 21:17:32'),
(925, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:33', '2026-01-20 21:17:33'),
(926, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:33', '2026-01-20 21:17:33'),
(927, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:33', '2026-01-20 21:17:33'),
(928, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:34', '2026-01-20 21:17:34'),
(929, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:34', '2026-01-20 21:17:34'),
(930, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:34', '2026-01-20 21:17:34'),
(931, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:34', '2026-01-20 21:17:34'),
(932, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:35', '2026-01-20 21:17:35'),
(933, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:35', '2026-01-20 21:17:35'),
(934, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:48', '2026-01-20 21:17:48'),
(935, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:55', '2026-01-20 21:17:55'),
(936, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:17:55', '2026-01-20 21:17:55'),
(937, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:18:14', '2026-01-20 21:18:14'),
(938, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:18:14', '2026-01-20 21:18:14'),
(939, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:18:22', '2026-01-20 21:18:22'),
(940, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:18:23', '2026-01-20 21:18:23'),
(941, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:18:23', '2026-01-20 21:18:23'),
(942, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:18:28', '2026-01-20 21:18:28'),
(943, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:18:29', '2026-01-20 21:18:29'),
(944, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:19:54', '2026-01-20 21:19:54'),
(945, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:19:54', '2026-01-20 21:19:54'),
(946, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:20:24', '2026-01-20 21:20:24'),
(947, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:20:24', '2026-01-20 21:20:24'),
(948, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:20:24', '2026-01-20 21:20:24'),
(949, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:20:25', '2026-01-20 21:20:25'),
(950, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:22:02', '2026-01-20 21:22:02'),
(951, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:22:11', '2026-01-20 21:22:11');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(952, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:24:44', '2026-01-20 21:24:44'),
(953, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:24:45', '2026-01-20 21:24:45'),
(954, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:25:01', '2026-01-20 21:25:01'),
(955, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:25:02', '2026-01-20 21:25:02'),
(956, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:27:33', '2026-01-20 21:27:33'),
(957, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:27:34', '2026-01-20 21:27:34'),
(958, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:27:34', '2026-01-20 21:27:34'),
(959, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:27:35', '2026-01-20 21:27:35'),
(960, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:27:36', '2026-01-20 21:27:36'),
(961, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:29:52', '2026-01-20 21:29:52'),
(962, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:29:52', '2026-01-20 21:29:52'),
(963, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:30:07', '2026-01-20 21:30:07'),
(964, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:45:27', '2026-01-20 21:45:27'),
(965, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:47:46', '2026-01-20 21:47:46'),
(966, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:47:46', '2026-01-20 21:47:46'),
(967, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:48:53', '2026-01-20 21:48:53'),
(968, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:48:56', '2026-01-20 21:48:56'),
(969, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:49:38', '2026-01-20 21:49:38'),
(970, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:49:38', '2026-01-20 21:49:38'),
(971, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:49:39', '2026-01-20 21:49:39'),
(972, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:49:42', '2026-01-20 21:49:42'),
(973, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:49:45', '2026-01-20 21:49:45'),
(974, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:51:41', '2026-01-20 21:51:41'),
(975, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:52:47', '2026-01-20 21:52:47'),
(976, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:40', '2026-01-20 21:53:40'),
(977, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:41', '2026-01-20 21:53:41'),
(978, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:41', '2026-01-20 21:53:41'),
(979, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:42', '2026-01-20 21:53:42'),
(980, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:42', '2026-01-20 21:53:42'),
(981, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:43', '2026-01-20 21:53:43'),
(982, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:43', '2026-01-20 21:53:43'),
(983, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:43', '2026-01-20 21:53:43'),
(984, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:53:58', '2026-01-20 21:53:58'),
(985, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:54:05', '2026-01-20 21:54:05'),
(986, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:54:07', '2026-01-20 21:54:07'),
(987, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:55:05', '2026-01-20 21:55:05'),
(988, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:55:06', '2026-01-20 21:55:06'),
(989, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:59:21', '2026-01-20 21:59:21'),
(990, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:59:21', '2026-01-20 21:59:21'),
(991, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:59:22', '2026-01-20 21:59:22'),
(992, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:59:22', '2026-01-20 21:59:22'),
(993, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:59:23', '2026-01-20 21:59:23'),
(994, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 21:59:26', '2026-01-20 21:59:26'),
(995, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:02:44', '2026-01-20 22:02:44'),
(996, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:23:43', '2026-01-20 22:23:43'),
(997, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:23:44', '2026-01-20 22:23:44'),
(998, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:23:59', '2026-01-20 22:23:59'),
(999, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:23:59', '2026-01-20 22:23:59'),
(1000, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:24:00', '2026-01-20 22:24:00'),
(1001, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:24:06', '2026-01-20 22:24:06'),
(1002, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:24:10', '2026-01-20 22:24:10'),
(1003, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:24:13', '2026-01-20 22:24:13'),
(1004, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 22:24:15', '2026-01-20 22:24:15'),
(1005, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:11:34', '2026-01-20 23:11:34'),
(1006, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:13:22', '2026-01-20 23:13:22'),
(1007, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:13:22', '2026-01-20 23:13:22'),
(1008, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:13:29', '2026-01-20 23:13:29'),
(1009, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:14:43', '2026-01-20 23:14:43'),
(1010, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:14:43', '2026-01-20 23:14:43'),
(1011, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:17:03', '2026-01-20 23:17:03'),
(1012, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:18:46', '2026-01-20 23:18:46'),
(1013, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:18:57', '2026-01-20 23:18:57'),
(1014, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:19:00', '2026-01-20 23:19:00'),
(1015, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:19:12', '2026-01-20 23:19:12'),
(1016, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:19:16', '2026-01-20 23:19:16'),
(1017, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:26:19', '2026-01-20 23:26:19'),
(1018, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:26:21', '2026-01-20 23:26:21'),
(1019, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:26:55', '2026-01-20 23:26:55'),
(1020, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:26:55', '2026-01-20 23:26:55'),
(1021, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:26:57', '2026-01-20 23:26:57'),
(1022, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:26:57', '2026-01-20 23:26:57'),
(1023, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:27:48', '2026-01-20 23:27:48'),
(1024, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:28:23', '2026-01-20 23:28:23'),
(1025, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:28:23', '2026-01-20 23:28:23'),
(1026, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:29:01', '2026-01-20 23:29:01'),
(1027, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:29:13', '2026-01-20 23:29:13'),
(1028, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:29:27', '2026-01-20 23:29:27'),
(1029, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:30:45', '2026-01-20 23:30:45'),
(1030, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:31:07', '2026-01-20 23:31:07'),
(1031, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:31:16', '2026-01-20 23:31:16'),
(1032, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:33:46', '2026-01-20 23:33:46'),
(1033, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:33:52', '2026-01-20 23:33:52'),
(1034, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:33:57', '2026-01-20 23:33:57'),
(1035, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:34:44', '2026-01-20 23:34:44'),
(1036, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:35:48', '2026-01-20 23:35:48'),
(1037, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:36:33', '2026-01-20 23:36:33'),
(1038, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:36:36', '2026-01-20 23:36:36'),
(1039, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:36:38', '2026-01-20 23:36:38'),
(1040, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:36:40', '2026-01-20 23:36:40'),
(1041, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:36:42', '2026-01-20 23:36:42'),
(1042, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:36:44', '2026-01-20 23:36:44'),
(1043, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:36:48', '2026-01-20 23:36:48'),
(1044, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:38:41', '2026-01-20 23:38:41'),
(1045, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:39:16', '2026-01-20 23:39:16'),
(1046, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:41:30', '2026-01-20 23:41:30'),
(1047, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:41:33', '2026-01-20 23:41:33'),
(1048, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:44:36', '2026-01-20 23:44:36'),
(1049, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:45:12', '2026-01-20 23:45:12'),
(1050, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:45:53', '2026-01-20 23:45:53'),
(1051, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:50:14', '2026-01-20 23:50:14'),
(1052, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:53:39', '2026-01-20 23:53:39'),
(1053, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:53:52', '2026-01-20 23:53:52'),
(1054, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:54:17', '2026-01-20 23:54:17'),
(1055, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:54:19', '2026-01-20 23:54:19'),
(1056, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:54:35', '2026-01-20 23:54:35'),
(1057, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:54:37', '2026-01-20 23:54:37'),
(1058, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:55:39', '2026-01-20 23:55:39'),
(1059, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:57:24', '2026-01-20 23:57:24'),
(1060, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-20 23:59:43', '2026-01-20 23:59:43'),
(1061, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:00:33', '2026-01-21 00:00:33'),
(1062, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:05:23', '2026-01-21 00:05:23'),
(1063, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:05:32', '2026-01-21 00:05:32'),
(1064, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:09:16', '2026-01-21 00:09:16'),
(1065, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:09:29', '2026-01-21 00:09:29'),
(1066, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:09:31', '2026-01-21 00:09:31'),
(1067, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:10:14', '2026-01-21 00:10:14'),
(1068, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:10:50', '2026-01-21 00:10:50'),
(1069, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:11:27', '2026-01-21 00:11:27'),
(1070, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:12:24', '2026-01-21 00:12:24'),
(1071, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:14:34', '2026-01-21 00:14:34'),
(1072, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:15:59', '2026-01-21 00:15:59'),
(1073, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:16:00', '2026-01-21 00:16:00'),
(1074, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:17:26', '2026-01-21 00:17:26'),
(1075, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:17:28', '2026-01-21 00:17:28'),
(1076, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:18:34', '2026-01-21 00:18:34'),
(1077, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:19:46', '2026-01-21 00:19:46'),
(1078, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:21:30', '2026-01-21 00:21:30'),
(1079, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:21:44', '2026-01-21 00:21:44'),
(1080, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:22:23', '2026-01-21 00:22:23'),
(1081, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:23:30', '2026-01-21 00:23:30'),
(1082, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:23:51', '2026-01-21 00:23:51'),
(1083, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:28:40', '2026-01-21 00:28:40'),
(1084, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:30:33', '2026-01-21 00:30:33'),
(1085, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:32:35', '2026-01-21 00:32:35'),
(1086, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:32:53', '2026-01-21 00:32:53'),
(1087, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:33:34', '2026-01-21 00:33:34'),
(1088, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:33:49', '2026-01-21 00:33:49'),
(1089, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:33:51', '2026-01-21 00:33:51'),
(1090, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:35:01', '2026-01-21 00:35:01'),
(1091, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:38:19', '2026-01-21 00:38:19'),
(1092, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:47:55', '2026-01-21 00:47:55'),
(1093, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:49:38', '2026-01-21 00:49:38'),
(1094, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 00:58:37', '2026-01-21 00:58:37'),
(1095, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:04:54', '2026-01-21 01:04:54'),
(1096, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:08:02', '2026-01-21 01:08:02'),
(1097, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:26:13', '2026-01-21 01:26:13'),
(1098, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:26:39', '2026-01-21 01:26:39'),
(1099, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:28:50', '2026-01-21 01:28:50'),
(1100, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:29:31', '2026-01-21 01:29:31'),
(1101, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:31:27', '2026-01-21 01:31:27'),
(1102, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:34:24', '2026-01-21 01:34:24'),
(1103, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:35:15', '2026-01-21 01:35:15'),
(1104, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:36:53', '2026-01-21 01:36:53'),
(1105, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:37:15', '2026-01-21 01:37:15'),
(1106, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:37:55', '2026-01-21 01:37:55'),
(1107, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:38:28', '2026-01-21 01:38:28'),
(1108, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:39:59', '2026-01-21 01:39:59'),
(1109, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:45:35', '2026-01-21 01:45:35'),
(1110, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 01:59:20', '2026-01-21 01:59:20'),
(1111, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:01:07', '2026-01-21 02:01:07'),
(1112, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:03:09', '2026-01-21 02:03:09'),
(1113, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:03:33', '2026-01-21 02:03:33'),
(1114, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:03:35', '2026-01-21 02:03:35'),
(1115, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:03:51', '2026-01-21 02:03:51'),
(1116, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:04:12', '2026-01-21 02:04:12'),
(1117, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:09:27', '2026-01-21 02:09:27'),
(1118, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:09:47', '2026-01-21 02:09:47'),
(1119, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:11:35', '2026-01-21 02:11:35'),
(1120, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 02:13:21', '2026-01-21 02:13:21'),
(1121, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 03:02:54', '2026-01-21 03:02:54'),
(1122, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 03:03:05', '2026-01-21 03:03:05'),
(1123, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 03:03:07', '2026-01-21 03:03:07'),
(1124, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:04:20', '2026-01-21 19:04:20'),
(1125, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:14:07', '2026-01-21 19:14:07'),
(1126, '127.0.0.1', 'http://127.0.0.1:8001/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:14:21', '2026-01-21 19:14:21'),
(1127, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:14:22', '2026-01-21 19:14:22'),
(1128, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:14:35', '2026-01-21 19:14:35'),
(1129, '127.0.0.1', 'http://127.0.0.1:8001/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:14:59', '2026-01-21 19:14:59'),
(1130, '127.0.0.1', 'http://127.0.0.1:8001/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:14:59', '2026-01-21 19:14:59'),
(1131, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:15:10', '2026-01-21 19:15:10'),
(1132, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:19:37', '2026-01-21 19:19:37'),
(1133, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:19:37', '2026-01-21 19:19:37'),
(1134, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:21:45', '2026-01-21 19:21:45'),
(1135, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:21:45', '2026-01-21 19:21:45'),
(1136, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:22:22', '2026-01-21 19:22:22'),
(1137, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:22:23', '2026-01-21 19:22:23'),
(1138, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:26:50', '2026-01-21 19:26:50'),
(1139, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:26:50', '2026-01-21 19:26:50');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(1140, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:28:18', '2026-01-21 19:28:18'),
(1141, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:28:18', '2026-01-21 19:28:18'),
(1142, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:28:20', '2026-01-21 19:28:20'),
(1143, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:28:20', '2026-01-21 19:28:20'),
(1144, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:29:03', '2026-01-21 19:29:03'),
(1145, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 19:29:03', '2026-01-21 19:29:03'),
(1146, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:10:08', '2026-01-21 20:10:08'),
(1147, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:12:47', '2026-01-21 20:12:47'),
(1148, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:25:30', '2026-01-21 20:25:30'),
(1149, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:29:35', '2026-01-21 20:29:35'),
(1150, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:29:36', '2026-01-21 20:29:36'),
(1151, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:30:14', '2026-01-21 20:30:14'),
(1152, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:30:41', '2026-01-21 20:30:41'),
(1153, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:31:27', '2026-01-21 20:31:27'),
(1154, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:31:28', '2026-01-21 20:31:28'),
(1155, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:31:38', '2026-01-21 20:31:38'),
(1156, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:32:15', '2026-01-21 20:32:15'),
(1157, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:32:16', '2026-01-21 20:32:16'),
(1158, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:32:57', '2026-01-21 20:32:57'),
(1159, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:32:58', '2026-01-21 20:32:58'),
(1160, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:33:37', '2026-01-21 20:33:37'),
(1161, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:39:54', '2026-01-21 20:39:54'),
(1162, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:41:13', '2026-01-21 20:41:13'),
(1163, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:41:13', '2026-01-21 20:41:13'),
(1164, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:41:28', '2026-01-21 20:41:28'),
(1165, '127.0.0.1', 'http://127.0.0.1:8001/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:41:30', '2026-01-21 20:41:30'),
(1166, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 20:53:33', '2026-01-21 20:53:33'),
(1167, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 21:44:10', '2026-01-21 21:44:10'),
(1168, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 21:44:27', '2026-01-21 21:44:27'),
(1169, '127.0.0.1', 'http://127.0.0.1:8000/register', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 21:44:38', '2026-01-21 21:44:38'),
(1170, '127.0.0.1', 'http://127.0.0.1:8000/register', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 21:45:47', '2026-01-21 21:45:47'),
(1171, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 21:56:45', '2026-01-21 21:56:45'),
(1172, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 21:56:46', '2026-01-21 21:56:46'),
(1173, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 21:56:47', '2026-01-21 21:56:47'),
(1174, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:02:56', '2026-01-21 22:02:56'),
(1175, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:02:58', '2026-01-21 22:02:58'),
(1176, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:03:11', '2026-01-21 22:03:11'),
(1177, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:03:13', '2026-01-21 22:03:13'),
(1178, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:03:13', '2026-01-21 22:03:13'),
(1179, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:09:29', '2026-01-21 22:09:29'),
(1180, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:09:30', '2026-01-21 22:09:30'),
(1181, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:14:34', '2026-01-21 22:14:34'),
(1182, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:14:36', '2026-01-21 22:14:36'),
(1183, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:14:53', '2026-01-21 22:14:53'),
(1184, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 22:14:55', '2026-01-21 22:14:55'),
(1185, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:18:31', '2026-01-21 23:18:31'),
(1186, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:24:06', '2026-01-21 23:24:06'),
(1187, '127.0.0.1', 'http://localhost:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:24:24', '2026-01-21 23:24:24'),
(1188, '127.0.0.1', 'http://localhost:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:24:43', '2026-01-21 23:24:43'),
(1189, '127.0.0.1', 'http://localhost:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:25:21', '2026-01-21 23:25:21'),
(1190, '127.0.0.1', 'http://localhost:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:29:55', '2026-01-21 23:29:55'),
(1191, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:29:56', '2026-01-21 23:29:56'),
(1192, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:29:56', '2026-01-21 23:29:56'),
(1193, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:37:34', '2026-01-21 23:37:34'),
(1194, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:37:35', '2026-01-21 23:37:35'),
(1195, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:37:38', '2026-01-21 23:37:38'),
(1196, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:37:39', '2026-01-21 23:37:39'),
(1197, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:41:46', '2026-01-21 23:41:46'),
(1198, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:41:46', '2026-01-21 23:41:46'),
(1199, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:49:34', '2026-01-21 23:49:34'),
(1200, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-21 23:49:35', '2026-01-21 23:49:35'),
(1201, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:00:36', '2026-01-22 00:00:36'),
(1202, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:04:14', '2026-01-22 00:04:14'),
(1203, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:06:54', '2026-01-22 00:06:54'),
(1204, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:09:44', '2026-01-22 00:09:44'),
(1205, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:13:54', '2026-01-22 00:13:54'),
(1206, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:13:55', '2026-01-22 00:13:55'),
(1207, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:18:58', '2026-01-22 00:18:58'),
(1208, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:18:59', '2026-01-22 00:18:59'),
(1209, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:25:20', '2026-01-22 00:25:20'),
(1210, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:25:26', '2026-01-22 00:25:26'),
(1211, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:25:40', '2026-01-22 00:25:40'),
(1212, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:25:41', '2026-01-22 00:25:41'),
(1213, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:25:56', '2026-01-22 00:25:56'),
(1214, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:44:41', '2026-01-22 00:44:41'),
(1215, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:44:43', '2026-01-22 00:44:43'),
(1216, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:44:45', '2026-01-22 00:44:45'),
(1217, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 00:44:47', '2026-01-22 00:44:47'),
(1218, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 01:37:50', '2026-01-22 01:37:50'),
(1219, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 11:44:45', '2026-01-22 11:44:45'),
(1220, '127.0.0.1', 'http://127.0.0.1:8001/storage/projects/Xq4dW4CrhjjAgGYhiHXcy00Y6ILwn6YHy3IDJChE.png', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 11:44:50', '2026-01-22 11:44:50'),
(1221, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 11:45:10', '2026-01-22 11:45:10'),
(1222, '127.0.0.1', 'http://127.0.0.1:8001/storage/projects/Xq4dW4CrhjjAgGYhiHXcy00Y6ILwn6YHy3IDJChE.png', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 11:45:14', '2026-01-22 11:45:14'),
(1223, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 11:47:06', '2026-01-22 11:47:06'),
(1224, '127.0.0.1', 'http://127.0.0.1:8001/storage/projects/Xq4dW4CrhjjAgGYhiHXcy00Y6ILwn6YHy3IDJChE.png', 'GET', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 11:47:10', '2026-01-22 11:47:10'),
(1225, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-22 11:51:31', '2026-01-22 11:51:31'),
(1226, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-24 02:17:03', '2026-01-24 02:17:03'),
(1227, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-24 02:18:15', '2026-01-24 02:18:15'),
(1228, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:42:21', '2026-01-25 04:42:21'),
(1229, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:42:43', '2026-01-25 04:42:43'),
(1230, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:43:10', '2026-01-25 04:43:10'),
(1231, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:48:52', '2026-01-25 04:48:52'),
(1232, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:50:18', '2026-01-25 04:50:18'),
(1233, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:50:29', '2026-01-25 04:50:29'),
(1234, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:50:30', '2026-01-25 04:50:30'),
(1235, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:50:33', '2026-01-25 04:50:33'),
(1236, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:52:37', '2026-01-25 04:52:37'),
(1237, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 04:56:14', '2026-01-25 04:56:14'),
(1238, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:00:05', '2026-01-25 05:00:05'),
(1239, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:04:43', '2026-01-25 05:04:43'),
(1240, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:04:54', '2026-01-25 05:04:54'),
(1241, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:07:44', '2026-01-25 05:07:44'),
(1242, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:09:54', '2026-01-25 05:09:54'),
(1243, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:12:16', '2026-01-25 05:12:16'),
(1244, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:16:17', '2026-01-25 05:16:17'),
(1245, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:20:10', '2026-01-25 05:20:10'),
(1246, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:22:26', '2026-01-25 05:22:26'),
(1247, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:28:31', '2026-01-25 05:28:31'),
(1248, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:33:16', '2026-01-25 05:33:16'),
(1249, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:33:51', '2026-01-25 05:33:51'),
(1250, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 05:37:49', '2026-01-25 05:37:49'),
(1251, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:06:30', '2026-01-25 06:06:30'),
(1252, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:09:08', '2026-01-25 06:09:08'),
(1253, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:10:45', '2026-01-25 06:10:45'),
(1254, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:10:48', '2026-01-25 06:10:48'),
(1255, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:13:42', '2026-01-25 06:13:42'),
(1256, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:16:41', '2026-01-25 06:16:41'),
(1257, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:16:59', '2026-01-25 06:16:59'),
(1258, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:21:15', '2026-01-25 06:21:15'),
(1259, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:22:53', '2026-01-25 06:22:53'),
(1260, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:23:36', '2026-01-25 06:23:36'),
(1261, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:25:11', '2026-01-25 06:25:11'),
(1262, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:31:05', '2026-01-25 06:31:05'),
(1263, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:32:19', '2026-01-25 06:32:19'),
(1264, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:34:43', '2026-01-25 06:34:43'),
(1265, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:38:26', '2026-01-25 06:38:26'),
(1266, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:40:02', '2026-01-25 06:40:02'),
(1267, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:42:15', '2026-01-25 06:42:15'),
(1268, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:45:00', '2026-01-25 06:45:00'),
(1269, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:46:20', '2026-01-25 06:46:20'),
(1270, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:48:18', '2026-01-25 06:48:18'),
(1271, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:50:30', '2026-01-25 06:50:30'),
(1272, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:51:25', '2026-01-25 06:51:25'),
(1273, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:54:18', '2026-01-25 06:54:18'),
(1274, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:57:27', '2026-01-25 06:57:27'),
(1275, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 06:58:55', '2026-01-25 06:58:55'),
(1276, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:02:45', '2026-01-25 07:02:45'),
(1277, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:02:58', '2026-01-25 07:02:58'),
(1278, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:06:01', '2026-01-25 07:06:01'),
(1279, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:10:47', '2026-01-25 07:10:47'),
(1280, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:13:39', '2026-01-25 07:13:39'),
(1281, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:16:48', '2026-01-25 07:16:48'),
(1282, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:20:14', '2026-01-25 07:20:14'),
(1283, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:22:26', '2026-01-25 07:22:26'),
(1284, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:26:49', '2026-01-25 07:26:49'),
(1285, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:28:04', '2026-01-25 07:28:04'),
(1286, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:28:06', '2026-01-25 07:28:06'),
(1287, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:33:38', '2026-01-25 07:33:38'),
(1288, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:37:04', '2026-01-25 07:37:04'),
(1289, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:40:11', '2026-01-25 07:40:11'),
(1290, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:40:44', '2026-01-25 07:40:44'),
(1291, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:44:09', '2026-01-25 07:44:09'),
(1292, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:48:17', '2026-01-25 07:48:17'),
(1293, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:51:24', '2026-01-25 07:51:24'),
(1294, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 07:53:57', '2026-01-25 07:53:57'),
(1295, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:15:21', '2026-01-25 08:15:21'),
(1296, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:46:31', '2026-01-25 08:46:31'),
(1297, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:47:40', '2026-01-25 08:47:40'),
(1298, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:51:51', '2026-01-25 08:51:51'),
(1299, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:52:25', '2026-01-25 08:52:25'),
(1300, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:53:02', '2026-01-25 08:53:02'),
(1301, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:53:18', '2026-01-25 08:53:18'),
(1302, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:53:19', '2026-01-25 08:53:19'),
(1303, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:57:20', '2026-01-25 08:57:20'),
(1304, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:57:22', '2026-01-25 08:57:22'),
(1305, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 08:59:03', '2026-01-25 08:59:03'),
(1306, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 09:00:47', '2026-01-25 09:00:47'),
(1307, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 09:11:25', '2026-01-25 09:11:25'),
(1308, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 10:16:34', '2026-01-25 10:16:34'),
(1309, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 10:16:39', '2026-01-25 10:16:39'),
(1310, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 10:20:19', '2026-01-25 10:20:19'),
(1311, '127.0.0.1', 'http://localhost:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 10:20:20', '2026-01-25 10:20:20'),
(1312, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-25 20:19:19', '2026-01-25 20:19:19'),
(1313, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-01-26 23:18:05', '2026-01-26 23:18:05'),
(1314, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Go-http-client/1.1', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:11:22', '2026-02-15 18:11:22'),
(1315, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:15:48', '2026-02-15 18:15:48'),
(1316, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:15:48', '2026-02-15 18:15:48'),
(1317, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:18:05', '2026-02-15 18:18:05'),
(1318, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:18:15', '2026-02-15 18:18:15'),
(1319, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:18:17', '2026-02-15 18:18:17'),
(1320, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:18:59', '2026-02-15 18:18:59'),
(1321, '127.0.0.1', 'http://127.0.0.1:8000', 'HEAD', 'Go-http-client/1.1', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:28:49', '2026-02-15 18:28:49'),
(1322, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Go-http-client/1.1', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:28:49', '2026-02-15 18:28:49'),
(1323, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:29:17', '2026-02-15 18:29:17'),
(1324, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:29:42', '2026-02-15 18:29:42'),
(1325, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:29:54', '2026-02-15 18:29:54'),
(1326, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:30:00', '2026-02-15 18:30:00'),
(1327, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:30:15', '2026-02-15 18:30:15'),
(1328, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:30:18', '2026-02-15 18:30:18');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(1329, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:30:26', '2026-02-15 18:30:26'),
(1330, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:36:18', '2026-02-15 18:36:18'),
(1331, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:36:18', '2026-02-15 18:36:18'),
(1332, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:37:05', '2026-02-15 18:37:05'),
(1333, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:37:07', '2026-02-15 18:37:07'),
(1334, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:39:02', '2026-02-15 18:39:02'),
(1335, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:39:23', '2026-02-15 18:39:23'),
(1336, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:39:25', '2026-02-15 18:39:25'),
(1337, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:39:26', '2026-02-15 18:39:26'),
(1338, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:39:27', '2026-02-15 18:39:27'),
(1339, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:39:52', '2026-02-15 18:39:52'),
(1340, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:39:56', '2026-02-15 18:39:56'),
(1341, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:41:09', '2026-02-15 18:41:09'),
(1342, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:41:12', '2026-02-15 18:41:12'),
(1343, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:41:41', '2026-02-15 18:41:41'),
(1344, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:42:15', '2026-02-15 18:42:15'),
(1345, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:42:18', '2026-02-15 18:42:18'),
(1346, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:43:32', '2026-02-15 18:43:32'),
(1347, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:44:19', '2026-02-15 18:44:19'),
(1348, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:44:44', '2026-02-15 18:44:44'),
(1349, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:45:44', '2026-02-15 18:45:44'),
(1350, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:45:47', '2026-02-15 18:45:47'),
(1351, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:46:23', '2026-02-15 18:46:23'),
(1352, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:46:24', '2026-02-15 18:46:24'),
(1353, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:46:26', '2026-02-15 18:46:26'),
(1354, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:46:29', '2026-02-15 18:46:29'),
(1355, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:47:30', '2026-02-15 18:47:30'),
(1356, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:47:33', '2026-02-15 18:47:33'),
(1357, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:47:35', '2026-02-15 18:47:35'),
(1358, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:47:42', '2026-02-15 18:47:42'),
(1359, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:47:57', '2026-02-15 18:47:57'),
(1360, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:48:12', '2026-02-15 18:48:12'),
(1361, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:48:25', '2026-02-15 18:48:25'),
(1362, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:52:01', '2026-02-15 18:52:01'),
(1363, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:53:03', '2026-02-15 18:53:03'),
(1364, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:54:00', '2026-02-15 18:54:00'),
(1365, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:54:02', '2026-02-15 18:54:02'),
(1366, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:54:04', '2026-02-15 18:54:04'),
(1367, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:55:02', '2026-02-15 18:55:02'),
(1368, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:55:14', '2026-02-15 18:55:14'),
(1369, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 18:59:20', '2026-02-15 18:59:20'),
(1370, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:01:14', '2026-02-15 19:01:14'),
(1371, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:01:23', '2026-02-15 19:01:23'),
(1372, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:01:40', '2026-02-15 19:01:40'),
(1373, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:02:05', '2026-02-15 19:02:05'),
(1374, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:03:23', '2026-02-15 19:03:23'),
(1375, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:04:09', '2026-02-15 19:04:09'),
(1376, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:04:18', '2026-02-15 19:04:18'),
(1377, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:05:50', '2026-02-15 19:05:50'),
(1378, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:06:22', '2026-02-15 19:06:22'),
(1379, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:06:36', '2026-02-15 19:06:36'),
(1380, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:06:41', '2026-02-15 19:06:41'),
(1381, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:06:45', '2026-02-15 19:06:45'),
(1382, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:08:28', '2026-02-15 19:08:28'),
(1383, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:10:13', '2026-02-15 19:10:13'),
(1384, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:10:18', '2026-02-15 19:10:18'),
(1385, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:10:19', '2026-02-15 19:10:19'),
(1386, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:10:24', '2026-02-15 19:10:24'),
(1387, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:14:07', '2026-02-15 19:14:07'),
(1388, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:14:33', '2026-02-15 19:14:33'),
(1389, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:16:11', '2026-02-15 19:16:11'),
(1390, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:16:21', '2026-02-15 19:16:21'),
(1391, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:16:24', '2026-02-15 19:16:24'),
(1392, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:17:10', '2026-02-15 19:17:10'),
(1393, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:25:06', '2026-02-15 19:25:06'),
(1394, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:26:17', '2026-02-15 19:26:17'),
(1395, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:27:04', '2026-02-15 19:27:04'),
(1396, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:49:59', '2026-02-15 19:49:59'),
(1397, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 19:58:34', '2026-02-15 19:58:34'),
(1398, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:23:22', '2026-02-15 20:23:22'),
(1399, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:23:57', '2026-02-15 20:23:57'),
(1400, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:25:20', '2026-02-15 20:25:20'),
(1401, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:26:46', '2026-02-15 20:26:46'),
(1402, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:27:40', '2026-02-15 20:27:40'),
(1403, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:29:16', '2026-02-15 20:29:16'),
(1404, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:29:19', '2026-02-15 20:29:19'),
(1405, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:29:23', '2026-02-15 20:29:23'),
(1406, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:29:43', '2026-02-15 20:29:43'),
(1407, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:29:56', '2026-02-15 20:29:56'),
(1408, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:29:58', '2026-02-15 20:29:58'),
(1409, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:06', '2026-02-15 20:30:06'),
(1410, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:17', '2026-02-15 20:30:17'),
(1411, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:18', '2026-02-15 20:30:18'),
(1412, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:19', '2026-02-15 20:30:19'),
(1413, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:20', '2026-02-15 20:30:20'),
(1414, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:50', '2026-02-15 20:30:50'),
(1415, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:51', '2026-02-15 20:30:51'),
(1416, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:55', '2026-02-15 20:30:55'),
(1417, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:30:58', '2026-02-15 20:30:58'),
(1418, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:09', '2026-02-15 20:31:09'),
(1419, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:23', '2026-02-15 20:31:23'),
(1420, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:27', '2026-02-15 20:31:27'),
(1421, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:28', '2026-02-15 20:31:28'),
(1422, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:40', '2026-02-15 20:31:40'),
(1423, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:43', '2026-02-15 20:31:43'),
(1424, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:45', '2026-02-15 20:31:45'),
(1425, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:49', '2026-02-15 20:31:49'),
(1426, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:31:58', '2026-02-15 20:31:58'),
(1427, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:32:02', '2026-02-15 20:32:02'),
(1428, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:32:03', '2026-02-15 20:32:03'),
(1429, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:32:14', '2026-02-15 20:32:14'),
(1430, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:32:23', '2026-02-15 20:32:23'),
(1431, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:38:44', '2026-02-15 20:38:44'),
(1432, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:41:18', '2026-02-15 20:41:18'),
(1433, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:41:45', '2026-02-15 20:41:45'),
(1434, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:43:06', '2026-02-15 20:43:06'),
(1435, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:43:47', '2026-02-15 20:43:47'),
(1436, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-15 20:44:33', '2026-02-15 20:44:33'),
(1437, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-16 00:27:14', '2026-02-16 00:27:14'),
(1438, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-16 00:27:41', '2026-02-16 00:27:41'),
(1439, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-16 00:28:15', '2026-02-16 00:28:15'),
(1440, '127.0.0.1', 'http://127.0.0.1:8002', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-16 02:36:50', '2026-02-16 02:36:50'),
(1441, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-19 17:54:49', '2026-02-19 17:54:49'),
(1442, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-19 17:57:04', '2026-02-19 17:57:04'),
(1443, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-19 17:59:40', '2026-02-19 17:59:40'),
(1444, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 22:52:46', '2026-02-21 22:52:46'),
(1445, '127.0.0.1', 'http://localhost:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 22:58:35', '2026-02-21 22:58:35'),
(1446, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:11:17', '2026-02-21 23:11:17'),
(1447, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:11:24', '2026-02-21 23:11:24'),
(1448, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:13:42', '2026-02-21 23:13:42'),
(1449, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:33:08', '2026-02-21 23:33:08'),
(1450, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:41:56', '2026-02-21 23:41:56'),
(1451, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:42:02', '2026-02-21 23:42:02'),
(1452, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:42:02', '2026-02-21 23:42:02'),
(1453, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:42:03', '2026-02-21 23:42:03'),
(1454, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:42:03', '2026-02-21 23:42:03'),
(1455, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:42:03', '2026-02-21 23:42:03'),
(1456, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:42:12', '2026-02-21 23:42:12'),
(1457, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:42:12', '2026-02-21 23:42:12'),
(1458, '127.0.0.1', 'http://127.0.0.1:8001', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:44:51', '2026-02-21 23:44:51'),
(1459, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:54:21', '2026-02-21 23:54:21'),
(1460, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:54:26', '2026-02-21 23:54:26'),
(1461, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:54:58', '2026-02-21 23:54:58'),
(1462, '127.0.0.1', 'http://127.0.0.1:8000/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:55:09', '2026-02-21 23:55:09'),
(1463, '127.0.0.1', 'http://127.0.0.1:8000/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:55:17', '2026-02-21 23:55:17'),
(1464, '127.0.0.1', 'http://127.0.0.1:8000/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:55:18', '2026-02-21 23:55:18'),
(1465, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-21 23:55:41', '2026-02-21 23:55:41'),
(1466, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:02:20', '2026-02-22 00:02:20'),
(1467, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:02:49', '2026-02-22 00:02:49'),
(1468, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:02:52', '2026-02-22 00:02:52'),
(1469, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:03:23', '2026-02-22 00:03:23'),
(1470, '127.0.0.1', 'http://127.0.0.1:8000', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:03:25', '2026-02-22 00:03:25'),
(1471, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:24:44', '2026-02-22 00:24:44'),
(1472, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:24:50', '2026-02-22 00:24:50'),
(1473, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:28:31', '2026-02-22 00:28:31'),
(1474, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:29:24', '2026-02-22 00:29:24'),
(1475, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:30:56', '2026-02-22 00:30:56'),
(1476, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:31:20', '2026-02-22 00:31:20'),
(1477, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:32:55', '2026-02-22 00:32:55'),
(1478, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:33:32', '2026-02-22 00:33:32'),
(1479, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:33:33', '2026-02-22 00:33:33'),
(1480, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:33:41', '2026-02-22 00:33:41'),
(1481, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:34:00', '2026-02-22 00:34:00'),
(1482, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:34:03', '2026-02-22 00:34:03'),
(1483, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:34:11', '2026-02-22 00:34:11'),
(1484, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:37:52', '2026-02-22 00:37:52'),
(1485, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:39:37', '2026-02-22 00:39:37'),
(1486, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:39:38', '2026-02-22 00:39:38'),
(1487, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:41:29', '2026-02-22 00:41:29'),
(1488, '127.0.0.1', 'http://127.0.0.1:8000/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'Localhost', 'Local Machine', 'Dev Env', '2026-02-22 00:41:30', '2026-02-22 00:41:30'),
(1489, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:18:44', '2026-02-22 01:18:44'),
(1490, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:19:33', '2026-02-22 01:19:33'),
(1491, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:19:42', '2026-02-22 01:19:42'),
(1492, '140.213.7.181', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-02-22 01:20:12', '2026-02-22 01:20:12'),
(1493, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:20:12', '2026-02-22 01:20:12'),
(1494, '192.241.137.43', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:59.0) Gecko/20100101 Firefox/59.0', 'United States', 'North Bergen', 'New Jersey', '2026-02-22 01:20:13', '2026-02-22 01:20:13'),
(1495, '202.43.172.5', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 15; SM-S901B Build/AP3A.240905.015.A2; ) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.109 Mobile Safari/537.36 MetaIAB', 'Indonesia', 'Jakarta', 'Jakarta', '2026-02-22 01:20:18', '2026-02-22 01:20:18'),
(1496, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:20:32', '2026-02-22 01:20:32'),
(1497, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:21:16', '2026-02-22 01:21:16'),
(1498, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:24:12', '2026-02-22 01:24:12'),
(1499, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:53:38', '2026-02-22 01:53:38'),
(1500, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 01:53:58', '2026-02-22 01:53:58'),
(1501, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 02:01:36', '2026-02-22 02:01:36'),
(1502, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 02:01:49', '2026-02-22 02:01:49'),
(1503, '113.192.12.90', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 02:05:38', '2026-02-22 02:05:38'),
(1504, '113.192.12.90', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 02:05:39', '2026-02-22 02:05:39'),
(1505, '54.164.124.152', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-22 02:07:44', '2026-02-22 02:07:44'),
(1506, '54.164.124.152', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-22 02:07:51', '2026-02-22 02:07:51'),
(1507, '59.153.129.213', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36', 'Indonesia', 'Denpasar', 'Bali', '2026-02-22 02:33:58', '2026-02-22 02:33:58'),
(1508, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 03:42:51', '2026-02-22 03:42:51'),
(1509, '107.21.11.47', 'https://www.tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-22 04:20:40', '2026-02-22 04:20:40'),
(1510, '113.192.12.90', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Cikarang', 'West Java', '2026-02-22 05:25:19', '2026-02-22 05:25:19'),
(1511, '54.164.124.152', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-22 06:02:22', '2026-02-22 06:02:22'),
(1512, '54.164.124.152', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-22 06:02:56', '2026-02-22 06:02:56'),
(1513, '91.231.89.20', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'France', 'Gravelines', 'Hauts-de-France', '2026-02-22 06:10:26', '2026-02-22 06:10:26');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(1514, '91.231.89.122', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'France', 'Gravelines', 'Hauts-de-France', '2026-02-22 06:11:14', '2026-02-22 06:11:14'),
(1515, '91.231.89.38', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'France', 'Gravelines', 'Hauts-de-France', '2026-02-22 06:21:50', '2026-02-22 06:21:50'),
(1516, '20.189.202.58', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Osaka', 'Ōsaka', '2026-02-22 06:39:46', '2026-02-22 06:39:46'),
(1517, '34.87.90.63', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'Singapore', 'Singapore', 'Central Singapore', '2026-02-22 07:20:22', '2026-02-22 07:20:22'),
(1518, '185.206.82.102', 'https://www.tubagus.my.id', 'GET', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 QQ/8.0.8.458 V1_IPH_SQ_8.0.8_1_APP_A Pixel/1242 Core/WKWebView Device/Apple(iPhone XS) NetType/WIFI QBWebViewType/1 WKType/1', 'Iraq', 'Erbil', 'Erbil Governorate', '2026-02-22 09:42:02', '2026-02-22 09:42:02'),
(1519, '54.91.248.79', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-22 10:28:04', '2026-02-22 10:28:04'),
(1520, '54.91.248.79', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-22 10:28:07', '2026-02-22 10:28:07'),
(1521, '185.130.227.201', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 9; Redmi Note 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.83 Mobile Safari/537.36', 'Netherlands', 'Amsterdam', 'North Holland', '2026-02-22 10:48:58', '2026-02-22 10:48:58'),
(1522, '34.91.125.183', 'https://www.tubagus.my.id', 'GET', 'Scrapy/2.13.4 (+https://scrapy.org)', 'Netherlands', 'Groningen', 'Groningen', '2026-02-22 10:49:11', '2026-02-22 10:49:11'),
(1523, '5.133.192.171', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-22 13:06:21', '2026-02-22 13:06:21'),
(1524, '20.214.159.60', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'South Korea', 'Seoul', 'Seoul', '2026-02-22 14:44:59', '2026-02-22 14:44:59'),
(1525, '103.165.122.130', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-02-22 16:53:51', '2026-02-22 16:53:51'),
(1526, '52.33.57.22', 'https://tubagus.my.id', 'HEAD', 'CheckMarkNetwork/1.0 (+http://www.checkmarknetwork.com/spider.html)', 'United States', 'Portland', 'Oregon', '2026-02-22 17:11:05', '2026-02-22 17:11:05'),
(1527, '52.33.57.22', 'https://tubagus.my.id', 'GET', 'CheckMarkNetwork/1.0 (+http://www.checkmarknetwork.com/spider.html)', 'United States', 'Portland', 'Oregon', '2026-02-22 17:11:10', '2026-02-22 17:11:10'),
(1528, '129.212.236.177', 'https://tubagus.my.id/register', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'Singapore', 'Singapore', 'South West', '2026-02-22 17:53:26', '2026-02-22 17:53:26'),
(1529, '149.154.161.248', 'https://tubagus.my.id/register', 'GET', 'TelegramBot (like TwitterBot)', 'United Kingdom', 'London', 'England', '2026-02-22 17:53:36', '2026-02-22 17:53:36'),
(1530, '52.141.18.191', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'South Korea', 'Seoul', 'Seoul', '2026-02-22 18:33:58', '2026-02-22 18:33:58'),
(1531, '18.235.110.182', 'https://mail.tubagus.my.id', 'GET', 'RecordedFuture Global Inventory Crawler', 'United States', 'Ashburn', 'Virginia', '2026-02-22 18:51:29', '2026-02-22 18:51:29'),
(1532, '114.124.246.172', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-02-22 19:58:54', '2026-02-22 19:58:54'),
(1533, '114.124.246.172', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-02-22 20:03:30', '2026-02-22 20:03:30'),
(1534, '114.124.246.172', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-02-22 20:03:31', '2026-02-22 20:03:31'),
(1535, '141.148.153.213', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', 'United States', 'Phoenix', 'Arizona', '2026-02-22 20:45:12', '2026-02-22 20:45:12'),
(1536, '20.196.204.231', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'South Korea', 'Seoul', 'Seoul', '2026-02-22 21:29:43', '2026-02-22 21:29:43'),
(1537, '16.144.17.106', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/76.0.3809.81 Mobile/15E148 Safari/605.1', 'United States', 'Portland', 'Oregon', '2026-02-22 22:03:08', '2026-02-22 22:03:08'),
(1538, '20.92.234.66', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Australia', 'The Rocks', 'New South Wales', '2026-02-22 22:49:14', '2026-02-22 22:49:14'),
(1539, '101.91.110.13', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', 'China', 'Shanghai', 'Shanghai', '2026-02-23 00:37:45', '2026-02-23 00:37:45'),
(1540, '101.91.110.162', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11', 'China', 'Shanghai', 'Shanghai', '2026-02-23 00:38:14', '2026-02-23 00:38:14'),
(1541, '34.11.238.102', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'United States', 'The Dalles', 'Oregon', '2026-02-23 06:21:56', '2026-02-23 06:21:56'),
(1542, '136.111.70.114', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'United States', 'Council Bluffs', 'Iowa', '2026-02-23 09:06:25', '2026-02-23 09:06:25'),
(1543, '20.196.204.231', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'South Korea', 'Seoul', 'Seoul', '2026-02-23 09:12:01', '2026-02-23 09:12:01'),
(1544, '5.78.138.40', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'United States', 'Hillsboro', 'Oregon', '2026-02-23 09:24:43', '2026-02-23 09:24:43'),
(1545, '104.211.88.54', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-02-23 10:14:43', '2026-02-23 10:14:43'),
(1546, '20.189.202.58', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Osaka', 'Ōsaka', '2026-02-23 10:29:55', '2026-02-23 10:29:55'),
(1547, '107.21.11.47', 'https://www.tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0 ;Build/0220;', 'United States', 'Ashburn', 'Virginia', '2026-02-23 11:04:41', '2026-02-23 11:04:41'),
(1548, '205.210.31.183', 'https://tubagus.my.id', 'GET', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'United States', 'Santa Clara', 'California', '2026-02-23 12:24:04', '2026-02-23 12:24:04'),
(1549, '66.249.66.69', 'https://tubagus.my.id', 'GET', 'GoogleBot/2.1', 'United States', 'Mountain View', 'California', '2026-02-23 13:02:40', '2026-02-23 13:02:40'),
(1550, '66.249.66.7', 'https://tubagus.my.id', 'GET', 'GoogleBot/2.1', 'United States', 'Mountain View', 'California', '2026-02-23 14:11:28', '2026-02-23 14:11:28'),
(1551, '20.203.249.16', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Switzerland', 'Zurich', 'Zurich', '2026-02-23 18:10:23', '2026-02-23 18:10:23'),
(1552, '20.203.249.16', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Switzerland', 'Zurich', 'Zurich', '2026-02-23 18:10:52', '2026-02-23 18:10:52'),
(1553, '104.211.88.54', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-02-23 18:32:05', '2026-02-23 18:32:05'),
(1554, '104.211.88.54', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-02-23 18:32:15', '2026-02-23 18:32:15'),
(1555, '104.211.88.54', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-02-23 18:32:29', '2026-02-23 18:32:29'),
(1556, '15.204.182.106', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'United States', 'Reston', 'Virginia', '2026-02-23 21:28:34', '2026-02-23 21:28:34'),
(1557, '103.165.122.130', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-02-23 21:46:44', '2026-02-23 21:46:44'),
(1558, '15.204.182.106', 'https://www.tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'United States', 'Reston', 'Virginia', '2026-02-23 22:39:12', '2026-02-23 22:39:12'),
(1559, '45.138.48.190', 'https://tubagus.my.id', 'GET', 'python-requests/2.32.5', 'Germany', 'Frankfurt am Main', 'Hesse', '2026-02-23 22:51:17', '2026-02-23 22:51:17'),
(1560, '209.38.253.210', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Germany', 'Frankfurt am Main', 'Hesse', '2026-02-23 23:28:04', '2026-02-23 23:28:04'),
(1561, '20.196.204.231', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'South Korea', 'Seoul', 'Seoul', '2026-02-23 23:41:32', '2026-02-23 23:41:32'),
(1562, '198.235.24.108', 'https://tubagus.my.id', 'GET', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'United States', 'Santa Clara', 'California', '2026-02-24 01:09:55', '2026-02-24 01:09:55'),
(1563, '74.7.227.157', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'United States', 'Atlanta', 'Georgia', '2026-02-24 01:29:29', '2026-02-24 01:29:29'),
(1564, '74.7.227.157', 'https://tubagus.my.id/login', 'GET', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'United States', 'Atlanta', 'Georgia', '2026-02-24 01:29:59', '2026-02-24 01:29:59'),
(1565, '74.7.227.157', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'United States', 'Atlanta', 'Georgia', '2026-02-24 01:30:00', '2026-02-24 01:30:00'),
(1566, '74.7.227.157', 'https://tubagus.my.id/forgot-password', 'GET', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'United States', 'Atlanta', 'Georgia', '2026-02-24 01:30:05', '2026-02-24 01:30:05'),
(1567, '52.141.18.191', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'South Korea', 'Seoul', 'Seoul', '2026-02-24 06:22:21', '2026-02-24 06:22:21'),
(1568, '136.112.26.83', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'United States', 'Council Bluffs', 'Iowa', '2026-02-24 08:19:04', '2026-02-24 08:19:04'),
(1569, '20.212.6.161', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Singapore', 'Singapore', 'Central Singapore', '2026-02-24 10:59:00', '2026-02-24 10:59:00'),
(1570, '98.93.135.156', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-24 11:38:29', '2026-02-24 11:38:29'),
(1571, '98.93.135.156', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-24 11:38:45', '2026-02-24 11:38:45'),
(1572, '54.88.165.241', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-24 15:45:41', '2026-02-24 15:45:41'),
(1573, '54.88.165.241', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-24 15:46:02', '2026-02-24 15:46:02'),
(1574, '198.235.24.101', 'https://www.tubagus.my.id', 'GET', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'United States', 'Santa Clara', 'California', '2026-02-24 16:11:18', '2026-02-24 16:11:18'),
(1575, '63.135.161.50', 'https://tubagus.my.id', 'HEAD', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'United States', 'New York', 'New York', '2026-02-24 17:47:35', '2026-02-24 17:47:35'),
(1576, '63.135.161.50', 'https://tubagus.my.id/?rest_route=%2Fwp%2Fv2%2Fusers', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'United States', 'New York', 'New York', '2026-02-24 17:47:36', '2026-02-24 17:47:36'),
(1577, '40.80.89.74', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-02-24 22:25:01', '2026-02-24 22:25:01'),
(1578, '40.80.89.74', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-02-24 22:25:10', '2026-02-24 22:25:10'),
(1579, '128.90.170.4', 'https://tubagus.my.id', 'GET', 'Go-http-client/1.1', 'Poland', 'Warsaw', 'Mazovia', '2026-02-25 01:32:55', '2026-02-25 01:32:55'),
(1580, '93.158.90.53', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-25 02:15:32', '2026-02-25 02:15:32'),
(1581, '147.182.208.166', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'United States', 'North Bergen', 'New Jersey', '2026-02-25 04:58:44', '2026-02-25 04:58:44'),
(1582, '66.249.66.3', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'United States', 'Mountain View', 'California', '2026-02-25 07:03:47', '2026-02-25 07:03:47'),
(1583, '66.249.66.2', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'United States', 'Mountain View', 'California', '2026-02-25 07:03:49', '2026-02-25 07:03:49'),
(1584, '81.29.142.100', 'https://www.tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 YaBrowser/21.2.3.100 Yowser/2.5 Safari/537.36', 'Russia', 'Moscow', 'Moscow', '2026-02-25 10:09:42', '2026-02-25 10:09:42'),
(1585, '20.220.146.242', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Canada', 'Toronto', 'Ontario', '2026-02-25 13:25:32', '2026-02-25 13:25:32'),
(1586, '20.211.97.32', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'Australia', 'The Rocks', 'New South Wales', '2026-02-25 14:15:40', '2026-02-25 14:15:40'),
(1587, '66.132.153.134', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'United States', 'Ann Arbor', 'Michigan', '2026-02-25 18:13:45', '2026-02-25 18:13:45'),
(1588, '20.151.132.87', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Canada', 'Toronto', 'Ontario', '2026-02-25 18:47:45', '2026-02-25 18:47:45'),
(1589, '78.29.51.27', 'https://tubagus.my.id', 'GET', 'IMPORTANT! FREE! NON-CRIMINAL INDEPENDENT BLOCKCHAIN ANTIVIRUS! BASE - 50 MLN SiGNATURES! OWN BLOCKCHAIN SCIENTIFIC DEBT GATEWAY! OWN HOSTING AND ENCRYPTED DATABASE! LINK - http://78.29.51.27/antivirus/?s1=CU_tubagus.my.id', NULL, NULL, NULL, '2026-02-25 19:20:28', '2026-02-25 19:20:28'),
(1590, '20.89.254.160', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Osaka', 'Ōsaka', '2026-02-25 21:13:25', '2026-02-25 21:13:25'),
(1591, '20.89.254.160', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Osaka', 'Ōsaka', '2026-02-25 21:13:29', '2026-02-25 21:13:29'),
(1592, '78.29.51.27', 'https://tubagus.my.id', 'GET', 'IMPORTANT! FREE! NON-CRIMINAL INDEPENDENT BLOCKCHAIN ANTIVIRUS! BASE - 50 MLN SiGNATURES! OWN BLOCKCHAIN SCIENTIFIC DEBT GATEWAY! OWN HOSTING AND ENCRYPTED DATABASE! LINK - http://78.29.51.27/antivirus/?s1=CU_tubagus.my.id', 'Russia', 'Chelyabinsk', 'Chelyabinsk Oblast', '2026-02-25 21:30:45', '2026-02-25 21:30:45'),
(1593, '199.244.88.223', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'United States', 'Bartlett', 'Illinois', '2026-02-25 22:13:42', '2026-02-25 22:13:42'),
(1594, '165.22.239.186', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'Canada', 'Toronto', 'Ontario', '2026-02-25 23:58:01', '2026-02-25 23:58:01'),
(1595, '107.22.248.10', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-26 00:39:12', '2026-02-26 00:39:12'),
(1596, '192.36.198.80', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 14; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.280 Mobile Safari/537.36 OPR/80.4.4244.7786', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-26 00:42:07', '2026-02-26 00:42:07'),
(1597, '192.36.24.172', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Linux; Android 14; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.280 Mobile Safari/537.36 OPR/80.4.4244.7786', 'Germany', 'Frankfurt am Main', 'Hesse', '2026-02-26 00:42:09', '2026-02-26 00:42:09'),
(1598, '80.248.225.154', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 14; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.280 Mobile Safari/537.36 OPR/80.4.4244.7786', 'France', 'Paris', 'Île-de-France', '2026-02-26 00:42:10', '2026-02-26 00:42:10'),
(1599, '5.133.192.175', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 14; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.280 Mobile Safari/537.36 OPR/80.4.4244.7786', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-26 00:42:12', '2026-02-26 00:42:12'),
(1600, '199.244.88.223', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'United States', 'Bartlett', 'Illinois', '2026-02-26 05:32:47', '2026-02-26 05:32:47'),
(1601, '78.29.51.27', 'https://tubagus.my.id', 'GET', 'IMPORTANT! FREE! NON-CRIMINAL INDEPENDENT BLOCKCHAIN ANTIVIRUS! BASE - 50 MLN SiGNATURES! OWN BLOCKCHAIN SCIENTIFIC DEBT GATEWAY! OWN HOSTING AND ENCRYPTED DATABASE! LINK - http://78.29.51.27/antivirus/?s1=CU_tubagus.my.id', 'Russia', 'Chelyabinsk', 'Chelyabinsk Oblast', '2026-02-26 07:22:47', '2026-02-26 07:22:47'),
(1602, '85.208.96.208', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'United States', 'Ashburn', 'Virginia', '2026-02-26 07:42:44', '2026-02-26 07:42:44'),
(1603, '20.220.232.101', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Canada', 'Toronto', 'Ontario', '2026-02-26 11:48:35', '2026-02-26 11:48:35'),
(1604, '74.7.227.157', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'United States', 'Atlanta', 'Georgia', '2026-02-26 12:31:07', '2026-02-26 12:31:07'),
(1605, '34.142.251.255', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'Singapore', 'Singapore', 'Central Singapore', '2026-02-26 15:03:26', '2026-02-26 15:03:26'),
(1606, '162.142.125.113', 'https://www.tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'United States', 'Ann Arbor', 'Michigan', '2026-02-26 20:16:25', '2026-02-26 20:16:25'),
(1607, '103.165.122.130', 'https://biss.tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-02-26 22:50:37', '2026-02-26 22:50:37'),
(1608, '185.12.250.58', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 14; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.280 Mobile Safari/537.36 OPR/80.4.4244.7786', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-26 23:34:38', '2026-02-26 23:34:38'),
(1609, '93.158.127.79', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Linux; Android 14; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.280 Mobile Safari/537.36 OPR/80.4.4244.7786', 'Norway', 'Oslo', 'Oslo County', '2026-02-26 23:34:39', '2026-02-26 23:34:39'),
(1610, '93.158.70.111', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 14; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.280 Mobile Safari/537.36 OPR/80.4.4244.7786', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-26 23:34:41', '2026-02-26 23:34:41'),
(1611, '141.138.211.251', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 14; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.6099.280 Mobile Safari/537.36 OPR/80.4.4244.7786', 'United Kingdom', 'London', 'England', '2026-02-26 23:34:42', '2026-02-26 23:34:42'),
(1612, '153.33.99.34', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:139.0) Gecko/20100101 Firefox/139.0', 'United States', 'Riverside', 'California', '2026-02-27 00:03:37', '2026-02-27 00:03:37'),
(1613, '38.240.225.87', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Canada', 'Calgary', 'Alberta', '2026-02-27 00:21:17', '2026-02-27 00:21:17'),
(1614, '34.138.152.67', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'United States', 'North Charleston', 'South Carolina', '2026-02-27 02:12:41', '2026-02-27 02:12:41'),
(1615, '34.138.152.67', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'United States', 'North Charleston', 'South Carolina', '2026-02-27 02:12:44', '2026-02-27 02:12:44'),
(1616, '199.244.88.227', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'United States', 'Bartlett', 'Illinois', '2026-02-27 02:15:17', '2026-02-27 02:15:17'),
(1617, '34.38.179.127', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'Belgium', 'Brussels', 'Brussels Capital', '2026-02-27 03:09:43', '2026-02-27 03:09:43'),
(1618, '66.249.66.163', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'United States', 'Allentown', 'Pennsylvania', '2026-02-27 03:30:35', '2026-02-27 03:30:35'),
(1619, '20.63.83.113', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Canada', 'Toronto', 'Ontario', '2026-02-27 05:40:26', '2026-02-27 05:40:26'),
(1620, '34.63.28.89', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'United States', 'Council Bluffs', 'Iowa', '2026-02-27 09:39:10', '2026-02-27 09:39:10'),
(1621, '45.154.98.121', 'https://tubagus.my.id', 'GET', NULL, 'Netherlands', 'Lelystad', 'Flevoland', '2026-02-27 13:43:59', '2026-02-27 13:43:59'),
(1622, '13.70.40.215', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Hong Kong', 'Hong Kong', 'Central and Western District', '2026-02-27 15:10:19', '2026-02-27 15:10:19'),
(1623, '62.216.64.45', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'United States', 'Weehawken', 'New Jersey', '2026-02-27 17:56:56', '2026-02-27 17:56:56'),
(1624, '62.216.64.45', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'United States', 'Weehawken', 'New Jersey', '2026-02-27 17:56:57', '2026-02-27 17:56:57'),
(1625, '98.87.115.128', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-02-27 20:11:10', '2026-02-27 20:11:10'),
(1626, '91.227.17.30', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Russia', 'Saratov', 'Saratov Oblast', '2026-02-27 20:18:32', '2026-02-27 20:18:32'),
(1627, '192.36.109.127', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Safari/605.1.1', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-27 23:41:43', '2026-02-27 23:41:43'),
(1628, '192.36.109.105', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Safari/605.1.1', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-27 23:41:45', '2026-02-27 23:41:45'),
(1629, '192.36.109.99', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Safari/605.1.1', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-27 23:41:46', '2026-02-27 23:41:46'),
(1630, '192.36.109.108', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Safari/605.1.1', 'Sweden', 'Stockholm', 'Stockholm County', '2026-02-27 23:41:47', '2026-02-27 23:41:47'),
(1631, '121.127.34.166', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15', 'United States', 'Chicago', 'Illinois', '2026-02-28 00:38:54', '2026-02-28 00:38:54'),
(1632, '77.104.167.149', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'United Kingdom', 'Rochdale', 'England', '2026-02-28 02:42:26', '2026-02-28 02:42:26'),
(1633, '205.210.31.35', 'https://tubagus.my.id', 'GET', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'United States', 'Santa Clara', 'California', '2026-02-28 03:51:43', '2026-02-28 03:51:43'),
(1634, '20.104.82.189', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Canada', 'Toronto', 'Ontario', '2026-02-28 04:40:46', '2026-02-28 04:40:46'),
(1635, '68.233.37.50', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'United States', 'Newark', 'New Jersey', '2026-02-28 04:49:44', '2026-02-28 04:49:44'),
(1636, '20.63.83.162', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-02-28 07:26:36', '2026-02-28 07:26:36'),
(1637, '20.63.83.162', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-02-28 07:26:46', '2026-02-28 07:26:46'),
(1638, '20.219.8.79', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-02-28 10:08:29', '2026-02-28 10:08:29'),
(1639, '20.219.8.79', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-02-28 10:08:41', '2026-02-28 10:08:41'),
(1640, '20.63.83.162', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-02-28 10:29:39', '2026-02-28 10:29:39'),
(1641, '34.116.248.21', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (iPhone13,2; U; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Mobile/15E148 Safari/602.1', 'Poland', 'Warsaw', 'Masovian', '2026-02-28 11:50:38', '2026-02-28 11:50:38'),
(1642, '20.89.52.173', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Tokyo', 'Tokyo', '2026-02-28 12:52:33', '2026-02-28 12:52:33'),
(1643, '74.7.227.157', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'United States', 'Atlanta', 'Georgia', '2026-02-28 15:38:00', '2026-02-28 15:38:00'),
(1644, '20.89.52.173', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Tokyo', 'Tokyo', '2026-02-28 17:36:46', '2026-02-28 17:36:46'),
(1645, '68.183.188.187', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'Singapore', 'Singapore', 'South West', '2026-02-28 20:57:37', '2026-02-28 20:57:37'),
(1646, '185.191.171.7', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'United States', 'Washington', 'District of Columbia', '2026-03-01 00:33:51', '2026-03-01 00:33:51'),
(1647, '111.67.102.119', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', 'Cambodia', 'Phnom Penh', 'Phnom Penh', '2026-03-01 01:06:50', '2026-03-01 01:06:50'),
(1648, '81.29.142.100', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 6.1; rv:89.0) Gecko/20100101 Firefox/89.0', 'Russia', 'Moscow', 'Moscow', '2026-03-01 01:32:26', '2026-03-01 01:32:26'),
(1649, '20.89.52.173', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Tokyo', 'Tokyo', '2026-03-01 01:33:42', '2026-03-01 01:33:42'),
(1650, '85.208.96.207', 'https://tubagus.my.id/login', 'GET', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'United States', 'Ashburn', 'Virginia', '2026-03-01 03:47:20', '2026-03-01 03:47:20'),
(1651, '20.220.162.180', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-01 06:31:36', '2026-03-01 06:31:36'),
(1652, '20.219.8.79', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-03-01 10:59:58', '2026-03-01 10:59:58'),
(1653, '20.219.8.79', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-03-01 11:00:07', '2026-03-01 11:00:07'),
(1654, '20.219.8.79', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-03-01 11:00:18', '2026-03-01 11:00:18'),
(1655, '152.32.168.34', 'https://tubagus.my.id', 'GET', 'curl/7.29.0', 'Hong Kong', 'Hong Kong', 'Kowloon', '2026-03-01 11:14:11', '2026-03-01 11:14:11'),
(1656, '165.154.206.204', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/550.44 (KHTML, like Gecko) Chrome/64.0.1890 Safari/537.36', 'United States', 'Los Angeles', 'California', '2026-03-01 11:14:28', '2026-03-01 11:14:28'),
(1657, '20.89.52.173', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Tokyo', 'Tokyo', '2026-03-01 14:15:54', '2026-03-01 14:15:54'),
(1658, '20.104.97.185', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-01 14:39:30', '2026-03-01 14:39:30'),
(1659, '20.214.137.177', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'South Korea', 'Seoul', 'Seoul', '2026-03-01 16:44:57', '2026-03-01 16:44:57'),
(1660, '103.214.23.106', 'https://tubagus.my.id', 'GET', 'Go-http-client/1.1', 'Singapore', 'Singapore', 'North West', '2026-03-01 16:58:13', '2026-03-01 16:58:13'),
(1661, '121.127.34.166', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'United States', 'Chicago', 'Illinois', '2026-03-01 17:31:17', '2026-03-01 17:31:17'),
(1662, '45.156.87.246', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'Netherlands', 'Eygelshoven', 'Limburg', '2026-03-01 22:13:26', '2026-03-01 22:13:26'),
(1663, '20.89.52.173', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Tokyo', 'Tokyo', '2026-03-02 02:56:01', '2026-03-02 02:56:01'),
(1664, '20.63.102.54', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-02 03:58:58', '2026-03-02 03:58:58'),
(1665, '20.63.102.54', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-02 03:59:07', '2026-03-02 03:59:07'),
(1666, '20.104.87.220', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-02 05:13:50', '2026-03-02 05:13:50'),
(1667, '103.102.13.25', 'https://tubagus.my.id', 'GET', 'Go-http-client/1.1', 'Indonesia', 'Legok', 'Central Java', '2026-03-02 06:18:38', '2026-03-02 06:18:38'),
(1668, '40.85.218.182', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-02 07:19:45', '2026-03-02 07:19:45'),
(1669, '20.63.102.54', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-02 08:40:39', '2026-03-02 08:40:39'),
(1670, '198.235.24.19', 'https://tubagus.my.id', 'GET', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'United States', 'Santa Clara', 'California', '2026-03-02 10:04:32', '2026-03-02 10:04:32'),
(1671, '20.151.114.166', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-02 11:00:25', '2026-03-02 11:00:25'),
(1672, '103.102.13.25', 'https://www.tubagus.my.id', 'GET', 'Go-http-client/1.1', 'Indonesia', 'Legok', 'Central Java', '2026-03-02 11:13:27', '2026-03-02 11:13:27'),
(1673, '185.12.250.58', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Safari/605.1.1', 'Sweden', 'Stockholm', 'Stockholm County', '2026-03-02 13:02:26', '2026-03-02 13:02:26'),
(1674, '20.89.52.173', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Tokyo', 'Tokyo', '2026-03-02 13:03:23', '2026-03-02 13:03:23'),
(1675, '20.53.240.38', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Australia', 'The Rocks', 'New South Wales', '2026-03-02 13:11:36', '2026-03-02 13:11:36'),
(1676, '20.63.96.50', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Canada', 'Toronto', 'Ontario', '2026-03-02 14:17:19', '2026-03-02 14:17:19'),
(1677, '20.63.96.50', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Canada', 'Toronto', 'Ontario', '2026-03-02 14:17:47', '2026-03-02 14:17:47'),
(1678, '93.158.91.244', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-A415F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/23.0 Chrome/115.0.0.0 Mobile Safari/537.3', 'Sweden', 'Stockholm', 'Stockholm County', '2026-03-02 17:03:50', '2026-03-02 17:03:50'),
(1679, '93.158.91.242', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-A415F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/23.0 Chrome/115.0.0.0 Mobile Safari/537.3', 'Sweden', 'Stockholm', 'Stockholm County', '2026-03-02 17:03:51', '2026-03-02 17:03:51'),
(1680, '93.158.92.13', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-A415F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/23.0 Chrome/115.0.0.0 Mobile Safari/537.3', 'Sweden', 'Karlshamn', 'Blekinge County', '2026-03-02 17:03:53', '2026-03-02 17:03:53'),
(1681, '93.158.92.11', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-A415F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/23.0 Chrome/115.0.0.0 Mobile Safari/537.3', 'Sweden', 'Karlshamn', 'Blekinge County', '2026-03-02 17:03:58', '2026-03-02 17:03:58'),
(1682, '165.227.78.2', 'https://www.tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'United States', 'Clifton', 'New Jersey', '2026-03-02 19:02:25', '2026-03-02 19:02:25'),
(1683, '205.210.31.50', 'https://www.tubagus.my.id', 'GET', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'United States', 'Santa Clara', 'California', '2026-03-02 22:33:31', '2026-03-02 22:33:31'),
(1684, '20.89.52.173', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Japan', 'Tokyo', 'Tokyo', '2026-03-03 01:32:50', '2026-03-03 01:32:50'),
(1685, '74.7.227.41', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'United States', 'Atlanta', 'Georgia', '2026-03-03 02:41:56', '2026-03-03 02:41:56'),
(1686, '167.71.166.171', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', 'United States', 'Clifton', 'New Jersey', '2026-03-03 04:45:10', '2026-03-03 04:45:10'),
(1687, '147.182.210.101', 'https://www.tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'United States', 'North Bergen', 'New Jersey', '2026-03-03 06:16:35', '2026-03-03 06:16:35'),
(1688, '217.160.202.182', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'Germany', 'Frankfurt am Main', 'Hesse', '2026-03-03 08:06:34', '2026-03-03 08:06:34'),
(1689, '34.56.210.20', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'United States', 'Council Bluffs', 'Iowa', '2026-03-03 08:52:40', '2026-03-03 08:52:40'),
(1690, '20.220.211.162', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-03 09:42:14', '2026-03-03 09:42:14'),
(1691, '20.65.88.76', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'United States', 'Boydton', 'Virginia', '2026-03-03 10:07:24', '2026-03-03 10:07:24'),
(1692, '20.220.211.162', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'Canada', 'Toronto', 'Ontario', '2026-03-03 12:03:24', '2026-03-03 12:03:24'),
(1693, '192.36.226.103', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'Sweden', 'Stockholm', 'Stockholm County', '2026-03-03 17:03:37', '2026-03-03 17:03:37'),
(1694, '192.36.109.214', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'Sweden', 'Stockholm', 'Stockholm County', '2026-03-03 17:03:38', '2026-03-03 17:03:38'),
(1695, '192.121.146.24', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'Sweden', 'Stockholm', 'Stockholm County', '2026-03-03 17:03:40', '2026-03-03 17:03:40'),
(1696, '192.36.166.94', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'Sweden', 'Stockholm', 'Stockholm County', '2026-03-03 17:03:41', '2026-03-03 17:03:41'),
(1697, '5.182.17.159', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'France', 'Lauterbourg', 'Grand Est', '2026-03-03 18:13:56', '2026-03-03 18:13:56'),
(1698, '185.191.171.14', 'https://tubagus.my.id/forgot-password', 'GET', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'United States', 'Washington', 'District of Columbia', '2026-03-03 18:21:25', '2026-03-03 18:21:25'),
(1699, '109.199.112.7', 'https://tubagus.my.id/contact', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'France', 'Lauterbourg', 'Grand Est', '2026-03-03 18:44:15', '2026-03-03 18:44:15'),
(1700, '84.246.85.11', 'https://tubagus.my.id', 'GET', '2ip bot/1.1 (+https://2ip.io)', 'The Netherlands', 'Enschede', 'Overijssel', '2026-03-03 22:43:25', '2026-03-03 22:43:25'),
(1701, '84.246.85.11', 'https://tubagus.my.id', 'GET', '2ip bot/1.1 (+https://2ip.io)', 'The Netherlands', 'Enschede', 'Overijssel', '2026-03-03 22:43:28', '2026-03-03 22:43:28'),
(1702, '84.246.85.11', 'https://tubagus.my.id', 'GET', '2ip bot/1.1 (+https://2ip.io)', 'The Netherlands', 'Enschede', 'Overijssel', '2026-03-03 22:43:31', '2026-03-03 22:43:31'),
(1703, '181.177.86.29', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'United States', 'New York', 'New York', '2026-03-04 10:17:32', '2026-03-04 10:17:32'),
(1704, '20.219.132.149', 'https://tubagus.my.id/public/index.php', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'India', 'Pune', 'Maharashtra', '2026-03-04 12:36:14', '2026-03-04 12:36:14'),
(1705, '130.61.17.31', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (compatible; TechCrawler/1.0)', 'Germany', 'Frankfurt am Main', 'Hesse', '2026-03-04 13:07:41', '2026-03-04 13:07:41'),
(1706, '20.220.232.101', 'https://tubagus.my.id/public/index.php', 'GET', NULL, 'Canada', 'Toronto', 'Ontario', '2026-03-04 13:12:50', '2026-03-04 13:12:50'),
(1707, '35.212.243.216', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BuiltWith/1.4; rb.gy/xprgqj) Chrome/124.0.0.0 Safari/537.36', 'United States', 'The Dalles', 'Oregon', '2026-03-04 14:47:31', '2026-03-04 14:47:31'),
(1708, '35.212.243.216', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BuiltWith/1.4; rb.gy/xprgqj) Chrome/124.0.0.0 Safari/537.36', 'United States', 'The Dalles', 'Oregon', '2026-03-04 14:47:41', '2026-03-04 14:47:41'),
(1709, '54.196.145.210', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'United States', 'Ashburn', 'Virginia', '2026-03-04 16:14:38', '2026-03-04 16:14:38'),
(1710, '134.209.180.47', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 11.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:26', '2026-03-04 17:35:26'),
(1711, '134.209.180.47', 'https://tubagus.my.id/?author=1', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:42', '2026-03-04 17:35:42'),
(1712, '134.209.180.47', 'https://tubagus.my.id/?author=2', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:43', '2026-03-04 17:35:43'),
(1713, '134.209.180.47', 'https://tubagus.my.id/?author=3', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:45', '2026-03-04 17:35:45');
INSERT INTO `visitor_logs` (`id`, `ip_address`, `url`, `method`, `user_agent`, `country`, `city`, `region`, `created_at`, `updated_at`) VALUES
(1714, '134.209.180.47', 'https://tubagus.my.id/?author=4', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:46', '2026-03-04 17:35:46'),
(1715, '134.209.180.47', 'https://tubagus.my.id/?author=5', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:48', '2026-03-04 17:35:48'),
(1716, '134.209.180.47', 'https://tubagus.my.id/?author=6', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:49', '2026-03-04 17:35:49'),
(1717, '134.209.180.47', 'https://tubagus.my.id/?author=7', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:51', '2026-03-04 17:35:51'),
(1718, '134.209.180.47', 'https://tubagus.my.id/?rest_route=%2Fwp%2Fv2%2Fusers', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:53', '2026-03-04 17:35:53'),
(1719, '134.209.180.47', 'https://tubagus.my.id', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:55', '2026-03-04 17:35:55'),
(1720, '134.209.180.47', 'https://tubagus.my.id', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:35:59', '2026-03-04 17:35:59'),
(1721, '134.209.180.47', 'https://tubagus.my.id', 'GET', 'python-requests/2.32.5', 'United Kingdom', 'Slough', 'England', '2026-03-04 17:36:00', '2026-03-04 17:36:00'),
(1722, '103.165.122.130', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:38:50', '2026-03-04 20:38:50'),
(1723, '103.165.122.130', 'https://tubagus.my.id/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:44:00', '2026-03-04 20:44:00'),
(1724, '103.165.122.130', 'https://tubagus.my.id/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:44:22', '2026-03-04 20:44:22'),
(1725, '103.165.122.130', 'https://tubagus.my.id/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:44:23', '2026-03-04 20:44:23'),
(1726, '103.165.122.130', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:44:28', '2026-03-04 20:44:28'),
(1727, '103.165.122.130', 'https://tubagus.my.id/admin', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:45:09', '2026-03-04 20:45:09'),
(1728, '103.165.122.130', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:45:11', '2026-03-04 20:45:11'),
(1729, '103.165.122.130', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:49:17', '2026-03-04 20:49:17'),
(1730, '103.165.122.130', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:50:16', '2026-03-04 20:50:16'),
(1731, '103.165.122.130', 'https://tubagus.my.id', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 20:50:53', '2026-03-04 20:50:53'),
(1732, '103.165.122.130', 'https://tubagus.my.id/projects/budget-investment-system', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Indonesia', 'Jakarta', 'Jakarta', '2026-03-04 21:12:12', '2026-03-04 21:12:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `automation_strategies`
--
ALTER TABLE `automation_strategies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_process_flows`
--
ALTER TABLE `business_process_flows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `committee_activities`
--
ALTER TABLE `committee_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_profiles`
--
ALTER TABLE `company_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_descriptions`
--
ALTER TABLE `job_descriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obstacle_challenges`
--
ALTER TABLE `obstacle_challenges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization_structures`
--
ALTER TABLE `organization_structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_structures_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_slug_unique` (`slug`),
  ADD KEY `projects_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `automation_strategies`
--
ALTER TABLE `automation_strategies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `business_process_flows`
--
ALTER TABLE `business_process_flows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `committee_activities`
--
ALTER TABLE `committee_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company_profiles`
--
ALTER TABLE `company_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_descriptions`
--
ALTER TABLE `job_descriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `obstacle_challenges`
--
ALTER TABLE `obstacle_challenges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `organization_structures`
--
ALTER TABLE `organization_structures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `technologies`
--
ALTER TABLE `technologies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1733;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `organization_structures`
--
ALTER TABLE `organization_structures`
  ADD CONSTRAINT `organization_structures_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `organization_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
