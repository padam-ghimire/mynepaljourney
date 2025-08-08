-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2025 at 03:19 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travela_empty`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@example.com', 'admin', NULL, '635ce2abe4bf81667031723.png', '$2y$10$ZOWPSwbB7098UQHq/GZX5uGq43wfuDDjMBNASktSNK55T/4jC/xvy', 'FrA2uLrfffE8UbWyee6LFQlqaABVPt5Ag9iCLUraHeor7i09qdFd1XnVZS5t', NULL, '2023-01-14 08:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `agency_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE `agencies` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ref_by` int UNSIGNED NOT NULL DEFAULT '0',
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `kyc_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: mobile unverified, 1: mobile verified',
  `reg_step` tinyint(1) NOT NULL DEFAULT '0',
  `ver_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ban_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agency_password_resets`
--

CREATE TABLE `agency_password_resets` (
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=inactive,1=active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `who` bigint UNSIGNED NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `main_amo` decimal(28,8) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reffer_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `tour_booking_id` bigint NOT NULL,
  `method_code` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method_currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amo` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `btc_amo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `btc_wallet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `try` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT '0',
  `admin_feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `shortcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'object',
  `support` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Live Chat(Tawk.to)', 'Key location is shown bellow', 'chat-png.png', '<script>\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\n                        (function(){\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\n                        s1.async=true;\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\n                        s1.charset=\"UTF-8\";\n                        s1.setAttribute(\"crossorigin\",\"*\");\n                        s0.parentNode.insertBefore(s1,s0);\n                        })();\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"55\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2023-03-22 06:04:56'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha2.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2022-05-08 04:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `form_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(2, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number_22\":{\"name\":\"NID Number 22\",\"label\":\"nid_number_22\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"},\"sadfg\":{\"name\":\"sadfg\",\"label\":\"sadfg\",\"is_required\":\"optional\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"asdf\":{\"name\":\"asdf\",\"label\":\"asdf\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"Test2\",\"Test3\"],\"type\":\"select\"},\"nid_number_226985\":{\"name\":\"NID Number 226985\",\"label\":\"nid_number_226985\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"Test 2\",\"Test 3\"],\"type\":\"checkbox\"},\"nid_number_3333\":{\"name\":\"NID Number 3333\",\"label\":\"nid_number_3333\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"asdf\"],\"type\":\"radio\"},\"nid_number_3333587\":{\"name\":\"NID Number 3333587\",\"label\":\"nid_number_3333587\",\"is_required\":\"optional\",\"extensions\":\"jpg,bmp,png,pdf\",\"options\":[],\"type\":\"file\"}}', '2022-03-16 01:09:49', '2022-03-17 00:02:54'),
(3, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number_226985\":{\"name\":\"NID Number 226985\",\"label\":\"nid_number_226985\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-16 04:32:29', '2022-03-16 04:35:32'),
(5, 'withdraw_method', '{\"nid_number_33\":{\"name\":\"NID Number 33\",\"label\":\"nid_number_33\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-17 00:45:35', '2022-03-17 00:53:17'),
(6, 'withdraw_method', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-17 00:47:04', '2022-03-17 00:47:04'),
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2022-04-11 03:23:40'),
(8, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-21 07:53:25', '2022-03-21 07:53:25'),
(9, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-21 07:54:15', '2022-03-21 07:54:15'),
(10, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-21 07:55:15', '2022-03-21 07:55:22'),
(11, 'withdraw_method', '{\"nid_number_2658\":{\"name\":\"NID Number 2658\",\"label\":\"nid_number_2658\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"asdf\"],\"type\":\"checkbox\"}}', '2022-03-22 00:14:09', '2022-03-22 00:14:18'),
(12, 'withdraw_method', '[]', '2022-03-30 09:03:12', '2022-03-30 09:03:12'),
(13, 'withdraw_method', '{\"bank_name\":{\"name\":\"Bank Name\",\"label\":\"bank_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_name\":{\"name\":\"Account Name\",\"label\":\"account_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_number\":{\"name\":\"Account Number\",\"label\":\"account_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2022-03-30 09:09:11', '2022-09-28 04:05:20'),
(14, 'withdraw_method', '{\"mobile_number\":{\"name\":\"Mobile Number\",\"label\":\"mobile_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2022-03-30 09:10:12', '2022-09-29 09:55:20'),
(15, 'manual_deposit', '{\"send_from_number\":{\"name\":\"Send From Number\",\"label\":\"send_from_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-30 09:15:27', '2022-03-30 09:15:27'),
(16, 'manual_deposit', '{\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,pdf,docx\",\"options\":[],\"type\":\"file\"}}', '2022-03-30 09:16:43', '2022-04-11 03:19:54'),
(17, 'manual_deposit', '[]', '2022-03-30 09:21:19', '2022-03-30 09:21:19'),
(18, 'manual_deposit', '{\"asdfasddf\":{\"name\":\"asdfasddf\",\"label\":\"asdfasddf\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-09-28 04:50:55', '2022-09-28 04:50:55'),
(19, 'manual_deposit', '{\"sadf\":{\"name\":\"sadf\",\"label\":\"sadf\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"}}', '2022-09-28 05:13:04', '2022-09-28 05:13:59'),
(20, 'manual_deposit', '{\"transaction_id\":{\"name\":\"Transaction ID\",\"label\":\"transaction_id\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-05-27 02:50:43', '2023-05-27 02:50:43'),
(21, 'manual_deposit', '{\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2025-03-11 17:26:30', '2025-04-22 17:46:33'),
(22, 'agency_kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_values` longtext COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"services\",\"Affordable tour deals\",\"Customized tour planning\",\"Holiday packages\",\"Group tour booking\",\"Last-minute travel deals\"],\"description\":\"Discover the world with WanderQuest! Book customizable world tour packages to Europe, Asia, America &amp; beyond\\u2014easy online booking, trusted agencies, unforgettable journeys.\",\"social_title\":\"Travela\",\"social_description\":\"Discover the world your way with WanderQuest, a modern tour package booking website designed to make travel planning easy, exciting, and personalized. Whether you\'re dreaming of a peaceful beach escape, an adventurous mountain trek, or a cultural city tour, WanderQuest connects you with curated travel experiences from trusted agencies.\\r\\n\\r\\nExplore a wide range of tour packages with detailed itineraries, real customer reviews, high-quality images, and flexible date options. Filter your search by location, category, group size, and budget to find the perfect match. Book with confidence, manage your bookings effortlessly, and get ready to create memories that last a lifetime.\",\"image\":\"68207f43ba2dc1746960195.png\"}', '2020-07-04 23:42:52', '2025-05-18 01:27:59'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Latest Newsddd\",\"subheading\":\"dddd\",\"description\":\"fdg sdfgsdf g gggddd\",\"about_icon\":\"<i class=\\\"fab fa-accusoft\\\"><\\/i>\",\"background_image\":\"60951a84abd141620384388.png\",\"about_image\":\"5f9914e907ace1603867881.jpg\"}', '2020-10-28 00:51:20', '2023-05-10 02:06:51'),
(25, 'blog.content', '{\"title\":\"Our Blog\",\"heading\":\"Travel News and Views\",\"sub_heading\":\"Stay in the loop with the latest news, travel tips, and updates! By subscribing to our newsletter, you\'ll get access to exclusive article.\"}', '2020-10-28 00:51:34', '2025-05-21 12:12:07'),
(27, 'contact_us.content', '{\"title\":\"Auctor gravida vestibulu\",\"short_details\":\"Discover breathtaking destinations, experience unforgettable adventures, and create memories that last a lifetime.\",\"email_address\":\"admin@test.com\",\"contact_details\":\"USA, Anniston, Federal\",\"contact_number\":\"9876897689698\",\"latitude\":\"37.156141\",\"longitude\":\"-79.8281112\",\"website_footer\":\"<p>Copyright 2025. All rights reserved.<\\/p>\"}', '2020-10-28 00:59:19', '2025-05-21 12:15:59'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2020-11-12 04:07:30', '2025-03-15 20:30:44'),
(41, 'cookie.data', '{\"short_desc\":\"We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \\\"Accept\\\", you consent to our use of cookies.\",\"description\":\"<h5><strong>GDPR and Privacy Compliance Statement<\\/strong><\\/h5><p>At [Your Travel Company], we take your privacy seriously. As part of our commitment to safeguarding your personal information, we comply with the General Data Protection Regulation (GDPR) and other applicable privacy laws.<\\/p><p>We collect only the essential data needed to provide you with seamless booking experiences, help you discover new travel packages, and ensure smooth communication. Your information will never be shared with unauthorized third parties, and we\\u2019re transparent about how your data is used.<\\/p><p>You have full control over your personal data. You can access, update, or delete it at any time. Your trust is crucial to us, and we\\u2019re dedicated to protecting your privacy.<\\/p><p>&nbsp;<\\/p><h5><strong>Cookies Policy<\\/strong><\\/h5><p>To enhance your browsing experience, [Your Travel Company] uses cookies on our website. Cookies are small files stored on your device that help us remember your preferences, improve functionality, and provide you with a more personalized experience.<\\/p><p>&nbsp;<\\/p><h5><strong>Types of Cookies We Use:<\\/strong><\\/h5><ul><li><strong>Essential Cookies:<\\/strong> These cookies are necessary for core functionalities like booking your travel packages, processing payments, and securely logging you in.<\\/li><li><strong>Performance Cookies:<\\/strong> These cookies help us understand how you use our site, so we can make improvements and deliver a better experience.<\\/li><li><strong>Functional Cookies:<\\/strong> These cookies remember your preferences, such as language and location settings, to personalize your experience.<\\/li><li><strong>Advertising Cookies:<\\/strong> These cookies allow us to show you relevant travel promotions and measure ad performance to improve our advertising.<\\/li><\\/ul><h5><strong>How We Protect Your Data<\\/strong><\\/h5><p>We use industry-standard encryption and security practices to protect your personal information. All third-party partners, including payment processors and service providers, also comply with GDPR and similar legal requirements to safeguard your data.<\\/p><h4>&nbsp;<\\/h4><h5><strong>Our Commitment to Compliance<\\/strong><\\/h5><p>We regularly review and update our data protection policies to stay aligned with GDPR and evolving privacy laws. If you have any questions or concerns about your data or how we handle cookies, please contact us.<\\/p>\",\"status\":0}', '2020-07-04 23:42:52', '2025-05-20 19:04:35'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<p>At <strong>Travela<\\/strong>, your privacy is our priority. This Privacy Policy explains how we collect, use, protect, and share your personal information when you visit our website or use our services.<\\/p><h5><strong>1. Information We Collect<\\/strong><\\/h5><p>We may collect the following types of information:<\\/p><ul><li><strong>Personal Information<\\/strong>: Name, email address, phone number, billing address, passport details (if required for booking), etc.<\\/li><li><strong>Booking Information<\\/strong>: Tour preferences, selected packages, payment history.<\\/li><li><strong>Technical Information<\\/strong>: IP address, browser type, device information, location data.<\\/li><li><strong>Usage Data<\\/strong>: Pages visited, time spent, and other behavior on our website.<\\/li><\\/ul><h5><strong>2. How We Use Your Information<\\/strong><\\/h5><p>We use your data to:<\\/p><ul><li>Process your bookings and manage your account<\\/li><li>Improve our website and services<\\/li><li>Send you confirmations, updates, and promotional offers (only if you opt-in)<\\/li><li>Ensure compliance with legal obligations<\\/li><\\/ul><h5><strong>3. How We Protect Your Information<\\/strong><\\/h5><p>We implement appropriate technical and organizational measures to safeguard your personal data from unauthorized access, disclosure, or destruction.<\\/p><h5><strong>4. Sharing Your Information<\\/strong><\\/h5><ul><li>We may share your information with:<\\/li><li>Trusted third-party service providers (e.g., payment gateways, travel partners)<\\/li><li>Legal authorities when required by law<\\/li><li>Our business partners for tour arrangements<\\/li><li>We never sell your personal data to third parties.<\\/li><\\/ul><p>At WanderQuest, we value your trust and are committed to protecting your personal information. Our privacy policy outlines how we collect, use, and safeguard your data when you browse our site or book a tour package. We only use your information to provide better service and never share or sell it without your consent. Your privacy is our priority.<\\/p>\"}', '2021-06-09 08:50:42', '2025-05-19 21:09:42'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<p>By using <strong>Travela<\\/strong>, you agree to our terms and conditions. These include guidelines for booking, payments, cancellations, and user responsibilities. We ensure transparent pricing and accurate tour details, but final itineraries may change due to unforeseen circumstances. Users must provide accurate information during bookings. Please read our full terms to understand your rights and obligations when using our services.<\\/p><p>\\u00a0<\\/p><h5><strong>Booking Confirmation<\\/strong><\\/h5><ul><li>All bookings are subject to availability and are confirmed only after full or partial payment.<\\/li><\\/ul><h5><strong>Payment Terms<\\/strong><\\/h5><ul><li>Payment must be made via our approved payment methods. Final prices include all applicable taxes and fees unless stated otherwise.<\\/li><\\/ul><h5><strong>Booking &amp; Payment<\\/strong><\\/h5><ul><li>Bookings are confirmed only after receiving full or partial payment.<\\/li><li>Prices include applicable taxes unless stated otherwise.<\\/li><li>Accepted payment methods are listed on the website.<\\/li><\\/ul><h5><strong>User Responsibilities<\\/strong><\\/h5><ul><li>Users must provide accurate personal and travel details.<\\/li><li>Compliance with local laws and regulations is required during tours.<\\/li><li>Customers are responsible for their own travel documents (passport, visa, etc.).<\\/li><\\/ul><h5><strong>Liability &amp; Safety<\\/strong><\\/h5><ul><li>WanderQuest is not liable for delays, losses, or injuries caused by third-party vendors or uncontrollable events (e.g., natural disasters).<\\/li><li>Users participate in tours at their own risk, especially for adventure activities.<\\/li><\\/ul><p>They include guidelines on booking confirmations, payment methods, cancellation policies, itinerary changes, user responsibilities, and our liability. It\\u2019s important to read and understand these terms before proceeding with any booking or use of our services. If you have any questions or concerns, please feel free to contact us.<\\/p>\"}', '2021-06-09 08:51:18', '2025-05-20 19:05:04'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', '2020-07-04 23:42:52', '2022-05-11 03:57:17'),
(57, 'artist.content', '{\"heading\":\"Top Seller\"}', '2025-03-15 17:00:48', '2025-03-15 17:08:46'),
(58, 'featured.content', '{\"heading\":\"Featured\"}', '2025-03-15 17:21:00', '2025-03-15 17:21:00'),
(62, 'faq.content', '{\"title\":\"Our Faq\",\"heading\":\"Frequently Asked Questions.\",\"sub_heading\":\"Find answers to some of the most frequently asked questions from our travelers.\"}', '2025-03-15 18:17:12', '2025-04-27 21:24:09'),
(63, 'faq.element', '{\"question\":\"What inspires your chaotic brushstrokes?\",\"answer\":\"<p>The streets of Soho\\u2014gritty, loud, alive. I watch the way shadows twist around cast-iron buildings and how people move like paint splattered on a canvas. Chaos is my muse; it\\u2019s the pulse of this city.<\\/p>\"}', '2025-03-15 18:18:04', '2025-03-15 18:18:04'),
(64, 'faq.element', '{\"question\":\"Why do you only paint at night?\",\"answer\":\"<p>Daylight\\u2019s too polite. Nighttime in Soho strips away the veneer\\u2014neon buzzes, voices echo, and the air feels raw. That\\u2019s when the real colors come out, begging to be caught on canvas.<\\/p>\"}', '2025-03-15 18:18:13', '2025-03-15 18:18:13'),
(65, 'faq.element', '{\"question\":\"How do you pick your materials?\",\"answer\":\"<p>I scavenger-hunt through Soho\\u2019s art supply haunts\\u2014oils from that cramped shop on Wooster, canvas stretched by hand at my Brooklyn factory hookup. Quality matters, but it\\u2019s gotta feel like it\\u2019s got a story.<\\/p>\"}', '2025-03-15 18:18:21', '2025-03-15 18:18:21'),
(66, 'faq.element', '{\"question\":\"Do you ever get tired of the Soho scene?\",\"answer\":\"<p>Nah, it\\u2019s a circus\\u2014galleries, street vendors, pretentious coffee shops. Tires me out sometimes, sure, but it\\u2019s fuel. I\\u2019d rather overdose on that than fade out in silence somewhere else.<\\/p>\"}', '2025-03-15 18:18:35', '2025-03-15 18:18:35'),
(67, 'faq.element', '{\"question\":\"How long does a piece take you?\",\"answer\":\"<p>Could be three hours or three months. Time\\u2019s irrelevant when the paint\\u2019s wet. I stop when it stops screaming at me\\u2014or when the landlord bangs on the door.<\\/p>\"}', '2025-03-15 18:18:47', '2025-03-15 18:18:47'),
(68, 'faq.element', '{\"question\":\"Why no digital art?\",\"answer\":\"<p>I like the mess\\u2014smudges on my hands, the smell of turpentine. Digital\\u2019s too clean for what I\\u2019m chasing. Soho taught me grit over gloss.<\\/p>\"}', '2025-03-15 18:18:53', '2025-03-15 18:18:53'),
(69, 'faq.element', '{\"question\":\"What\\u2019s your dream project?\",\"answer\":\"<p>A massive mural on a Soho rooftop\\u2014something you\\u2019d see from a fire escape, dripping with color, loud enough to drown out the traffic. Art that fights to be noticed.<\\/p>\"}', '2025-03-15 18:19:11', '2025-03-15 18:19:11'),
(70, 'faq.element', '{\"question\":\"How do you handle art block?\",\"answer\":\"<p>I don\\u2019t. I walk\\u2014down Prince Street, past the graffiti, the bodegas, the tourists gawking at nothing. Soho\\u2019s chaos shakes me loose. If that fails, I throw paint at the wall until something sticks.<\\/p>\"}', '2025-03-15 18:19:59', '2025-03-15 18:19:59'),
(71, 'testimonial.content', '{\"title\":\"Client Feedback\",\"heading\":\"What Client Says About Us\",\"sub_heading\":\"Our clients\' experiences speak volumes. Here\'s what they have to say about their unforgettable journeys with us.\"}', '2025-03-15 18:53:51', '2025-04-27 06:01:05'),
(72, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Priya Sharma\",\"designation\":\"Graphic Designer\",\"description\":\"Working with this team was an absolute pleasure! Their creativity and attention to detail transformed my vision into a masterpiece that exceeded all expectations.\",\"star_count\":\"5.0\",\"client_image\":\"67d683e8a3d4b1742111720.png\"}', '2025-03-15 18:55:20', '2025-04-09 01:54:22'),
(73, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Arjun Das\",\"designation\":\"Marketing Manager\",\"description\":\"The service was top-notch, and the final artwork truly captured the essence of what I wanted. I\\u2019d recommend them to anyone looking for quality and professionalism.\",\"star_count\":\"4\",\"client_image\":\"67d68405282f21742111749.png\"}', '2025-03-15 18:55:49', '2025-03-15 18:55:49'),
(74, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Fatima Khan\",\"designation\":\"Business Owner\",\"description\":\"I was blown away by how quickly they delivered such high-quality work. It\\u2019s rare to find such dedication and skill in one package!\",\"star_count\":\"5.0\",\"client_image\":\"67d6843415b1b1742111796.png\"}', '2025-03-15 18:56:36', '2025-04-09 01:54:46'),
(75, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Rohan Patel\",\"designation\":\"Freelance Illustrator\",\"description\":\"Their innovative approach and willingness to listen made all the difference. My project wouldn\\u2019t have been the same without their expertise.\",\"star_count\":\"4\",\"client_image\":\"67d6845b6e5a81742111835.png\"}', '2025-03-15 18:57:15', '2025-03-15 18:57:15'),
(76, 'footer_company_links.element', '{\"title\":\"Blog\",\"url\":\"\\/blog\"}', '2025-03-15 20:13:01', '2025-04-09 17:00:34'),
(77, 'footer_company_links.element', '{\"title\":\"About\",\"url\":\"\\/about\"}', '2025-03-15 20:13:09', '2025-04-09 17:01:03'),
(78, 'footer_company_links.element', '{\"title\":\"Contact\",\"url\":\"\\/contact\"}', '2025-03-15 20:13:17', '2025-04-09 17:02:36'),
(79, 'footer_important_links.element', '{\"title\":\"Home\",\"url\":\"\\/\"}', '2025-03-15 20:13:50', '2025-04-09 17:01:38'),
(80, 'footer_important_links.element', '{\"title\":\"Tours\",\"url\":\"\\/browse\"}', '2025-03-15 20:14:05', '2025-05-20 21:05:11'),
(81, 'footer_important_links.element', '{\"title\":\"Cookie Policy\",\"url\":\"\\/cookie-policy\"}', '2025-03-15 20:14:17', '2025-05-19 18:20:13'),
(82, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', '2025-03-15 20:31:22', '2025-03-15 20:31:22'),
(83, 'social_icon.element', '{\"title\":\"X\",\"social_icon\":\"<i class=\\\"fa-brands fa-x-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/x.com\\/home\"}', '2025-03-15 20:31:51', '2025-04-09 17:03:17'),
(84, 'social_icon.element', '{\"title\":\"LinkedIn\",\"social_icon\":\"<i class=\\\"fab fa-linkedin\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\\/\"}', '2025-03-15 20:32:43', '2025-03-15 20:32:43'),
(85, 'banner.element', '{\"has_image\":\"1\",\"banner_image\":\"67f662c2287471744200386.jpg\"}', '2025-04-08 23:06:26', '2025-04-08 23:06:26'),
(86, 'banner.element', '{\"has_image\":\"1\",\"banner_image\":\"67f66b31373261744202545.jpg\"}', '2025-04-08 23:42:25', '2025-04-08 23:42:25'),
(87, 'banner.element', '{\"has_image\":\"1\",\"banner_image\":\"67f671cee7b101744204238.jpg\"}', '2025-04-08 23:42:32', '2025-04-09 00:10:39'),
(88, 'banner.element', '{\"has_image\":\"1\",\"banner_image\":\"67f671c580fb31744204229.jpg\"}', '2025-04-08 23:42:41', '2025-04-09 00:10:29'),
(89, 'banner.element', '{\"has_image\":\"1\",\"banner_image\":\"67f66b4d237b71744202573.jpg\"}', '2025-04-08 23:42:53', '2025-04-08 23:42:53'),
(90, 'banner.element', '{\"has_image\":\"1\",\"banner_image\":\"67f66b5d3de611744202589.jpg\"}', '2025-04-08 23:43:09', '2025-04-08 23:43:09'),
(91, 'why_choose_us.content', '{\"title\":\"Why Choose Us\",\"heading\":\"What are our Advantages\",\"sub_heading\":\"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration\",\"has_image\":\"1\",\"image_one\":\"67f67a1bc6baa1744206363.png\",\"image_two\":\"67f76b196e4c61744268057.png\",\"image_three\":\"67f76b199ecbc1744268057.png\"}', '2025-04-09 00:46:03', '2025-04-09 17:54:17'),
(92, 'why_choose_us.element', '{\"title\":\"Expert Guidance\",\"description\":\"Local guides share culture, history, and hidden attractions often missed.\"}', '2025-04-09 00:50:45', '2025-05-06 17:29:48'),
(93, 'why_choose_us.element', '{\"title\":\"Cost-Effectiveness\",\"description\":\"Group tours get better deals, saving money on travel essentials.\"}', '2025-04-09 00:51:08', '2025-05-06 17:30:10'),
(94, 'why_choose_us.element', '{\"title\":\"Safety and Security\",\"description\":\"Group travel lowers risks in unfamiliar or remote, unsafe destinations.\"}', '2025-04-09 00:51:23', '2025-05-06 17:30:47'),
(95, 'popular_tour.content', '{\"title\":\"Popular Tours\",\"heading\":\"Most Popular Tours\",\"sub_heading\":\"For whatever matters most, make it easier for potential customers to find your business with adline Ads.\"}', '2025-04-09 01:03:14', '2025-04-09 01:03:14'),
(96, 'how_it_work.content', '{\"title\":\"How It Works\",\"heading\":\"Hassle Free Booking, Plan in Minutes\",\"sub_heading\":\"A Simple Guide to Your Seamless Journey \\u2013 Follow These Easy Steps to Book Your Next Adventure!\"}', '2025-04-09 01:07:28', '2025-05-22 01:12:14'),
(97, 'how_it_work.element', '{\"title\":\"Select Tour Package\",\"description\":\"Choose your favorite place to start your journey.\",\"icon\":\"<i class=\\\"far fa-hand-pointer\\\"><\\/i>\"}', '2025-04-09 01:12:13', '2025-05-22 01:13:12'),
(98, 'how_it_work.element', '{\"title\":\"Book with Number of Person\",\"description\":\"Book your tour easily in just a few clicks.\",\"icon\":\"<i class=\\\"fas fa-calendar-alt\\\"><\\/i>\"}', '2025-04-09 01:12:43', '2025-05-22 01:12:59'),
(99, 'how_it_work.element', '{\"title\":\"Enjoy Our Tour\",\"description\":\"Relax, explore, and create unforgettable memories!\",\"icon\":\"<i class=\\\"far fa-thumbs-up\\\"><\\/i>\"}', '2025-04-09 01:13:11', '2025-04-27 05:53:58'),
(100, 'top_destination.content', '{\"title\":\"Top Destinations\",\"heading\":\"Locations to Explore\",\"sub_heading\":\"Explore a curated list of the world\\u2019s most stunning locations, offering experiences, and breathtaking landscapes.\"}', '2025-04-09 01:22:10', '2025-05-22 01:23:09'),
(101, 'our_best_offer.content', '{\"title\":\"Our Best Offer\",\"heading\":\"Offers To Inspire You\",\"sub_heading\":\"Discover exclusive deals and special offers that will spark your wanderlust. From discounted rates to limited-time promotion.\",\"left_discount_title\":\"Discount 30% off\",\"left_heading\":\"Best deals Staycation\",\"left_button_name\":\"Book Now\",\"left_button_url\":\"http:\\/\\/localhost\\/tour-manage\\/browse\",\"right_discount_title\":\"Discount 50% off\",\"right_heading\":\"Tours and Trip Packages, Globally\",\"right_button_name\":\"Book Now\",\"right_button_url\":\"http:\\/\\/localhost\\/tour-manage\\/browse\",\"has_image\":\"1\",\"left_image\":\"67f769a59d9fe1744267685.png\",\"right_image\":\"67f769a5b96c41744267685.png\"}', '2025-04-09 01:25:15', '2025-04-27 06:00:05'),
(102, 'banner.content', '{\"title\":\"Let\\u2019s Discover The World !\",\"heading\":\"Explore More,Travel Smart!\",\"sub_heading\":\"Save up to 50% on the best attractions, tours and activities with Havezic\"}', '2025-04-09 01:59:32', '2025-04-09 01:59:32'),
(103, 'about_me.content', '{\"title\":\"About Us\",\"heading\":\"Discover Our Story\",\"sub_heading\":\"Passionate Travelers, Just Like You \\u2013 We understand the joy of exploring new places, and we\'re here to make your travel experiences unforgettable.\",\"has_image\":\"1\",\"left_image\":\"67f796f8741141744279288.png\",\"middle_image\":\"67f796f87c9bd1744279288.png\",\"right_image\":\"67f796f89ec1d1744279288.png\"}', '2025-04-09 21:01:28', '2025-04-27 21:17:56'),
(104, 'about_me.element', '{\"title\":\"Lots of Choices\",\"description\":\"Our experienced and friendly guides are here to make your journey unforgettable.\"}', '2025-04-09 21:01:49', '2025-04-27 21:21:01'),
(105, 'about_me.element', '{\"title\":\"Easy Booking\",\"description\":\"Booking your dream tour is just a few clicks away. Simple and hassle-free!\"}', '2025-04-09 21:14:15', '2025-04-27 21:21:47'),
(106, 'about_me.element', '{\"title\":\"Best Tour Guide\",\"description\":\"With a variety of destinations and activities, there\\u2019s a tour for every traveler.\"}', '2025-04-09 21:14:29', '2025-04-27 21:22:14'),
(107, 'counter.element', '{\"counter_number\":\"28\",\"counter_text\":\"M\",\"counter_heading\":\"Active Customers\"}', '2025-04-09 21:40:50', '2025-04-09 21:40:50'),
(108, 'counter.element', '{\"counter_number\":\"89\",\"counter_text\":\"K\",\"counter_heading\":\"Total Customers\"}', '2025-04-09 21:41:05', '2025-04-09 21:41:05'),
(109, 'counter.element', '{\"counter_number\":\"53\",\"counter_text\":\"M\",\"counter_heading\":\"Positive Reviews\"}', '2025-04-09 21:41:20', '2025-04-09 21:41:20'),
(110, 'counter.element', '{\"counter_number\":\"60\",\"counter_text\":\"%\",\"counter_heading\":\"Global coverage\"}', '2025-04-09 21:41:39', '2025-04-09 21:41:39'),
(112, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Ocean beaches\",\"quote\":\"Ocean beaches are typically covered in sand, which can vary in texture and color depending on the region.\",\"description\":\"<p>Ocean beaches are typically covered in sand, which can vary in texture and color depending on the region. The sand is often made up of tiny fragments of rocks, shells, and coral that have been broken down over time by the movement of water<\\/p><p>\\u00a0<\\/p><p>Ocean beaches are typically covered in sand, which can vary in texture and color depending on the region. The sand is often made up of tiny fragments of rocks, shells, and coral that have been broken down over time by the movement of water<\\/p>\",\"blog_image\":\"682b33d33dd6c1747661779.jpg\"}', '2025-05-18 22:14:52', '2025-05-19 10:40:57'),
(113, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"A Japanese street\",\"quote\":\"Japan is the only country where the future feels like the past and the past feels like the future.\",\"description\":\"<p>A <strong>sodo<\\/strong> (\\u8349\\u9053) refers to a type of path or road in Japan that is traditionally associated with natural, rural, or spiritual settings. The term itself combines <strong>\\\"s\\u014d\\\" (\\u8349)<\\/strong>, meaning grass or plants, and <strong>\\\"d\\u014d\\\" (\\u9053)<\\/strong>, meaning way or path. While there\\u2019s no strict, universally agreed-upon definition, a sodo is often thought of as a scenic or meditative path, usually one that leads through nature, often involving grass, plants, or trees.<\\/p><p>\\u00a0<\\/p><p>Sodo paths have long been a part of Japanese culture, particularly within the context of Zen Buddhism, where walking meditation plays an important role. These paths are not merely functional roads but are imbued with a sense of peace, reflection, and connection to nature. Walking a sodo is a meditative experience, guiding individuals through areas that are quiet and isolated, offering time for contemplation or spiritual reflection.<\\/p><p>In many ways, a sodo is designed to bring the walker into harmony with their surroundings. The path may wind through forests, meadows, or along rivers, surrounded by lush vegetation, and often features simple yet elegant elements such as stone lanterns, water features, or traditional wooden bridges. These features create an atmosphere that encourages mindfulness and peaceful contemplation.<\\/p><p>\\u00a0<\\/p><p><strong>Stunning Natural Beauty<\\/strong>:<\\/p><ul><li>Known for dramatic landscapes shaped by fire and ice.<\\/li><li>Features erupting volcanoes, cascading waterfalls, vast glaciers, and black sand beaches.<\\/li><li>Located in the North Atlantic, just south of the Arctic Circle.<\\/li><\\/ul><p>The Laugavegur trail, one of the most popular treks, takes you through a spectacular range of landscapes, including rhyolite mountains, hot springs, and glacial rivers. Reykjavik, the capital, is a modern city with a lively arts and culture scene, offering everything from contemporary galleries to traditional music festivals. Iceland\\u2019s rich history and Viking heritage are evident in the local museums and landmarks.<\\/p>\",\"blog_image\":\"682b30f3cc25a1747661043.jpg\"}', '2025-05-19 10:20:00', '2025-05-19 10:24:03'),
(114, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Occen of water\",\"quote\":\"One of Iceland\\u2019s most iconic features is its geothermal activity, with hot springs and geysers scattered throughout the country.\",\"description\":\"<p>Iceland is a stunning country known for its dramatic landscapes, geothermal wonders, and vibrant culture. It\\u2019s a place where nature\\u2019s power is on full display, from erupting volcanoes to cascading waterfalls, vast glaciers, and black sand beaches. The island is situated in the North Atlantic, just south of the Arctic Circle, offering a unique environment shaped by both fire and ice.<\\/p><p>\\u00a0<\\/p><p>One of Iceland\\u2019s most iconic features is its geothermal activity, with hot springs and geysers scattered throughout the country. The famous Blue Lagoon, a geothermal spa located near Reykjavik, is known for its rejuvenating properties and striking milky blue waters. Iceland also offers the chance to witness the breathtaking Northern Lights, a natural light display that dances across the winter skies.<\\/p><p>\\u00a0<\\/p><p>The island\\u2019s volcanic landscape is rich with craters, lava fields, and black sand beaches, with places like the Vatnaj\\u00f6kull glacier and the active volcanoes of the Reykjanes Peninsula. For hiking enthusiasts, Iceland is a paradise, offering trails that weave through volcanic terrains, glaciers, and fjords.\\u00a0<\\/p><p>\\u00a0<\\/p><p><strong>Stunning Natural Beauty<\\/strong>:<\\/p><ul><li>Known for dramatic landscapes shaped by fire and ice.<\\/li><li>Features erupting volcanoes, cascading waterfalls, vast glaciers, and black sand beaches.<\\/li><li>Located in the North Atlantic, just south of the Arctic Circle.<\\/li><\\/ul><p>The Laugavegur trail, one of the most popular treks, takes you through a spectacular range of landscapes, including rhyolite mountains, hot springs, and glacial rivers. Reykjavik, the capital, is a modern city with a lively arts and culture scene, offering everything from contemporary galleries to traditional music festivals. Iceland\\u2019s rich history and Viking heritage are evident in the local museums and landmarks.<\\/p>\",\"blog_image\":\"682b319f7b2451747661215.jpg\"}', '2025-05-19 10:26:55', '2025-05-19 10:26:55'),
(115, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Sandy Shoreline of Ocean\",\"quote\":\"ocean beach is a beautiful natural area where land meets the sea, creating a dynamic and constantly changing environment\",\"description\":\"<p><strong>ocean beach<\\/strong> is a beautiful natural area where land meets the sea, creating a dynamic and constantly changing environment. It is a place where the vastness of the ocean meets the shore, often characterized by sandy expanses, crashing waves, and diverse wildlife. Ocean beaches can be found all over the world, from tropical islands to temperate coasts and even more rugged, cold shores.<\\/p><p><strong>Sandy Shoreline<\\/strong>:<\\/p><p>Ocean beaches are typically covered in sand, which can vary in texture and color depending on the region. The sand is often made up of tiny fragments of rocks, shells, and coral that have been broken down over time by the movement of water.<\\/p><p>Some beaches may have fine, powdery sand, while others may feature coarser grains or even pebbles.<\\/p><p><strong>Waves and Surf<\\/strong>:<\\/p><p>One of the most defining characteristics of an ocean beach is the rhythmic sound of waves crashing onto the shore. The waves are created by the movement of the water driven by wind patterns and the gravitational pull of the moon.<\\/p><p>The size and intensity of the waves can vary, creating excellent conditions for water sports like surfing, swimming, and bodyboarding. Some beaches are renowned for their surf culture, attracting surfers from around the world.<\\/p><p><strong>Tidal Zones<\\/strong>:<\\/p><p>Ocean beaches are influenced by tides, with the water level rising and falling over the course of the day. This creates tidal zones where the beach is either exposed or submerged, leading to diverse ecosystems along the shoreline.<\\/p><p>At low tide, certain parts of the beach may reveal hidden treasures like seashells, rocks, or tide pools teeming with marine life such as crabs, starfish, and small fish.<\\/p><p><strong>Stunning Natural Beauty<\\/strong>:<\\/p><ul><li>Known for dramatic landscapes shaped by fire and ice.<\\/li><li>Features erupting volcanoes, cascading waterfalls, vast glaciers, and black sand beaches.<\\/li><li>Located in the North Atlantic, just south of the Arctic Circle.<\\/li><\\/ul><p><br \\/>\\u00a0<\\/p>\",\"blog_image\":\"682b322c09f7c1747661356.jpg\"}', '2025-05-19 10:29:16', '2025-05-21 01:21:51'),
(116, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Significance of Culture\",\"quote\":\"In contemporary Japan, the design and form of wagasa can still be seen, although they\'re often made with more modern materials, like nylon or polyester, for practicality.\",\"description\":\"<p>In contemporary Japan, the design and form of wagasa can still be seen, although they\'re often made with more modern materials, like nylon or polyester, for practicality. They may also feature modern prints or designs while maintaining the traditional structure of the umbrella.<\\/p><p>If you\\u2019re looking for a unique cultural piece, a wagasa is an excellent example of traditional Japanese craftsmanship, bringing both functionality and beauty together<br \\/>Art isn\\u2019t always polite\\u2014it\\u2019s often a raised fist against the status quo. This post celebrates five artists who smashed conventions and redefined creativity, from Monet\\u2019s blurry Impressionism that outraged critics to Banksy\\u2019s stencils that turned walls into protests. We\\u2019ll dig into their stories, like how Frida Kahlo painted her pain into power, and analyze the techniques that made their rebellion stick. Expect juicy historical gossip\\u2014like the salon rejections that fueled revolutions\\u2014and modern parallels in today\\u2019s art scene. If you\\u2019ve ever felt like breaking the rules, this dive into art\\u2019s renegades will inspire you to pick up a brush and join the fight.<\\/p><p><strong>Stunning Natural Beauty<\\/strong>:<\\/p><ul><li>Known for dramatic landscapes shaped by fire and ice.<\\/li><li>Features erupting volcanoes, cascading waterfalls, vast glaciers, and black sand beaches.<\\/li><li>Located in the North Atlantic, just south of the Arctic Circle.<\\/li><\\/ul><p>What makes Iceland particularly fascinating is its sense of isolation and tranquility, providing an escape from the hustle and bustle of everyday life. Whether you\\u2019re soaking in hot springs, exploring ice caves, or simply gazing at the untouched beauty of its wilderness, Iceland offers a profound connection to nature that few places on Earth can match.<\\/p><p>In summary, Iceland is a country of natural contrasts\\u2014where fire meets ice, and peace meets adventure. It\\u2019s a must-visit destination for anyone seeking to experience some of the planet\\u2019s most extraordinary landscapes and unique natural phenomena.<\\/p>\",\"blog_image\":\"682b3288db9141747661448.jpg\"}', '2025-05-19 10:30:48', '2025-05-21 01:21:42'),
(117, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Life of penguin\",\"quote\":\"A penguin is a flightless bird known for its unique appearance, charming waddling walk, and strong affinity for cold environments.\",\"description\":\"<p>A <strong>penguin<\\/strong> is a flightless bird known for its unique appearance, charming waddling walk, and strong affinity for cold environments. Penguins belong to the family <strong>Spheniscidae<\\/strong>, and they are found primarily in the Southern Hemisphere, with the largest populations residing in Antarctica, although some species inhabit more temperate or even tropical climates.<\\/p><p>Body Structure: Penguins have a distinct body structure adapted for swimming rather than flying. Their wings are modified into flippers, which they use to propel themselves through water with remarkable agility. They have a sturdy, torpedo-shaped body that allows them to glide efficiently underwater.<\\/p><p>Coloration: Most penguins have a black and white plumage, with a black back and a white belly. This coloration is known as countershading, which helps them blend into the ocean from above and below\\u2014predators find it harder to spot them in the water.<\\/p><p>Size: Penguin species vary in size. The Emperor Penguin, the largest of all species, can stand over 4 feet tall, while smaller species like the Little Blue Penguin only reach around a foot in height.<\\/p><p>Penguins are most commonly associated with Antarctica, where species like the Emperor Penguin and Ad\\u00e9lie Penguin thrive in the freezing cold. However, penguins also inhabit more temperate and even tropical regions. The Gal\\u00e1pagos Penguin, for example, is found on the Gal\\u00e1pagos Islands near the equator.<\\/p><p>Their habitat is usually coastal, with penguins spending a significant amount of time in the ocean hunting for food and on land or ice for breeding and resting.<\\/p><p><strong>Stunning Natural Beauty<\\/strong>:<\\/p><ul><li>Known for dramatic landscapes shaped by fire and ice.<\\/li><li>Features erupting volcanoes, cascading waterfalls, vast glaciers, and black sand beaches.<\\/li><li>Located in the North Atlantic, just south of the Arctic Circle.<br \\/>\\u00a0<\\/li><\\/ul>\",\"blog_image\":\"682b32d5eab771747661525.jpg\"}', '2025-05-19 10:32:05', '2025-05-21 01:21:33'),
(118, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Italy \\u2013 A Living Canvas of Art and Flavor\",\"quote\":\"Italy is a dream that keeps returning for the rest of your life.\",\"description\":\"<p>Italy is not just a destination, it\'s a passion. From Rome\\u2019s ruins to Tuscany\\u2019s vineyards, every corner is bursting with history, food, and romance.<\\/p><p>\\u00a0<\\/p><p><strong>Highlights<\\/strong>:<\\/p><ul><li>Walk through ancient Rome and the Colosseum<\\/li><li>Cruise the canals of Venice<\\/li><li>Taste authentic pizza in Naples<\\/li><li>Visit Michelangelo\\u2019s David in Florence<\\/li><li>Sip wine in the rolling hills of Tuscany<\\/li><\\/ul><p>Body Structure: Penguins have a distinct body structure adapted for swimming rather than flying. Their wings are modified into flippers, which they use to propel themselves through water with remarkable agility. They have a sturdy, torpedo-shaped body that allows them to glide efficiently underwater.<\\/p><p>Coloration: Most penguins have a black and white plumage, with a black back and a white belly. This coloration is known as countershading, which helps them blend into the ocean from above and below\\u2014predators find it harder to spot them in the water.<\\/p><p>Size: Penguin species vary in size. The Emperor Penguin, the largest of all species, can stand over 4 feet tall, while smaller species like the Little Blue Penguin only reach around a foot in height.<\\/p><p>Penguins are most commonly associated with Antarctica, where species like the Emperor Penguin and Ad\\u00e9lie Penguin thrive in the freezing cold. However, penguins also inhabit more temperate and even tropical regions. The Gal\\u00e1pagos Penguin, for example, is found on the Gal\\u00e1pagos Islands near the equator.<\\/p><p>Their habitat is usually coastal, with penguins spending a significant amount of time in the ocean hunting for food and on land or ice for breeding and resting.<\\/p>\",\"blog_image\":\"682b340dbeca91747661837.jpg\"}', '2025-05-19 10:32:54', '2025-05-21 01:21:16'),
(119, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"New Zealand \\u2013 Nature\\u2019s Playground\",\"quote\":\"New Zealand is not a small country but a large village.\",\"description\":\"<p>Adventure awaits in New Zealand\\u2019s jaw-dropping landscapes. From glaciers and fjords to glowworm caves and Maori culture, it\\u2019s the ultimate outdoor escape.<\\/p><p><strong>Highlights<\\/strong>:<\\/p><ul><li>Trek the Tongariro Alpine Crossing<\\/li><li>Bungee jump in Queenstown<\\/li><li>Visit Hobbiton for a Lord of the Rings experience<\\/li><li>Cruise Milford Sound<\\/li><li>Discover Maori heritage in Rotorua<\\/li><\\/ul><p>Body Structure: Penguins have a distinct body structure adapted for swimming rather than flying. Their wings are modified into flippers, which they use to propel themselves through water with remarkable agility. They have a sturdy, torpedo-shaped body that allows them to glide efficiently underwater.<\\/p><p>Coloration: Most penguins have a black and white plumage, with a black back and a white belly. This coloration is known as countershading, which helps them blend into the ocean from above and below\\u2014predators find it harder to spot them in the water.<\\/p><p>Size: Penguin species vary in size. The Emperor Penguin, the largest of all species, can stand over 4 feet tall, while smaller species like the Little Blue Penguin only reach around a foot in height.<\\/p><p>Penguins are most commonly associated with Antarctica, where species like the Emperor Penguin and Ad\\u00e9lie Penguin thrive in the freezing cold. However, penguins also inhabit more temperate and even tropical regions. The Gal\\u00e1pagos Penguin, for example, is found on the Gal\\u00e1pagos Islands near the equator.<\\/p><p>Their habitat is usually coastal, with penguins spending a significant amount of time in the ocean hunting for food and on land or ice for breeding and resting.<\\/p>\",\"blog_image\":\"682b343e091691747661886.jpg\"}', '2025-05-19 10:34:12', '2025-05-21 01:21:09'),
(120, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Morocco \\u2013 Colors of Culture and Sand\",\"quote\":\"Morocco is a feast for the senses, where every alley whispers a story\",\"description\":\"<p>From the bustling souks of Marrakech to the vast Sahara dunes, Morocco is a land of mystery and magic. Lose yourself in vibrant markets, spices, and ancient architecture.<\\/p><p><strong>Highlights<\\/strong>:<\\/p><ul><li>Camp under stars in the Sahara Desert<\\/li><li>Wander through blue streets of Chefchaouen<\\/li><li>Visit the Royal Palace in Fez<\\/li><li>Enjoy mint tea in Marrakech riads<\\/li><li>Surf the waves in Taghazout<\\/li><\\/ul><p><strong>Materials<\\/strong>: Traditional wagasa are made from bamboo and washi paper (Japanese handmade paper). The bamboo forms the frame, while the washi paper is carefully stretched over it to form the canopy. Some wagasa are also made with oiled paper to make them water-resistant.<\\/p><p><strong>Design<\\/strong>: Wagasa come in various sizes, shapes, and colors. They typically feature a wide, round canopy, and many are decorated with intricate designs, such as floral patterns, seasonal motifs (like cherry blossoms or autumn leaves), or simple geometric shapes. The umbrellas often have a very elegant and refined aesthetic.<\\/p><p><strong>Cultural Significance<\\/strong>: Wagasa are not just functional items; they hold cultural and symbolic meaning in Japanese society. They are often associated with traditional Japanese festivals, tea ceremonies, and performances like Kabuki or Noh theatre. Historically, they were used by the aristocracy, but today they are also seen in contemporary festivals and events<br \\/><strong>Types of Wagasa<\\/strong>: There are several types of wagasa, including<\\/p>\",\"blog_image\":\"682b34b2a07a01747662002.jpg\"}', '2025-05-19 10:39:20', '2025-05-21 01:20:30'),
(121, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Canada \\u2013 Wild, Wide and Wonder-Filled\",\"quote\":\"In Canada, adventure is not a choice, it\\u2019s a lifestyle\",\"description\":\"<p>With endless forests, snow-capped mountains, and multicultural cities, Canada is both a wild escape and a cozy welcome. Nature and culture live side by side here.<\\/p><p><strong>Highlights<\\/strong>:<\\/p><ul><li>See Niagara Falls up close<\\/li><li>Hike in Banff &amp; Jasper National Parks<\\/li><li>Explore multicultural Toronto<\\/li><li>Watch the Northern Lights in Yukon<\\/li><li>Try poutine and maple syrup<\\/li><\\/ul><p>Mating: Penguins typically form strong monogamous bonds during the breeding season, and many species return to the same breeding site year after year. They engage in courtship rituals, including vocalizations, head-bobbing, and presenting pebbles as gifts to potential mates.<\\/p><p>Penguins are known for their waddling walk on land, though they are remarkably agile swimmers.<\\/p><p>Swimming: Penguins are superb swimmers, capable of reaching speeds of up to 15 miles per hour (24 km\\/h) underwater. Their flippers allow them to move through the water with ease, much like other birds use their wings to fly.<br \\/>One of the most notable aspects of a sodo is its connection to <strong>Japanese gardens<\\/strong> or <strong>tea ceremonies<\\/strong>. Paths in these settings are designed with the idea of guiding the walker through a series of views and experiences, often in a slow and deliberate manner. For example, the paths leading to a <strong>Japanese tea house<\\/strong> or a <strong>Zen garden<\\/strong> are examples of sodo, where the journey along the path is as important as the destination itself.<\\/p><p>Sodo paths are typically not straight but instead take you on a winding route that creates a sense of discovery and reflection. The path\\u2019s design often takes into account the natural terrain, incorporating the land\\u2019s natural features, such as trees, rocks, and hills. This integration with the environment encourages a deep sense of mindfulness, urging people to slow down and immerse themselves fully in the moment.<\\/p><p>In a more symbolic sense, a sodo also represents life\\u2019s journey\\u2014its ups and downs, twists and turns. Much like the unpredictable nature of life itself, these paths encourage the traveler to accept what comes, be it a moment of calm or a challenge along the way.<\\/p><p>In summary, a <strong>sodo<\\/strong> is not just a path in the physical sense, but a space that promotes reflection, peace, and a deeper connection to nature. It is a quiet, meandering route that invites walkers to slow down, reflect, and appreciate the beauty and tranquility of the natural world around them.<\\/p>\",\"blog_image\":\"682b4ba286d751747667874.jpg\"}', '2025-05-19 10:42:30', '2025-05-19 02:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `code` int DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `supported_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-58ira22618401@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:03:45'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"---------------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:01'),
(3, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"-----------\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"--------------------\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"example.com\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:10:37'),
(4, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"--------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2022-11-26 07:49:18'),
(5, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"-------------------\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:14'),
(6, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(7, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"------------\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"--------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(8, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"------------\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"---------\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"-------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:00:15'),
(9, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:51'),
(10, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:48'),
(11, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"------------\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"-----------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(12, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51M8Ks2CL65BWuH7eCBcWsLP2yPfWaLtfJVxG3zfii7cCWJE1izM4jkhucmBSm6izmVtSGZyp0JDYYCVmx9E4WmQY004gfnctzD\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51M8Ks2CL65BWuH7eju6khGxJMpeeFuw2Rwrjr8UYCz6ZnQ3PiFxb1gVu1i1dBto9MQrnjkBimHkFJgNcqsrJHTak0010kCY41h\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"abcd\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2022-12-18 08:28:03'),
(49, 21, 1000, 'Manual', 'manual', 1, '[]', '[]', 0, NULL, '<p>Please provide your information</p>', '2025-03-11 17:26:30', '2025-03-11 17:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `method_code` int DEFAULT NULL,
  `gateway_alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway_parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(3, 'Paypal - USD', 'USD', '$', 101, 'Paypal', 10.00000000, 1000.00000000, 0.00, 0.00000000, 1.00000000, NULL, '{\"paypal_email\":\"sb-58ira22618401@business.example.com\"}', '2023-05-27 02:54:30', '2023-05-27 02:54:30'),
(4, 'Manual', 'USD', '', 1000, 'manual', 1.00000000, 10000.00000000, 0.80, 1.50000000, 1.00000000, NULL, NULL, '2025-03-11 17:26:30', '2025-04-22 17:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cur_text` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `map_api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sms_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sms_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `base_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secondary_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'email configuration',
  `sms_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `global_shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `socialite_credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `agency_socialite_credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0',
  `akv` tinyint(1) NOT NULL DEFAULT '0',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `system_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `map_api_key`, `sms_body`, `sms_from`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `socialite_credentials`, `agency_socialite_credentials`, `kv`, `akv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `registration`, `active_template`, `system_info`, `created_at`, `updated_at`) VALUES
(1, 'Travela', 'USD', '$', 'notify@example.com', '<p>Hi {{fullname}} ({{username}}),&nbsp;</p><p>{{message}}</p>', 'AIzaSyDHluAHB7yMWl_SfDHD53Eki9On0D4_JeY', 'Hi {{fullname}} ({{username}}), \r\n{{message}}', 'Travela', '39bff9', '060662', '{\"name\":\"php\"}', '{\"name\":\"messageBird\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', '{\"google\":{\"client_id\":\"959894800111-743odo92gdre71v9vt1u6pqkc5vo9v3g.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":1},\"facebook\":{\"client_id\":\"---------\",\"client_secret\":\"---------\",\"status\":1},\"linkedin\":{\"client_id\":\"772t1ej48e6ezg\",\"client_secret\":\"FbeN3gb6RI6eqisG\",\"status\":0}}', '{\"google\":{\"client_id\":\"959894800111-743odo92gdre71v9vt1u6pqkc5vo9v3g.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":1},\"facebook\":{\"client_id\":\"---------\",\"client_secret\":\"---------\",\"status\":1},\"linkedin\":{\"client_id\":\"772t1ej48e6ezg\",\"client_secret\":\"FbeN3gb6RI6eqisG\",\"status\":0}}', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 'default', '[]', NULL, '2025-05-18 21:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '680a44ae5028a1745503406.png', 0, 1, '2020-07-06 03:47:55', '2025-04-24 01:03:26'),
(14, 'Spanish', 'es', '680a44b4a33441745503412.png', 0, 0, '2023-02-15 11:06:57', '2025-04-24 01:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `agency_id` int NOT NULL DEFAULT '0',
  `sender` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sent_to` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `notification_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-09-21 13:04:13'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Payemnt - Automated - Successful', 'Payments Completed Successfully', '<p>Your payments of&nbsp;{{amount}} {{site_currency}}&nbsp;is via&nbsp; {{method_name}}&nbsp;has been completed Successfully.<br>&nbsp;</p><p><br>&nbsp;</p><p>Details of your payments:<br>&nbsp;</p><p>Amount : {{amount}} {{site_currency}}</p><p>Charge:&nbsp;{{charge}} {{site_currency}}</p><p>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</p><p>Received : {{method_amount}} {{method_currency}}<br>&nbsp;</p><p>Paid via :&nbsp; {{method_name}}</p><p>Transaction Number : {{trx}}</p><p><br>&nbsp;</p><p>Your current Balance is&nbsp;{{post_balance}} {{site_currency}}</p>', '{{amount}} {{site_currency}} payment successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2025-04-29 17:41:11'),
(4, 'DEPOSIT_APPROVE', 'Payments- Manual - Approved', 'Your Payments is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Payments- Manual - Rejected', 'Your Payments Request is Rejected', '<p>Your payments request of&nbsp;{{amount}} {{site_currency}}&nbsp;is via&nbsp; {{method_name}} has been rejected.<br>&nbsp;</p><p>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</p><p>Received : {{method_amount}} {{method_currency}}<br>&nbsp;</p><p>Paid via :&nbsp; {{method_name}}</p><p>Charge: {{charge}}</p><p>Transaction Number was : {{trx}}</p><p>if you have any queries, feel free to contact us.<br>&nbsp;</p><p><br>&nbsp;</p><p><br><br>&nbsp;</p><p>{{rejection_message}}<br>&nbsp;</p>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2025-04-29 17:45:58'),
(6, 'DEPOSIT_REQUEST', 'Payments- Manual - Requested', 'Payments Request Submitted Successfully', '<p>Your Payments request of&nbsp;{{amount}} {{site_currency}}&nbsp;is via&nbsp; {{method_name}}&nbsp;submitted successfully&nbsp;.<br>&nbsp;</p><p><br>&nbsp;</p><p>Details of your Payments:<br>&nbsp;</p><p>Amount : {{amount}} {{site_currency}}</p><p>Charge:&nbsp;{{charge}} {{site_currency}}</p><p>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</p><p>Payable : {{method_amount}} {{method_currency}}<br>&nbsp;</p><p>Pay via :&nbsp; {{method_name}}</p><p>Transaction Number : {{trx}}</p>', '{{amount}} {{site_currency}} Payments requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2025-04-29 17:44:51'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(18, 'REFFERAL_LINK', 'Reffer User', 'Refferel Link', '<p><strong>{{username}} </strong>reffered you.</p><p><strong>Please click below to sign up&nbsp; {{link}} .&nbsp;</strong><br>&nbsp;</p>', '<div><b>{{username}} </b>reffered you.</div><div><b>Please click below to sign up&nbsp; {{link}} . <a href=\"{{link}}\"></a><br></b></div><div><br></div>', '{\"link\":\"Refferal Link\",\"username\":\"Username\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(19, 'ORDER_PAYMENT_PAID', 'User Order  Payment Paid', 'User Order Payment Paid', '{{message}}', 'Your payment has been successfully received! Your order is now being processed. Thank you for choosing us.!', '{\r\n  \"trx\": \"Transaction number for the order\",\r\n  \"order_number\": \"Order Serial Number\",\r\n  \"amount\": \"Total product amount\",\r\n  \"delivery_charge\": \"Delivery Charge\",\r\n  \"address\": \"Customer\'s Address\",\r\n  \"total_price\": \"Total Price of order\",\r\n  \"order_url\": \"Order Details url\"\r\n}\r\n', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(20, 'ORDER_RECEIVED', 'User Order  Received', 'User order has been received', '{{message}}', 'Your order has been successfully received! Thank you for choosing us.!', '{\r\n  \"trx\": \"Transaction number for the order\",\r\n  \"order_number\": \"Order Serial Number\",\r\n  \"amount\": \"Total product amount\",\r\n  \"delivery_charge\": \"Delivery Charge\",\r\n  \"address\": \"Customer\'s Address\",\r\n  \"total_price\": \"Total Price of order\",\r\n  \"order_url\": \"Order Details url\"\r\n}\r\n', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(21, 'ORDER_SHIPPED', 'User Order  Shipped', 'User order has been shipped', '{{message}}', 'Your order has been successfully shipped! Thank you for choosing us.!', '{\r\n  \"order_number\": \"Order Serial Number\",\r\n  \"amount\": \"Total product amount\",\r\n  \"delivery_charge\": \"Delivery Charge\",\r\n  \"address\": \"Customer\'s Address\",\r\n  \"total_price\": \"Total Price of order\",\r\n  \"order_url\": \"Order Details url\"\r\n}\r\n', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(22, 'ORDER_DELIVERED', 'User Order  Delivered', 'User order has been delivered', '{{message}}', 'Your order has been successfully delivered! Thank you for choosing us.!', '{\r\n  \"order_number\": \"Order Serial Number\",\r\n  \"amount\": \"Total product amount\",\r\n  \"delivery_charge\": \"Delivery Charge\",\r\n  \"address\": \"Customer\'s Address\",\r\n  \"total_price\": \"Total Price of order\",\r\n  \"order_url\": \"Order Details url\"\r\n}\r\n', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(23, 'ORDER_CANCEL', 'User Order  Cancel', 'User order has been cancel', '{{message}}', 'Your order has been successfully cancel! Thank you for choosing us.!', '{\r\n  \"trx\": \"Transaction number for the order\",\r\n  \"order_number\": \"Order Serial Number\",\r\n  \"amount\": \"Total product amount\",\r\n  \"delivery_charge\": \"Delivery Charge\",\r\n  \"address\": \"Customer\'s Address\",\r\n  \"total_price\": \"Total Price of order\",\r\n  \"order_url\": \"Order Details url\"\r\n}\r\n', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(24, 'REFERRAL_COMMISSION', 'Referral Commission', 'Referral commission got successfully', '<p>You have got <strong>{{amount}} {{currency}} </strong>referral commission. Your current balance is <strong>{{post_balance}} {{currency}} </strong>and the transaction number is <strong>{{trx}}</strong></p>', '<p>You have got <strong>{{amount}} {{currency}} </strong>referral commission. Your current balance is <strong>{{post_balance}} {{currency}} </strong>and the transaction number is <strong>{{trx}}</strong></p>', '{\"amount\":\"Amount of commission\",\"post_balance\":\"Balance after commission\",\"trx\":\"Transaction number\",\"level\":\"Level of referral\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(25, 'BOOKING_COMPLETE', 'Booking- Automated - Successful', 'Booking Completed Successfully', '<p>Your booking of&nbsp;{{price}} {{site_currency}}&nbsp;has been completed Successfully.<br>&nbsp;</p><p>Details of your Booking complete:</p><p><br>Tour Title:&nbsp;{{tour_title}}</p><p>Tour Owner Name:&nbsp;{{tour_owner_name}}</p><p>Tour Owner Email:&nbsp;{{tour_owner_email}}</p><p>Amount : {{site_currency}} {{price}}</p><p>Discount: {{price}}%</p><p>Booking Seats:&nbsp;{{charge}} {{site_currency}}</p><p>Tour Start:&nbsp;{{charge}} {{site_currency}}</p><p>Tour End:&nbsp;{{charge}} {{site_currency}}</p><p>Tour Stay:&nbsp;{{charge}} {{site_currency}}</p><p>&nbsp;</p>', '{{price}} {{site_currency}} booking successfully', '{\"tour_title\":\"Transaction number for the deposit\",\"tour_owner_name\":\"Transaction number for the deposit\",\"tour_owner_email\":\"Transaction number for the deposit\",\"price\":\"Amount inserted by the user\",\"discount\":\"Amount inserted by the user\",\"booking_seats\":\"Gateway charge set by the admin\",\"tour_start\":\"Conversion rate between base currency and method currency\",\"tour_end\":\"Name of the deposit method\",\"tour_stay\":\"Currency of the deposit method\"}', 1, 1, '2021-11-03 12:00:00', '2025-04-29 18:53:02'),
(26, 'TOUR_BOOKED', 'Tour Booking package- Successful', 'Tour Package has been Booked.', '<p>Your tour package has been booked.<br>&nbsp;</p><p>Details of your Booking complete:</p><p><br>Tour Title:&nbsp;{{tour_title}}</p><p>User first Name:&nbsp;{{first_name}}</p><p>User last Name:&nbsp;{{last_name}}</p><p>Email: {{email}}</p><p>Phone: {{phone}}</p>', 'Tour package has been booked.', '{\"tour_title\":\"Transaction number for the deposit\",\"first_name\":\"Transaction number for the deposit\",\"last_name\":\"Transaction number for the deposit\",\"email\":\"Amount inserted by the user\",\"phone\":\"Amount inserted by the user\"}', 1, 1, '2021-11-03 12:00:00', '2025-04-29 19:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `tour_package_id` int NOT NULL,
  `total_price` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT ' ',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0=pending,1=processing,2=manufactured,3=shipped,4=complete/delivered,5=cancel',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=payment,0=pending',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=apply,0 not apply',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `artwork_id` int NOT NULL,
  `agency_id` int NOT NULL,
  `item_price` decimal(18,4) NOT NULL,
  `print_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `print_size` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `frame_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'template name',
  `secs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 'presets.default.', '[\"why_choose_us\",\"popular_tour\",\"our_best_offer\",\"top_destination\",\"how_it_work\",\"testimonial\",\"blog\"]', 1, '2020-07-11 06:23:58', '2025-05-18 23:51:27'),
(4, 'Tours', 'browse', 'presets.default.', '[\"top_destination\",\"faq\"]', 1, '2020-10-22 01:14:43', '2025-05-18 23:32:24'),
(5, 'About', 'about', 'presets.default.', '[\"about_me\",\"faq\",\"blog\"]', 0, '2020-10-22 01:14:53', '2025-04-27 21:28:39'),
(21, 'Blog', 'blog', 'presets.default.', '[\"faq\"]', 0, '2025-03-22 21:16:03', '2025-05-10 19:27:25'),
(22, 'Contact', 'contact', 'presets.default.', NULL, 1, '2025-04-09 17:15:52', '2025-04-09 17:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `tour_package_id` int NOT NULL,
  `star` decimal(8,1) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_message_id` int UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT '0',
  `agency_id` int NOT NULL DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ticket` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tour_bookings`
--

CREATE TABLE `tour_bookings` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `tour_package_id` bigint NOT NULL,
  `owner_id` bigint NOT NULL,
  `owner_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `user_proposal_date` timestamp NULL DEFAULT NULL,
  `cancle_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seat` int NOT NULL,
  `status` tinyint NOT NULL COMMENT '0=>pending, 1=>success, 2=>cancel	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tour_packages`
--

CREATE TABLE `tour_packages` (
  `id` bigint NOT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `person_capability` int NOT NULL,
  `booking_person` int NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `flexible_date` tinyint NOT NULL,
  `tour_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tour_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `day_nights` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `highlights` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `destination_overview` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zip_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `average_rating` decimal(3,2) DEFAULT '0.00',
  `review_count` int DEFAULT NULL,
  `view` int DEFAULT NULL,
  `favorite` int DEFAULT '0',
  `status` tinyint NOT NULL COMMENT ' 0 = pending, 1= active, 2= running, 3=expired',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tour_package_images`
--

CREATE TABLE `tour_package_images` (
  `id` bigint UNSIGNED NOT NULL,
  `tour_package_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `agency_id` int NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ref_by` int UNSIGNED NOT NULL DEFAULT '0',
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `kyc_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: mobile unverified, 1: mobile verified',
  `reg_step` tinyint(1) NOT NULL DEFAULT '0',
  `ver_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_by` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ban_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `agency_id` int NOT NULL DEFAULT '0',
  `user_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `browser` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `os` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `tour_package_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `method_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `after_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT '0.00000000',
  `max_limit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `fixed_charge` decimal(28,8) DEFAULT '0.00000000',
  `rate` decimal(28,8) DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_logs`
--
ALTER TABLE `commission_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tour_bookings`
--
ALTER TABLE `tour_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tour_packages`
--
ALTER TABLE `tour_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tour_package_images`
--
ALTER TABLE `tour_package_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_logs`
--
ALTER TABLE `commission_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tour_bookings`
--
ALTER TABLE `tour_bookings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tour_packages`
--
ALTER TABLE `tour_packages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tour_package_images`
--
ALTER TABLE `tour_package_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
