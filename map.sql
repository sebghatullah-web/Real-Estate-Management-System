-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2026 at 10:17 AM
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
-- Database: `map`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plots_1000` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 24 DO
        INSERT INTO plots_1000 
        (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status)
        VALUES (
            CONCAT('p_6_E', i),
            'ده بسوه‌ای',
            1000,
            30000,
            4200,
            10000,
            44200,
            'available'
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plots_200` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 185 DO
        INSERT INTO plots_200 
        (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status)
        VALUES (
            CONCAT('p_2_', i),
            'دو بسوه‌ای',
            200,
            3000,
            1960,
            2000,
            6960,
            'available'
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plots_260` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 751 DO
        INSERT INTO plots_260 
        (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status)
        VALUES (
            CONCAT('p_2.6_', i),
            'دونیم بسوه‌ای',
            260,
            4000,
            2100,
            2600,
            8700,
            'available'
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plots_300` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 647 DO
        INSERT INTO plots_300 
        (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status)
        VALUES (
            CONCAT('p_3_', i),
            'سه بسوه‌ای',
            300,
            5000,
            2240,
            3000,
            10240,
            'available'
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plots_400` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 52 DO
        INSERT INTO plots_400 
        (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status)
        VALUES (
            CONCAT('p_4_', i),
            'چهار بسوه‌ای',
            400,
            10000,
            2800,
            4000,
            16800,
            'available'
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plots_510` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 52 DO
        INSERT INTO plots_510 
        (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status)
        VALUES (
            CONCAT('p_5_', i),
            'پنج بسوه‌ای',
            510,
            15000,
            3500,
            5100,
            23600,
            'available'
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plots_600` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 56 DO
        INSERT INTO plots_600 
        (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status)
        VALUES (
            CONCAT('p_6_', i),
            'شش بسوه‌ای',
            600,
            20000,
            3640,
            6000,
            29640,
            'available'
        );
        SET i = i + 1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_plots_vip` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 6 DO
        INSERT INTO plots_vip
        (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status)
        VALUES (
            CONCAT('p_vip_', i),
            'vip',
            0,
            0,
            0,
            0,
            0,
            'available'
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `national_id` varchar(50) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role` enum('superadmin','admin') DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `full_name`, `email`, `phone`, `national_id`, `profile_image`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$EqGXPRqhCtXvedKyWZ0uPeE59JNaBg4AgEyorxdUC33hJXwmBt9xm', 'admin', 'admin@gmail.com', NULL, NULL, NULL, 'admin', '2026-06-15 23:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `block_code` varchar(50) NOT NULL COMMENT 'کد بلاک',
  `block_name` varchar(100) DEFAULT NULL COMMENT 'نام بلاک',
  `size` int(11) NOT NULL COMMENT 'سایز بلاک (متر مربع) مثلاً 114، 412، 644، 902',
  `staircase_size` int(11) NOT NULL DEFAULT 45 COMMENT 'راه پله (متر مربع)',
  `floors_count` int(11) NOT NULL COMMENT 'تعداد منزل/طبقه‌ها',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `block_code`, `block_name`, `size`, `staircase_size`, `floors_count`, `status`, `created_at`) VALUES
(10034, 'b_902_26', '902 Square Meter Block', 902, 45, 7, 'active', '2026-09-24 06:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `block_amenities`
--

CREATE TABLE `block_amenities` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `amenity_key` varchar(50) NOT NULL COMMENT 'شناسه امکانات (لطفاً با حروف انگلیسی)',
  `amenity_label` varchar(100) NOT NULL COMMENT 'نام امکانات به فارسی',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block_amenities`
--

INSERT INTO `block_amenities` (`id`, `block_id`, `amenity_key`, `amenity_label`, `created_at`) VALUES
(149, 10034, 'lobby', 'Lobby', '2026-09-24 06:14:50'),
(150, 10034, 'staircase', 'Staircase', '2026-09-24 06:14:50'),
(151, 10034, 'elevator', 'Elevator', '2026-09-24 06:14:50'),
(152, 10034, 'parking', 'Parking', '2026-09-24 06:14:50'),
(153, 10034, 'green_space', 'Green Space', '2026-09-24 06:14:50'),
(154, 10034, 'kids_play', 'Children\'s Play Area', '2026-09-24 06:14:50'),
(155, 10034, 'security', 'Security / Guard', '2026-09-24 06:14:50'),
(156, 10034, 'cctv', 'CCTV System', '2026-09-24 06:14:50'),
(157, 10034, 'facilities_room', 'Facilities Room', '2026-09-24 06:14:50'),
(158, 10034, 'water_tank', 'Water Tank', '2026-09-24 06:14:50'),
(159, 10034, 'generator', 'Generator / Emergency Power', '2026-09-24 06:14:50'),
(160, 10034, 'fire_fighting', 'Fire Fighting System', '2026-09-24 06:14:50'),
(161, 10034, 'garbage_area', 'Garbage Collection Area', '2026-09-24 06:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `block_units`
--

CREATE TABLE `block_units` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `manzel_id` int(11) DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT 'standard' COMMENT 'کتگوری واحد: standard، premium، vip، vvip و ...',
  `unit_number` varchar(20) NOT NULL COMMENT 'شماره واحد (مثلاً 1، 2، 3)',
  `unit_code` varchar(100) NOT NULL COMMENT 'کد کامل واحد (بلاک-طبقه-واحد)',
  `unit_size` decimal(10,2) NOT NULL COMMENT 'متراژ واحد (متر مربع)',
  `status` enum('available','reserved','sold') NOT NULL DEFAULT 'available' COMMENT 'قابل فروش، رزرو شده، فروخته شده',
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `unit_price_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'قیمت واحد فی متر مربع (در وقت فروش ثبت می‌شود)',
  `gov_cost_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'خدمات دولت فی متر مربع (در وقت فروش ثبت می‌شود)',
  `infra_cost_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'خدمات زیربنا فی متر مربع (در وقت فروش ثبت می‌شود)',
  `unit_price` decimal(12,2) DEFAULT NULL COMMENT 'قیمت کل واحد = نرخ فی متر × متراژ',
  `gov_cost` decimal(12,2) DEFAULT NULL COMMENT 'خدمات دولت (کل)',
  `infra_cost` decimal(12,2) DEFAULT NULL COMMENT 'خدمات زیربنا (کل)',
  `total_price` decimal(12,2) DEFAULT NULL COMMENT 'قیمت مجموعی واحد = قیمت + خدمات دولت + خدمات زیربنا',
  `sold_at` timestamp NULL DEFAULT NULL COMMENT 'تاریخ فروش'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block_units`
--

INSERT INTO `block_units` (`id`, `block_id`, `manzel_id`, `category`, `unit_number`, `unit_code`, `unit_size`, `status`, `customer_id`, `created_at`, `unit_price_per_meter`, `gov_cost_per_meter`, `infra_cost_per_meter`, `unit_price`, `gov_cost`, `infra_cost`, `total_price`, `sold_at`) VALUES
(100065, 10034, 17, 'standard', '1', 'b_902_26-MZ2-1', 201.00, 'available', NULL, '2026-09-24 06:18:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100066, 10034, 17, 'standard', '2', 'b_902_26-MZ2-2', 201.00, 'available', NULL, '2026-09-24 06:18:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100067, 10034, 17, 'standard', '3', 'b_902_26-MZ2-3', 201.00, 'available', NULL, '2026-09-24 06:19:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100068, 10034, 17, 'standard', '4', 'b_902_26-MZ2-4', 201.00, 'available', NULL, '2026-09-24 06:19:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100069, 10034, 18, 'standard', '1', 'b_902_26-MZ3-1', 201.00, 'available', NULL, '2026-09-24 06:22:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100070, 10034, 18, 'standard', '2', 'b_902_26-MZ3-2', 201.00, 'available', NULL, '2026-09-24 06:23:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100071, 10034, 18, 'standard', '3', 'b_902_26-MZ3-3', 201.00, 'available', NULL, '2026-09-24 06:23:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100072, 10034, 18, 'standard', '4', 'b_902_26-MZ3-4', 201.00, 'available', NULL, '2026-09-24 06:23:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100073, 10034, 19, 'standard', '1', 'b_902_26-MZ4-1', 201.00, 'available', NULL, '2026-09-24 06:24:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100074, 10034, 19, 'standard', '2', 'b_902_26-MZ4-2', 201.00, 'available', NULL, '2026-09-24 06:32:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100075, 10034, 19, 'standard', '3', 'b_902_26-MZ4-3', 201.00, 'available', NULL, '2026-09-24 06:32:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100076, 10034, 19, 'standard', '4', 'b_902_26-MZ4-4', 201.00, 'available', NULL, '2026-09-24 06:32:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100077, 10034, 20, 'premium', '1', 'b_902_26-MZ5-1', 268.00, 'available', NULL, '2026-09-24 06:33:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100078, 10034, 20, 'premium', '2', 'b_902_26-MZ5-2', 268.00, 'available', NULL, '2026-09-24 06:33:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100079, 10034, 20, 'premium', '3', 'b_902_26-MZ5-3', 268.00, 'available', NULL, '2026-09-24 06:33:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100080, 10034, 21, 'vip', '1', 'b_902_26-MZ6-1', 402.00, 'available', NULL, '2026-09-24 06:33:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100081, 10034, 21, 'vip', '2', 'b_902_26-MZ6-2', 402.00, 'available', NULL, '2026-09-24 06:34:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100082, 10034, 22, 'grand_residence', '1', 'b_902_26-MZ7-1', 804.00, 'available', NULL, '2026-09-24 06:34:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `block_unit_features`
--

CREATE TABLE `block_unit_features` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `feature_key` varchar(50) NOT NULL COMMENT 'شناسه جزئیات (لطفاً با حروف انگلیسی)',
  `feature_label` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block_unit_features`
--

INSERT INTO `block_unit_features` (`id`, `unit_id`, `feature_key`, `feature_label`, `created_at`) VALUES
(276, 100065, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:18:30'),
(277, 100065, '2', '1 living hall', '2026-09-24 06:18:30'),
(278, 100065, '3', '1-2 bathrooms', '2026-09-24 06:18:30'),
(279, 100065, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:18:30'),
(280, 100065, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:18:30'),
(281, 100065, '6', 'Sanitary ware and lighting', '2026-09-24 06:18:30'),
(282, 100065, '7', 'Washer and dryer', '2026-09-24 06:18:30'),
(283, 100065, '8', 'Balcony', '2026-09-24 06:18:30'),
(284, 100065, '9', 'Shared lift', '2026-09-24 06:18:30'),
(285, 100065, '10', 'Shared outdoor parking', '2026-09-24 06:18:30'),
(286, 100066, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:18:56'),
(287, 100066, '2', '1 living hall', '2026-09-24 06:18:56'),
(288, 100066, '3', '1-2 bathrooms', '2026-09-24 06:18:56'),
(289, 100066, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:18:56'),
(290, 100066, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:18:56'),
(291, 100066, '6', 'Sanitary ware and lighting', '2026-09-24 06:18:56'),
(292, 100066, '7', 'Washer and dryer', '2026-09-24 06:18:56'),
(293, 100066, '8', 'Balcony', '2026-09-24 06:18:56'),
(294, 100066, '9', 'Shared lift', '2026-09-24 06:18:56'),
(295, 100066, '10', 'Shared outdoor parking', '2026-09-24 06:18:56'),
(296, 100067, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:19:35'),
(297, 100067, '2', '1 living hall', '2026-09-24 06:19:35'),
(298, 100067, '3', '1-2 bathrooms', '2026-09-24 06:19:35'),
(299, 100067, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:19:35'),
(300, 100067, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:19:35'),
(301, 100067, '6', 'Sanitary ware and lighting', '2026-09-24 06:19:35'),
(302, 100067, '7', 'Washer and dryer', '2026-09-24 06:19:35'),
(303, 100067, '8', 'Balcony', '2026-09-24 06:19:35'),
(304, 100067, '9', 'Shared lift', '2026-09-24 06:19:35'),
(305, 100067, '10', 'Shared outdoor parking', '2026-09-24 06:19:35'),
(306, 100068, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:19:53'),
(307, 100068, '2', '1 living hall', '2026-09-24 06:19:53'),
(308, 100068, '3', '1-2 bathrooms', '2026-09-24 06:19:53'),
(309, 100068, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:19:53'),
(310, 100068, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:19:53'),
(311, 100068, '6', 'Sanitary ware and lighting', '2026-09-24 06:19:53'),
(312, 100068, '7', 'Washer and dryer', '2026-09-24 06:19:53'),
(313, 100068, '8', 'Balcony', '2026-09-24 06:19:53'),
(314, 100068, '9', 'Shared lift', '2026-09-24 06:19:53'),
(315, 100068, '10', 'Shared outdoor parking', '2026-09-24 06:19:53'),
(316, 100069, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:22:50'),
(317, 100069, '2', '1 living hall', '2026-09-24 06:22:50'),
(318, 100069, '3', '1-2 bathrooms', '2026-09-24 06:22:50'),
(319, 100069, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:22:50'),
(320, 100069, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:22:50'),
(321, 100069, '6', 'Sanitary ware and lighting', '2026-09-24 06:22:50'),
(322, 100069, '7', 'Washer and dryer', '2026-09-24 06:22:50'),
(323, 100069, '8', 'Balcony', '2026-09-24 06:22:50'),
(324, 100069, '9', 'Shared lift', '2026-09-24 06:22:50'),
(325, 100069, '10', 'Shared outdoor parking', '2026-09-24 06:22:50'),
(326, 100070, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:23:09'),
(327, 100070, '2', '1 living hall', '2026-09-24 06:23:09'),
(328, 100070, '3', '1-2 bathrooms', '2026-09-24 06:23:09'),
(329, 100070, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:23:09'),
(330, 100070, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:23:09'),
(331, 100070, '6', 'Sanitary ware and lighting', '2026-09-24 06:23:09'),
(332, 100070, '7', 'Washer and dryer', '2026-09-24 06:23:09'),
(333, 100070, '8', 'Balcony', '2026-09-24 06:23:09'),
(334, 100070, '9', 'Shared lift', '2026-09-24 06:23:09'),
(335, 100070, '10', 'Shared outdoor parking', '2026-09-24 06:23:09'),
(336, 100071, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:23:24'),
(337, 100071, '2', '1 living hall', '2026-09-24 06:23:24'),
(338, 100071, '3', '1-2 bathrooms', '2026-09-24 06:23:24'),
(339, 100071, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:23:24'),
(340, 100071, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:23:24'),
(341, 100071, '6', 'Sanitary ware and lighting', '2026-09-24 06:23:24'),
(342, 100071, '7', 'Washer and dryer', '2026-09-24 06:23:24'),
(343, 100071, '8', 'Balcony', '2026-09-24 06:23:24'),
(344, 100071, '9', 'Shared lift', '2026-09-24 06:23:24'),
(345, 100071, '10', 'Shared outdoor parking', '2026-09-24 06:23:24'),
(346, 100072, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:23:40'),
(347, 100072, '2', '1 living hall', '2026-09-24 06:23:40'),
(348, 100072, '3', '1-2 bathrooms', '2026-09-24 06:23:40'),
(349, 100072, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:23:40'),
(350, 100072, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:23:40'),
(351, 100072, '6', 'Sanitary ware and lighting', '2026-09-24 06:23:40'),
(352, 100072, '7', 'Washer and dryer', '2026-09-24 06:23:40'),
(353, 100072, '8', 'Balcony', '2026-09-24 06:23:40'),
(354, 100072, '9', 'Shared lift', '2026-09-24 06:23:40'),
(355, 100072, '10', 'Shared outdoor parking', '2026-09-24 06:23:40'),
(356, 100073, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:24:03'),
(357, 100073, '2', '1 living hall', '2026-09-24 06:24:03'),
(358, 100073, '3', '1-2 bathrooms', '2026-09-24 06:24:03'),
(359, 100073, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:24:03'),
(360, 100073, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:24:03'),
(361, 100073, '6', 'Sanitary ware and lighting', '2026-09-24 06:24:03'),
(362, 100073, '7', 'Washer and dryer', '2026-09-24 06:24:03'),
(363, 100073, '8', 'Balcony', '2026-09-24 06:24:03'),
(364, 100073, '9', 'Shared lift', '2026-09-24 06:24:03'),
(365, 100073, '10', 'Shared outdoor parking', '2026-09-24 06:24:03'),
(366, 100074, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:32:37'),
(367, 100074, '2', '1 living hall', '2026-09-24 06:32:37'),
(368, 100074, '3', '1-2 bathrooms', '2026-09-24 06:32:37'),
(369, 100074, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:32:37'),
(370, 100074, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:32:37'),
(371, 100074, '6', 'Sanitary ware and lighting', '2026-09-24 06:32:37'),
(372, 100074, '7', 'Washer and dryer', '2026-09-24 06:32:37'),
(373, 100074, '8', 'Balcony', '2026-09-24 06:32:37'),
(374, 100074, '9', 'Shared lift', '2026-09-24 06:32:37'),
(375, 100074, '10', 'Shared outdoor parking', '2026-09-24 06:32:37'),
(376, 100075, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:32:45'),
(377, 100075, '2', '1 living hall', '2026-09-24 06:32:45'),
(378, 100075, '3', '1-2 bathrooms', '2026-09-24 06:32:45'),
(379, 100075, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:32:45'),
(380, 100075, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:32:45'),
(381, 100075, '6', 'Sanitary ware and lighting', '2026-09-24 06:32:45'),
(382, 100075, '7', 'Washer and dryer', '2026-09-24 06:32:45'),
(383, 100075, '8', 'Balcony', '2026-09-24 06:32:45'),
(384, 100075, '9', 'Shared lift', '2026-09-24 06:32:45'),
(385, 100075, '10', 'Shared outdoor parking', '2026-09-24 06:32:45'),
(386, 100076, '1', '1 master bedroom + 1 additional bedroom', '2026-09-24 06:32:53'),
(387, 100076, '2', '1 living hall', '2026-09-24 06:32:53'),
(388, 100076, '3', '1-2 bathrooms', '2026-09-24 06:32:53'),
(389, 100076, '4', 'Fitted kitchen with full kitchen appliances', '2026-09-24 06:32:53'),
(390, 100076, '5', 'Built-in wardrobes and cabinets', '2026-09-24 06:32:53'),
(391, 100076, '6', 'Sanitary ware and lighting', '2026-09-24 06:32:53'),
(392, 100076, '7', 'Washer and dryer', '2026-09-24 06:32:53'),
(393, 100076, '8', 'Balcony', '2026-09-24 06:32:53'),
(394, 100076, '9', 'Shared lift', '2026-09-24 06:32:53'),
(395, 100076, '10', 'Shared outdoor parking', '2026-09-24 06:32:53'),
(396, 100077, '11', '1 master bedroom + 2 additional bedrooms', '2026-09-24 06:33:23'),
(397, 100077, '12', '1-2 living halls', '2026-09-24 06:33:23'),
(398, 100077, '13', '2 bathrooms', '2026-09-24 06:33:23'),
(399, 100077, '14', 'Fully equipped kitchen', '2026-09-24 06:33:23'),
(400, 100077, '15', 'Selected bedroom and living furniture (semi-furnished)', '2026-09-24 06:33:23'),
(401, 100077, '16', 'Upgraded finishes', '2026-09-24 06:33:23'),
(402, 100077, '17', 'Washer and dryer', '2026-09-24 06:33:23'),
(403, 100077, '18', 'Built-in cabinets and wardrobes', '2026-09-24 06:33:23'),
(404, 100077, '19', 'Balcony', '2026-09-24 06:33:23'),
(405, 100077, '20', 'Dedicated indoor parking + shared outdoor parking', '2026-09-24 06:33:23'),
(406, 100077, '21', 'Shared lift', '2026-09-24 06:33:23'),
(407, 100078, '11', '1 master bedroom + 2 additional bedrooms', '2026-09-24 06:33:34'),
(408, 100078, '12', '1-2 living halls', '2026-09-24 06:33:34'),
(409, 100078, '13', '2 bathrooms', '2026-09-24 06:33:34'),
(410, 100078, '14', 'Fully equipped kitchen', '2026-09-24 06:33:34'),
(411, 100078, '15', 'Selected bedroom and living furniture (semi-furnished)', '2026-09-24 06:33:34'),
(412, 100078, '16', 'Upgraded finishes', '2026-09-24 06:33:34'),
(413, 100078, '17', 'Washer and dryer', '2026-09-24 06:33:34'),
(414, 100078, '18', 'Built-in cabinets and wardrobes', '2026-09-24 06:33:34'),
(415, 100078, '19', 'Balcony', '2026-09-24 06:33:34'),
(416, 100078, '20', 'Dedicated indoor parking + shared outdoor parking', '2026-09-24 06:33:34'),
(417, 100078, '21', 'Shared lift', '2026-09-24 06:33:34'),
(418, 100079, '11', '1 master bedroom + 2 additional bedrooms', '2026-09-24 06:33:45'),
(419, 100079, '12', '1-2 living halls', '2026-09-24 06:33:45'),
(420, 100079, '13', '2 bathrooms', '2026-09-24 06:33:45'),
(421, 100079, '14', 'Fully equipped kitchen', '2026-09-24 06:33:45'),
(422, 100079, '15', 'Selected bedroom and living furniture (semi-furnished)', '2026-09-24 06:33:45'),
(423, 100079, '16', 'Upgraded finishes', '2026-09-24 06:33:45'),
(424, 100079, '17', 'Washer and dryer', '2026-09-24 06:33:45'),
(425, 100079, '18', 'Built-in cabinets and wardrobes', '2026-09-24 06:33:45'),
(426, 100079, '19', 'Balcony', '2026-09-24 06:33:45'),
(427, 100079, '20', 'Dedicated indoor parking + shared outdoor parking', '2026-09-24 06:33:45'),
(428, 100079, '21', 'Shared lift', '2026-09-24 06:33:45'),
(440, 100081, '22', '1 master bedroom + 2-3 additional bedrooms', '2026-09-24 06:34:18'),
(441, 100081, '23', '1-2 living halls', '2026-09-24 06:34:18'),
(442, 100081, '24', '2-3 bathrooms', '2026-09-24 06:34:18'),
(443, 100081, '25', 'Fully furnished', '2026-09-24 06:34:18'),
(444, 100081, '26', 'Upgraded kitchen and appliances', '2026-09-24 06:34:18'),
(445, 100081, '27', 'Upgraded finishes and lighting', '2026-09-24 06:34:18'),
(446, 100081, '28', 'Washer and dryer', '2026-09-24 06:34:18'),
(447, 100081, '29', 'Built-in cabinets and wardrobes', '2026-09-24 06:34:18'),
(448, 100081, '30', 'Balcony / terrace', '2026-09-24 06:34:18'),
(449, 100081, '31', 'Private indoor parking + shared outdoor parking', '2026-09-24 06:34:18'),
(450, 100081, '32', 'Shared lift', '2026-09-24 06:34:18'),
(451, 100080, '22', '1 master bedroom + 2-3 additional bedrooms', '2026-09-24 06:34:30'),
(452, 100080, '23', '1-2 living halls', '2026-09-24 06:34:30'),
(453, 100080, '24', '2-3 bathrooms', '2026-09-24 06:34:30'),
(454, 100080, '25', 'Fully furnished', '2026-09-24 06:34:30'),
(455, 100080, '26', 'Upgraded kitchen and appliances', '2026-09-24 06:34:30'),
(456, 100080, '27', 'Upgraded finishes and lighting', '2026-09-24 06:34:30'),
(457, 100080, '28', 'Washer and dryer', '2026-09-24 06:34:30'),
(458, 100080, '29', 'Built-in cabinets and wardrobes', '2026-09-24 06:34:30'),
(459, 100080, '30', 'Balcony / terrace', '2026-09-24 06:34:30'),
(460, 100080, '31', 'Private indoor parking + shared outdoor parking', '2026-09-24 06:34:30'),
(461, 100080, '32', 'Shared lift', '2026-09-24 06:34:30'),
(462, 100082, '45', '1 master bedroom + 2-3 additional bedrooms', '2026-09-24 06:34:57'),
(463, 100082, '46', '2 living halls', '2026-09-24 06:34:57'),
(464, 100082, '47', '3 bathrooms', '2026-09-24 06:34:57'),
(465, 100082, '48', 'Fully furnished & equipped', '2026-09-24 06:34:57'),
(466, 100082, '49', 'Complete furniture, appliances and lighting', '2026-09-24 06:34:57'),
(467, 100082, '50', 'Coordinated interior finishes', '2026-09-24 06:34:57'),
(468, 100082, '51', 'Fully equipped kitchen', '2026-09-24 06:34:57'),
(469, 100082, '52', 'Private laundry', '2026-09-24 06:34:57'),
(470, 100082, '53', 'Washer and dryer', '2026-09-24 06:34:57'),
(471, 100082, '54', 'Built-in cabinets and wardrobes', '2026-09-24 06:34:57'),
(472, 100082, '55', 'Balcony / terrace', '2026-09-24 06:34:57'),
(473, 100082, '56', 'Private indoor parking + shared outdoor parking', '2026-09-24 06:34:57'),
(474, 100082, '57', 'Shared lift', '2026-09-24 06:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `fathar_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `national_id` varchar(50) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `fathar_name`, `address`, `occupation`, `phone`, `email`, `national_id`, `profile_pic`, `created_at`) VALUES
(1, 'Ghulam Ahmad', 'Ghulam Farooq', 'Kabul', 'Self-employed', '0791349150', 'ahmad@gmail.com', '4567899', 'img/profilePic/1779349428_download.jpg', '2026-05-19 05:23:58'),
(3, 'Baryali', 'Haji Shah', 'Dehsabz, District 19', 'Designer', '0791349150', 'baryali03@gmail.com', '127689', 'img/profilePic/1779350221_images.jpg', '2026-05-21 07:57:01'),
(4, 'Mohammad Alam', 'Ahmad Khan', 'District 5, Kabul - Afghanistan', 'Self-employed', '0784848653', 'mohammad@gmail.com', '0435678', NULL, '2026-06-16 05:38:40'),
(5, 'Haji Zalmai', 'Haji Ghulam', 'Macroryan 3', 'Self-employed', '0791349150', 'zalmai03@gmail.com', '12345', NULL, '2026-08-16 04:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `manazil`
--

CREATE TABLE `manazil` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Building / manzel name, e.g. منزل 1',
  `code` varchar(50) DEFAULT NULL COMMENT 'Optional short code',
  `floors_count` int(11) NOT NULL DEFAULT 1 COMMENT 'Number of floors',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manazil`
--

INSERT INTO `manazil` (`id`, `block_id`, `name`, `code`, `floors_count`, `notes`, `created_at`) VALUES
(17, 10034, '2nd Floor', 'MZ2', 4, '', '2026-09-24 06:15:55'),
(18, 10034, '3rd Floor', 'MZ3', 4, '', '2026-09-24 06:20:41'),
(19, 10034, '4th Floor', 'MZ4', 4, '', '2026-09-24 06:21:03'),
(20, 10034, '5th Floor', 'MZ5', 3, '', '2026-09-24 06:21:30'),
(21, 10034, '6th Floor', 'MZ6', 2, '', '2026-09-24 06:21:45'),
(22, 10034, '7th Floor', 'MZ7', 1, '', '2026-09-24 06:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `pay_200`
--

CREATE TABLE `pay_200` (
  `id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pay_200`
--

INSERT INTO `pay_200` (`id`, `plot_id`, `customer_id`, `amount`, `payment_date`, `note`) VALUES
(1, 1, 3, 1000.00, '2026-06-16 03:24:02', NULL),
(2, 1, 3, 500.00, '2026-09-06 05:24:57', NULL),
(3, 1, 3, 100.00, '2026-09-06 05:41:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pay_260`
--

CREATE TABLE `pay_260` (
  `id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_300`
--

CREATE TABLE `pay_300` (
  `id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pay_300`
--

INSERT INTO `pay_300` (`id`, `plot_id`, `customer_id`, `amount`, `payment_date`, `note`) VALUES
(1, 27, 5, 5000.00, '2026-08-16 04:25:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pay_400`
--

CREATE TABLE `pay_400` (
  `id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_510`
--

CREATE TABLE `pay_510` (
  `id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_600`
--

CREATE TABLE `pay_600` (
  `id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_1000`
--

CREATE TABLE `pay_1000` (
  `id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_block_units`
--

CREATE TABLE `pay_block_units` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL COMMENT 'شناسه اپارتمان/واحد (block_units.id)',
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_vip`
--

CREATE TABLE `pay_vip` (
  `id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plots_200`
--

CREATE TABLE `plots_200` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'Two Biswa (200 sqm)',
  `area` int(11) DEFAULT 200,
  `base_price` decimal(12,2) DEFAULT NULL,
  `infra_cost` decimal(12,2) DEFAULT NULL,
  `gov_cost` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('available','reserved','sold') DEFAULT 'available',
  `customer_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plots_200`
--

INSERT INTO `plots_200` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'p_2_1', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'sold', 3, NULL, NULL, '2026-05-24 06:32:04'),
(2, 'p_2_2', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'sold', 3, NULL, NULL, '2026-05-19 05:07:09'),
(3, 'p_2_3', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'sold', 3, NULL, NULL, '2026-05-19 05:07:09'),
(4, 'p_2_4', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(5, 'p_2_5', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(6, 'p_2_6', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(7, 'p_2_7', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(8, 'p_2_8', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(9, 'p_2_9', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(10, 'p_2_10', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(11, 'p_2_11', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(12, 'p_2_12', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(13, 'p_2_13', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(14, 'p_2_14', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(15, 'p_2_15', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(16, 'p_2_16', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(17, 'p_2_17', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(18, 'p_2_18', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(19, 'p_2_19', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(20, 'p_2_20', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(21, 'p_2_21', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(22, 'p_2_22', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(23, 'p_2_23', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(24, 'p_2_24', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(25, 'p_2_25', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(26, 'p_2_26', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(27, 'p_2_27', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(28, 'p_2_28', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(29, 'p_2_29', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(30, 'p_2_30', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(31, 'p_2_31', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(32, 'p_2_32', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(33, 'p_2_33', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(34, 'p_2_34', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(35, 'p_2_35', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(36, 'p_2_36', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(37, 'p_2_37', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(38, 'p_2_38', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(39, 'p_2_39', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(40, 'p_2_40', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(41, 'p_2_41', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(42, 'p_2_42', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(43, 'p_2_43', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(44, 'p_2_44', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(45, 'p_2_45', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(46, 'p_2_46', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(47, 'p_2_47', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(48, 'p_2_48', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(49, 'p_2_49', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(50, 'p_2_50', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(51, 'p_2_51', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(52, 'p_2_52', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(53, 'p_2_53', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(54, 'p_2_54', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(55, 'p_2_55', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(56, 'p_2_56', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(57, 'p_2_57', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(58, 'p_2_58', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(59, 'p_2_59', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(60, 'p_2_60', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(61, 'p_2_61', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(62, 'p_2_62', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(63, 'p_2_63', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(64, 'p_2_64', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(65, 'p_2_65', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(66, 'p_2_66', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(67, 'p_2_67', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(68, 'p_2_68', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(69, 'p_2_69', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(70, 'p_2_70', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(71, 'p_2_71', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(72, 'p_2_72', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(73, 'p_2_73', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(74, 'p_2_74', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(75, 'p_2_75', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(76, 'p_2_76', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(77, 'p_2_77', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(78, 'p_2_78', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(79, 'p_2_79', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(80, 'p_2_80', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(81, 'p_2_81', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(82, 'p_2_82', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(83, 'p_2_83', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(84, 'p_2_84', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(85, 'p_2_85', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(86, 'p_2_86', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(87, 'p_2_87', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(88, 'p_2_88', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(89, 'p_2_89', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(90, 'p_2_90', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(91, 'p_2_91', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(92, 'p_2_92', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(93, 'p_2_93', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(94, 'p_2_94', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(95, 'p_2_95', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(96, 'p_2_96', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(97, 'p_2_97', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(98, 'p_2_98', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(99, 'p_2_99', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(100, 'p_2_100', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(101, 'p_2_101', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(102, 'p_2_102', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(103, 'p_2_103', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(104, 'p_2_104', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(105, 'p_2_105', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(106, 'p_2_106', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(107, 'p_2_107', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(108, 'p_2_108', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(109, 'p_2_109', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(110, 'p_2_110', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(111, 'p_2_111', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(112, 'p_2_112', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(113, 'p_2_113', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(114, 'p_2_114', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(115, 'p_2_115', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(116, 'p_2_116', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(117, 'p_2_117', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(118, 'p_2_118', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(119, 'p_2_119', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(120, 'p_2_120', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(121, 'p_2_121', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(122, 'p_2_122', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(123, 'p_2_123', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(124, 'p_2_124', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(125, 'p_2_125', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(126, 'p_2_126', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(127, 'p_2_127', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(128, 'p_2_128', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(129, 'p_2_129', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(130, 'p_2_130', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(131, 'p_2_131', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(132, 'p_2_132', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(133, 'p_2_133', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(134, 'p_2_134', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(135, 'p_2_135', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(136, 'p_2_136', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(137, 'p_2_137', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(138, 'p_2_138', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(139, 'p_2_139', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(140, 'p_2_140', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(141, 'p_2_141', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(142, 'p_2_142', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(143, 'p_2_143', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(144, 'p_2_144', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(145, 'p_2_145', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(146, 'p_2_146', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `plots_260`
--

CREATE TABLE `plots_260` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'Two and a Half Biswa (260 sqm)',
  `area` int(11) DEFAULT 260,
  `base_price` decimal(12,2) DEFAULT NULL,
  `infra_cost` decimal(12,2) DEFAULT NULL,
  `gov_cost` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('available','reserved','sold') DEFAULT 'available',
  `customer_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plots_260`
--

INSERT INTO `plots_260` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'p_2.6_1', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'sold', 1, NULL, NULL, '2026-05-19 05:08:36'),
(2, 'p_2.6_2', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:36'),
(3, 'p_2.6_3', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:36'),
(4, 'p_2.6_4', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(5, 'p_2.6_5', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(6, 'p_2.6_6', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(7, 'p_2.6_7', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(8, 'p_2.6_8', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(9, 'p_2.6_9', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(10, 'p_2.6_10', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(11, 'p_2.6_11', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(12, 'p_2.6_12', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(13, 'p_2.6_13', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(14, 'p_2.6_14', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(15, 'p_2.6_15', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(16, 'p_2.6_16', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(17, 'p_2.6_17', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(18, 'p_2.6_18', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(19, 'p_2.6_19', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(20, 'p_2.6_20', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(21, 'p_2.6_21', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(22, 'p_2.6_22', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(23, 'p_2.6_23', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(24, 'p_2.6_24', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(25, 'p_2.6_25', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(26, 'p_2.6_26', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(27, 'p_2.6_27', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(28, 'p_2.6_28', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(29, 'p_2.6_29', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(30, 'p_2.6_30', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(31, 'p_2.6_31', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(32, 'p_2.6_32', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(33, 'p_2.6_33', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(34, 'p_2.6_34', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(35, 'p_2.6_35', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(36, 'p_2.6_36', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(37, 'p_2.6_37', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(38, 'p_2.6_38', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(39, 'p_2.6_39', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(40, 'p_2.6_40', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(41, 'p_2.6_41', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(42, 'p_2.6_42', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(43, 'p_2.6_43', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(44, 'p_2.6_44', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(45, 'p_2.6_45', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(46, 'p_2.6_46', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(47, 'p_2.6_47', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(48, 'p_2.6_48', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(49, 'p_2.6_49', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(50, 'p_2.6_50', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(51, 'p_2.6_51', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(52, 'p_2.6_52', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(53, 'p_2.6_53', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(54, 'p_2.6_54', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(55, 'p_2.6_55', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(56, 'p_2.6_56', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(57, 'p_2.6_57', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(58, 'p_2.6_58', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(59, 'p_2.6_59', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(60, 'p_2.6_60', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(61, 'p_2.6_61', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(62, 'p_2.6_62', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(63, 'p_2.6_63', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(64, 'p_2.6_64', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(65, 'p_2.6_65', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(66, 'p_2.6_66', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(67, 'p_2.6_67', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(68, 'p_2.6_68', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(69, 'p_2.6_69', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(70, 'p_2.6_70', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(71, 'p_2.6_71', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(72, 'p_2.6_72', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'sold', 4, NULL, NULL, '2026-05-19 05:08:37'),
(73, 'p_2.6_73', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(74, 'p_2.6_74', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(75, 'p_2.6_75', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(76, 'p_2.6_76', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(77, 'p_2.6_77', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(78, 'p_2.6_78', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(79, 'p_2.6_79', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(80, 'p_2.6_80', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(81, 'p_2.6_81', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(82, 'p_2.6_82', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(83, 'p_2.6_83', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(84, 'p_2.6_84', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(85, 'p_2.6_85', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(86, 'p_2.6_86', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(87, 'p_2.6_87', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(88, 'p_2.6_88', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(89, 'p_2.6_89', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(90, 'p_2.6_90', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(91, 'p_2.6_91', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(92, 'p_2.6_92', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(93, 'p_2.6_93', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(94, 'p_2.6_94', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(95, 'p_2.6_95', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(96, 'p_2.6_96', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(97, 'p_2.6_97', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(98, 'p_2.6_98', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(99, 'p_2.6_99', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(100, 'p_2.6_100', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(101, 'p_2.6_101', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(102, 'p_2.6_102', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(103, 'p_2.6_103', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(104, 'p_2.6_104', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(105, 'p_2.6_105', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(106, 'p_2.6_106', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(107, 'p_2.6_107', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(108, 'p_2.6_108', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(109, 'p_2.6_109', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(110, 'p_2.6_110', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(111, 'p_2.6_111', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(112, 'p_2.6_112', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(113, 'p_2.6_113', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(114, 'p_2.6_114', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(115, 'p_2.6_115', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(116, 'p_2.6_116', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(117, 'p_2.6_117', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(118, 'p_2.6_118', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(119, 'p_2.6_119', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(120, 'p_2.6_120', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(121, 'p_2.6_121', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(122, 'p_2.6_122', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(123, 'p_2.6_123', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(124, 'p_2.6_124', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(125, 'p_2.6_125', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(126, 'p_2.6_126', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(127, 'p_2.6_127', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(128, 'p_2.6_128', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(129, 'p_2.6_129', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(130, 'p_2.6_130', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(131, 'p_2.6_131', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(132, 'p_2.6_132', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(133, 'p_2.6_133', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(134, 'p_2.6_134', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(135, 'p_2.6_135', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(136, 'p_2.6_136', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(137, 'p_2.6_137', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(138, 'p_2.6_138', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(139, 'p_2.6_139', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(140, 'p_2.6_140', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(141, 'p_2.6_141', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(142, 'p_2.6_142', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(143, 'p_2.6_143', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(144, 'p_2.6_144', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(145, 'p_2.6_145', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(146, 'p_2.6_146', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(147, 'p_2.6_147', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(148, 'p_2.6_148', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(149, 'p_2.6_149', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(150, 'p_2.6_150', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(151, 'p_2.6_151', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(152, 'p_2.6_152', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(153, 'p_2.6_153', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(154, 'p_2.6_154', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(155, 'p_2.6_155', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(156, 'p_2.6_156', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(157, 'p_2.6_157', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(158, 'p_2.6_158', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(159, 'p_2.6_159', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(160, 'p_2.6_160', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(161, 'p_2.6_161', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(162, 'p_2.6_162', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(163, 'p_2.6_163', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(164, 'p_2.6_164', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(165, 'p_2.6_165', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(166, 'p_2.6_166', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(167, 'p_2.6_167', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(168, 'p_2.6_168', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(169, 'p_2.6_169', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(170, 'p_2.6_170', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(171, 'p_2.6_171', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(172, 'p_2.6_172', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(173, 'p_2.6_173', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(174, 'p_2.6_174', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(175, 'p_2.6_175', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(176, 'p_2.6_176', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(177, 'p_2.6_177', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(178, 'p_2.6_178', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(179, 'p_2.6_179', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(180, 'p_2.6_180', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(181, 'p_2.6_181', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(182, 'p_2.6_182', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(183, 'p_2.6_183', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(184, 'p_2.6_184', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(185, 'p_2.6_185', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(186, 'p_2.6_186', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(187, 'p_2.6_187', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(188, 'p_2.6_188', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(189, 'p_2.6_189', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(190, 'p_2.6_190', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(191, 'p_2.6_191', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(192, 'p_2.6_192', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(193, 'p_2.6_193', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(194, 'p_2.6_194', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(195, 'p_2.6_195', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(196, 'p_2.6_196', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(197, 'p_2.6_197', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(198, 'p_2.6_198', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(199, 'p_2.6_199', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(200, 'p_2.6_200', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(201, 'p_2.6_201', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(202, 'p_2.6_202', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(203, 'p_2.6_203', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(204, 'p_2.6_204', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(205, 'p_2.6_205', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(206, 'p_2.6_206', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(207, 'p_2.6_207', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(208, 'p_2.6_208', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(209, 'p_2.6_209', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(210, 'p_2.6_210', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(211, 'p_2.6_211', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(212, 'p_2.6_212', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(213, 'p_2.6_213', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(214, 'p_2.6_214', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(215, 'p_2.6_215', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(216, 'p_2.6_216', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(217, 'p_2.6_217', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(218, 'p_2.6_218', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(219, 'p_2.6_219', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(220, 'p_2.6_220', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(221, 'p_2.6_221', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(222, 'p_2.6_222', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(223, 'p_2.6_223', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(224, 'p_2.6_224', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(225, 'p_2.6_225', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(226, 'p_2.6_226', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(227, 'p_2.6_227', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(228, 'p_2.6_228', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(229, 'p_2.6_229', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(230, 'p_2.6_230', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(231, 'p_2.6_231', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(232, 'p_2.6_232', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(233, 'p_2.6_233', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(234, 'p_2.6_234', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(235, 'p_2.6_235', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(236, 'p_2.6_236', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(237, 'p_2.6_237', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(238, 'p_2.6_238', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(239, 'p_2.6_239', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(240, 'p_2.6_240', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(241, 'p_2.6_241', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(242, 'p_2.6_242', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(243, 'p_2.6_243', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(244, 'p_2.6_244', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(245, 'p_2.6_245', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(246, 'p_2.6_246', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(247, 'p_2.6_247', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(248, 'p_2.6_248', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(249, 'p_2.6_249', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(250, 'p_2.6_250', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(251, 'p_2.6_251', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(252, 'p_2.6_252', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(253, 'p_2.6_253', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(254, 'p_2.6_254', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(255, 'p_2.6_255', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(256, 'p_2.6_256', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(257, 'p_2.6_257', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(258, 'p_2.6_258', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(259, 'p_2.6_259', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(260, 'p_2.6_260', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(261, 'p_2.6_261', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(262, 'p_2.6_262', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(263, 'p_2.6_263', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(264, 'p_2.6_264', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(265, 'p_2.6_265', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(266, 'p_2.6_266', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(267, 'p_2.6_267', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(268, 'p_2.6_268', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(269, 'p_2.6_269', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(270, 'p_2.6_270', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(271, 'p_2.6_271', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(272, 'p_2.6_272', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(273, 'p_2.6_273', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(274, 'p_2.6_274', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(275, 'p_2.6_275', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(276, 'p_2.6_276', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(277, 'p_2.6_277', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(278, 'p_2.6_278', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(279, 'p_2.6_279', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(280, 'p_2.6_280', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(281, 'p_2.6_281', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(282, 'p_2.6_282', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(283, 'p_2.6_283', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(284, 'p_2.6_284', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(285, 'p_2.6_285', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(286, 'p_2.6_286', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(287, 'p_2.6_287', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(288, 'p_2.6_288', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(289, 'p_2.6_289', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(290, 'p_2.6_290', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(291, 'p_2.6_291', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(292, 'p_2.6_292', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(293, 'p_2.6_293', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(294, 'p_2.6_294', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(295, 'p_2.6_295', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(296, 'p_2.6_296', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(297, 'p_2.6_297', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(298, 'p_2.6_298', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(299, 'p_2.6_299', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(300, 'p_2.6_300', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(301, 'p_2.6_301', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(302, 'p_2.6_302', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(303, 'p_2.6_303', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(304, 'p_2.6_304', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(305, 'p_2.6_305', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(306, 'p_2.6_306', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(307, 'p_2.6_307', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(308, 'p_2.6_308', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(309, 'p_2.6_309', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(310, 'p_2.6_310', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(311, 'p_2.6_311', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(312, 'p_2.6_312', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(313, 'p_2.6_313', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(314, 'p_2.6_314', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(315, 'p_2.6_315', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(316, 'p_2.6_316', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(317, 'p_2.6_317', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(318, 'p_2.6_318', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(319, 'p_2.6_319', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(320, 'p_2.6_320', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(321, 'p_2.6_321', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(322, 'p_2.6_322', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(323, 'p_2.6_323', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(324, 'p_2.6_324', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(325, 'p_2.6_325', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(326, 'p_2.6_326', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(327, 'p_2.6_327', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(328, 'p_2.6_328', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(329, 'p_2.6_329', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(330, 'p_2.6_330', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(331, 'p_2.6_331', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(332, 'p_2.6_332', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(333, 'p_2.6_333', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(334, 'p_2.6_334', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(335, 'p_2.6_335', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(336, 'p_2.6_336', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(337, 'p_2.6_337', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(338, 'p_2.6_338', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(339, 'p_2.6_339', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(340, 'p_2.6_340', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37');
INSERT INTO `plots_260` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(341, 'p_2.6_341', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(342, 'p_2.6_342', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(343, 'p_2.6_343', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(344, 'p_2.6_344', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(345, 'p_2.6_345', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(346, 'p_2.6_346', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(347, 'p_2.6_347', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(348, 'p_2.6_348', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(349, 'p_2.6_349', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(350, 'p_2.6_350', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(351, 'p_2.6_351', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(352, 'p_2.6_352', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(353, 'p_2.6_353', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(354, 'p_2.6_354', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(355, 'p_2.6_355', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(356, 'p_2.6_356', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(357, 'p_2.6_357', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(358, 'p_2.6_358', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(359, 'p_2.6_359', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(360, 'p_2.6_360', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(361, 'p_2.6_361', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(362, 'p_2.6_362', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(363, 'p_2.6_363', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(364, 'p_2.6_364', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(365, 'p_2.6_365', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(366, 'p_2.6_366', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(367, 'p_2.6_367', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(368, 'p_2.6_368', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(369, 'p_2.6_369', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(370, 'p_2.6_370', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(371, 'p_2.6_371', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(372, 'p_2.6_372', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(373, 'p_2.6_373', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(374, 'p_2.6_374', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(375, 'p_2.6_375', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(376, 'p_2.6_376', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(377, 'p_2.6_377', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(378, 'p_2.6_378', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(379, 'p_2.6_379', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(380, 'p_2.6_380', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(381, 'p_2.6_381', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(382, 'p_2.6_382', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(383, 'p_2.6_383', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(384, 'p_2.6_384', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(385, 'p_2.6_385', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(386, 'p_2.6_386', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(387, 'p_2.6_387', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(388, 'p_2.6_388', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(389, 'p_2.6_389', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(390, 'p_2.6_390', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(391, 'p_2.6_391', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(392, 'p_2.6_392', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(393, 'p_2.6_393', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(394, 'p_2.6_394', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(395, 'p_2.6_395', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(396, 'p_2.6_396', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(397, 'p_2.6_397', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(398, 'p_2.6_398', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(399, 'p_2.6_399', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(400, 'p_2.6_400', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(401, 'p_2.6_401', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(402, 'p_2.6_402', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(403, 'p_2.6_403', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(404, 'p_2.6_404', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(405, 'p_2.6_405', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(406, 'p_2.6_406', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(407, 'p_2.6_407', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(408, 'p_2.6_408', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(409, 'p_2.6_409', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(410, 'p_2.6_410', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(411, 'p_2.6_411', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(412, 'p_2.6_412', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(413, 'p_2.6_413', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(414, 'p_2.6_414', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(415, 'p_2.6_415', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(416, 'p_2.6_416', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(417, 'p_2.6_417', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(418, 'p_2.6_418', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(419, 'p_2.6_419', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(420, 'p_2.6_420', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(421, 'p_2.6_421', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(422, 'p_2.6_422', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(423, 'p_2.6_423', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(424, 'p_2.6_424', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(425, 'p_2.6_425', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(426, 'p_2.6_426', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(427, 'p_2.6_427', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(428, 'p_2.6_428', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(429, 'p_2.6_429', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(430, 'p_2.6_430', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(431, 'p_2.6_431', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(432, 'p_2.6_432', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(433, 'p_2.6_433', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(434, 'p_2.6_434', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(435, 'p_2.6_435', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(436, 'p_2.6_436', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(437, 'p_2.6_437', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(438, 'p_2.6_438', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(439, 'p_2.6_439', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(440, 'p_2.6_440', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(441, 'p_2.6_441', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(442, 'p_2.6_442', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(443, 'p_2.6_443', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(444, 'p_2.6_444', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(445, 'p_2.6_445', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(446, 'p_2.6_446', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(447, 'p_2.6_447', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(448, 'p_2.6_448', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(449, 'p_2.6_449', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(450, 'p_2.6_450', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(451, 'p_2.6_451', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(452, 'p_2.6_452', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(453, 'p_2.6_453', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(454, 'p_2.6_454', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(455, 'p_2.6_455', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(456, 'p_2.6_456', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(457, 'p_2.6_457', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(458, 'p_2.6_458', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(459, 'p_2.6_459', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(460, 'p_2.6_460', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(461, 'p_2.6_461', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(462, 'p_2.6_462', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(463, 'p_2.6_463', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(464, 'p_2.6_464', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(465, 'p_2.6_465', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(466, 'p_2.6_466', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(467, 'p_2.6_467', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(468, 'p_2.6_468', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(469, 'p_2.6_469', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(470, 'p_2.6_470', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(471, 'p_2.6_471', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(472, 'p_2.6_472', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(473, 'p_2.6_473', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(474, 'p_2.6_474', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(475, 'p_2.6_475', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(476, 'p_2.6_476', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(477, 'p_2.6_477', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(478, 'p_2.6_478', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(479, 'p_2.6_479', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(480, 'p_2.6_480', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(481, 'p_2.6_481', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(482, 'p_2.6_482', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(483, 'p_2.6_483', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(484, 'p_2.6_484', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(485, 'p_2.6_485', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(486, 'p_2.6_486', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(487, 'p_2.6_487', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(488, 'p_2.6_488', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(489, 'p_2.6_489', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(490, 'p_2.6_490', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(491, 'p_2.6_491', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(492, 'p_2.6_492', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(493, 'p_2.6_493', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(494, 'p_2.6_494', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(495, 'p_2.6_495', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(496, 'p_2.6_496', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(497, 'p_2.6_497', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `plots_300`
--

CREATE TABLE `plots_300` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'Three Biswa (300 sqm)',
  `area` int(11) DEFAULT 300,
  `base_price` decimal(12,2) DEFAULT NULL,
  `infra_cost` decimal(12,2) DEFAULT NULL,
  `gov_cost` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('available','reserved','sold') DEFAULT 'available',
  `customer_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plots_300`
--

INSERT INTO `plots_300` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'p_3_1', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'sold', 1, NULL, NULL, '2026-05-19 05:09:51'),
(2, 'p_3_2', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(3, 'p_3_3', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(4, 'p_3_4', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(5, 'p_3_5', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(6, 'p_3_6', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(7, 'p_3_7', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(8, 'p_3_8', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(9, 'p_3_9', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(10, 'p_3_10', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(11, 'p_3_11', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(12, 'p_3_12', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(13, 'p_3_13', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(14, 'p_3_14', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(15, 'p_3_15', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(16, 'p_3_16', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(17, 'p_3_17', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(18, 'p_3_18', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(19, 'p_3_19', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(20, 'p_3_20', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(21, 'p_3_21', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(22, 'p_3_22', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(23, 'p_3_23', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(24, 'p_3_24', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(25, 'p_3_25', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(26, 'p_3_26', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(27, 'p_3_27', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'sold', 5, NULL, NULL, '2026-05-19 05:09:51'),
(28, 'p_3_28', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(29, 'p_3_29', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(30, 'p_3_30', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(31, 'p_3_31', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(32, 'p_3_32', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(33, 'p_3_33', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(34, 'p_3_34', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(35, 'p_3_35', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(36, 'p_3_36', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(37, 'p_3_37', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(38, 'p_3_38', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(39, 'p_3_39', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(40, 'p_3_40', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(41, 'p_3_41', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(42, 'p_3_42', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(43, 'p_3_43', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(44, 'p_3_44', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(45, 'p_3_45', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(46, 'p_3_46', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(47, 'p_3_47', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(48, 'p_3_48', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(49, 'p_3_49', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(50, 'p_3_50', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(51, 'p_3_51', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(52, 'p_3_52', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(53, 'p_3_53', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(54, 'p_3_54', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(55, 'p_3_55', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(56, 'p_3_56', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(57, 'p_3_57', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(58, 'p_3_58', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(59, 'p_3_59', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(60, 'p_3_60', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(61, 'p_3_61', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(62, 'p_3_62', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(63, 'p_3_63', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(64, 'p_3_64', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(65, 'p_3_65', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(66, 'p_3_66', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(67, 'p_3_67', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(68, 'p_3_68', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(69, 'p_3_69', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(70, 'p_3_70', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(71, 'p_3_71', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(72, 'p_3_72', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(73, 'p_3_73', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(74, 'p_3_74', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(75, 'p_3_75', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(76, 'p_3_76', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(77, 'p_3_77', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(78, 'p_3_78', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(79, 'p_3_79', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(80, 'p_3_80', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(81, 'p_3_81', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(82, 'p_3_82', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(83, 'p_3_83', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(84, 'p_3_84', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(85, 'p_3_85', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(86, 'p_3_86', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(87, 'p_3_87', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(88, 'p_3_88', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(89, 'p_3_89', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(90, 'p_3_90', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(91, 'p_3_91', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(92, 'p_3_92', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(93, 'p_3_93', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(94, 'p_3_94', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(95, 'p_3_95', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(96, 'p_3_96', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(97, 'p_3_97', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(98, 'p_3_98', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(99, 'p_3_99', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(100, 'p_3_100', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(101, 'p_3_101', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(102, 'p_3_102', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(103, 'p_3_103', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(104, 'p_3_104', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(105, 'p_3_105', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(106, 'p_3_106', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(107, 'p_3_107', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(108, 'p_3_108', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(109, 'p_3_109', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(110, 'p_3_110', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(111, 'p_3_111', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(112, 'p_3_112', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(113, 'p_3_113', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(114, 'p_3_114', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(115, 'p_3_115', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(116, 'p_3_116', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(117, 'p_3_117', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(118, 'p_3_118', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(119, 'p_3_119', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(120, 'p_3_120', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(121, 'p_3_121', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(122, 'p_3_122', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(123, 'p_3_123', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(124, 'p_3_124', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(125, 'p_3_125', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(126, 'p_3_126', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(127, 'p_3_127', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(128, 'p_3_128', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(129, 'p_3_129', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(130, 'p_3_130', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(131, 'p_3_131', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(132, 'p_3_132', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(133, 'p_3_133', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(134, 'p_3_134', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(135, 'p_3_135', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(136, 'p_3_136', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(137, 'p_3_137', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(138, 'p_3_138', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(139, 'p_3_139', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(140, 'p_3_140', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(141, 'p_3_141', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(142, 'p_3_142', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(143, 'p_3_143', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(144, 'p_3_144', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(145, 'p_3_145', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(146, 'p_3_146', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(147, 'p_3_147', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(148, 'p_3_148', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(149, 'p_3_149', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(150, 'p_3_150', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(151, 'p_3_151', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(152, 'p_3_152', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(153, 'p_3_153', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(154, 'p_3_154', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(155, 'p_3_155', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(156, 'p_3_156', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(157, 'p_3_157', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(158, 'p_3_158', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(159, 'p_3_159', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(160, 'p_3_160', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(161, 'p_3_161', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(162, 'p_3_162', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(163, 'p_3_163', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(164, 'p_3_164', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(165, 'p_3_165', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(166, 'p_3_166', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(167, 'p_3_167', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(168, 'p_3_168', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(169, 'p_3_169', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(170, 'p_3_170', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(171, 'p_3_171', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(172, 'p_3_172', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(173, 'p_3_173', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(174, 'p_3_174', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(175, 'p_3_175', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(176, 'p_3_176', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(177, 'p_3_177', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(178, 'p_3_178', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(179, 'p_3_179', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(180, 'p_3_180', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(181, 'p_3_181', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(182, 'p_3_182', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(183, 'p_3_183', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(184, 'p_3_184', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(185, 'p_3_185', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(186, 'p_3_186', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(187, 'p_3_187', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(188, 'p_3_188', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(189, 'p_3_189', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(190, 'p_3_190', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(191, 'p_3_191', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(192, 'p_3_192', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(193, 'p_3_193', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(194, 'p_3_194', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(195, 'p_3_195', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(196, 'p_3_196', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(197, 'p_3_197', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(198, 'p_3_198', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(199, 'p_3_199', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(200, 'p_3_200', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(201, 'p_3_201', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(202, 'p_3_202', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(203, 'p_3_203', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(204, 'p_3_204', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(205, 'p_3_205', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(206, 'p_3_206', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(207, 'p_3_207', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(208, 'p_3_208', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(209, 'p_3_209', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(210, 'p_3_210', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(211, 'p_3_211', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(212, 'p_3_212', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(213, 'p_3_213', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(214, 'p_3_214', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(215, 'p_3_215', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(216, 'p_3_216', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(217, 'p_3_217', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(218, 'p_3_218', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(219, 'p_3_219', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(220, 'p_3_220', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(221, 'p_3_221', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(222, 'p_3_222', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(223, 'p_3_223', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(224, 'p_3_224', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(225, 'p_3_225', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(226, 'p_3_226', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(227, 'p_3_227', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(228, 'p_3_228', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(229, 'p_3_229', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(230, 'p_3_230', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(231, 'p_3_231', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(232, 'p_3_232', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(233, 'p_3_233', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(234, 'p_3_234', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(235, 'p_3_235', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(236, 'p_3_236', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(237, 'p_3_237', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(238, 'p_3_238', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(239, 'p_3_239', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(240, 'p_3_240', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(241, 'p_3_241', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(242, 'p_3_242', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(243, 'p_3_243', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(244, 'p_3_244', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(245, 'p_3_245', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(246, 'p_3_246', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(247, 'p_3_247', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(248, 'p_3_248', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(249, 'p_3_249', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(250, 'p_3_250', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(251, 'p_3_251', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(252, 'p_3_252', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(253, 'p_3_253', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(254, 'p_3_254', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(255, 'p_3_255', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(256, 'p_3_256', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(257, 'p_3_257', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(258, 'p_3_258', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(259, 'p_3_259', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(260, 'p_3_260', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(261, 'p_3_261', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(262, 'p_3_262', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(263, 'p_3_263', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(264, 'p_3_264', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(265, 'p_3_265', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(266, 'p_3_266', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(267, 'p_3_267', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(268, 'p_3_268', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(269, 'p_3_269', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(270, 'p_3_270', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(271, 'p_3_271', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(272, 'p_3_272', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(273, 'p_3_273', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(274, 'p_3_274', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(275, 'p_3_275', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(276, 'p_3_276', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(277, 'p_3_277', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(278, 'p_3_278', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(279, 'p_3_279', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(280, 'p_3_280', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(281, 'p_3_281', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(282, 'p_3_282', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(283, 'p_3_283', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(284, 'p_3_284', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(285, 'p_3_285', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(286, 'p_3_286', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(287, 'p_3_287', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(648, 'p_3_288', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-09-12 06:09:53'),
(649, 'p_3_289', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-09-12 06:10:42'),
(650, 'p_3_290', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-09-12 06:11:07'),
(651, 'p_3_291', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-09-12 06:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `plots_400`
--

CREATE TABLE `plots_400` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'Four Biswa (400 sqm)',
  `area` int(11) DEFAULT 400,
  `base_price` decimal(12,2) DEFAULT NULL,
  `infra_cost` decimal(12,2) DEFAULT NULL,
  `gov_cost` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('available','reserved','sold') DEFAULT 'available',
  `customer_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plots_400`
--

INSERT INTO `plots_400` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'p_4_1', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'sold', 1, NULL, NULL, '2026-05-19 05:10:37'),
(2, 'p_4_2', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(3, 'p_4_3', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(4, 'p_4_4', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(5, 'p_4_5', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(6, 'p_4_6', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(7, 'p_4_7', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(8, 'p_4_8', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(9, 'p_4_9', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(10, 'p_4_10', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(11, 'p_4_11', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(12, 'p_4_12', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(13, 'p_4_13', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(14, 'p_4_14', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(15, 'p_4_15', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(16, 'p_4_16', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(17, 'p_4_17', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(18, 'p_4_18', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(19, 'p_4_19', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(20, 'p_4_20', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(21, 'p_4_21', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(22, 'p_4_22', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(23, 'p_4_23', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(24, 'p_4_24', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(25, 'p_4_25', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(26, 'p_4_26', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(27, 'p_4_27', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(28, 'p_4_28', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(29, 'p_4_29', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(30, 'p_4_30', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(31, 'p_4_31', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(32, 'p_4_32', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(33, 'p_4_33', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(34, 'p_4_34', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(35, 'p_4_35', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(36, 'p_4_36', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(37, 'p_4_37', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(38, 'p_4_38', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(39, 'p_4_39', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(40, 'p_4_40', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(41, 'p_4_41', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(42, 'p_4_42', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(43, 'p_4_43', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(44, 'p_4_44', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(45, 'p_4_45', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(46, 'p_4_46', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(47, 'p_4_47', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(48, 'p_4_48', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(49, 'p_4_49', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(50, 'p_4_50', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(51, 'p_4_51', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(52, 'p_4_52', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(53, 'p_4_53', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-09-12 06:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `plots_510`
--

CREATE TABLE `plots_510` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'Five Biswa (510 sqm)',
  `area` int(11) DEFAULT 510,
  `base_price` decimal(12,2) DEFAULT NULL,
  `infra_cost` decimal(12,2) DEFAULT NULL,
  `gov_cost` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('available','reserved','sold') DEFAULT 'available',
  `customer_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plots_510`
--

INSERT INTO `plots_510` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'p_5_1', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'sold', 1, NULL, NULL, '2026-05-19 05:11:17'),
(2, 'p_5_2', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(3, 'p_5_3', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(4, 'p_5_4', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(5, 'p_5_5', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(6, 'p_5_6', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(7, 'p_5_7', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(8, 'p_5_8', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(9, 'p_5_9', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(10, 'p_5_10', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(11, 'p_5_11', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(12, 'p_5_12', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(13, 'p_5_13', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(14, 'p_5_14', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(15, 'p_5_15', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(16, 'p_5_16', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(17, 'p_5_17', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(18, 'p_5_18', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(19, 'p_5_19', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(20, 'p_5_20', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(21, 'p_5_21', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(22, 'p_5_22', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(23, 'p_5_23', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(24, 'p_5_24', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(25, 'p_5_25', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(26, 'p_5_26', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(27, 'p_5_27', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(28, 'p_5_28', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(29, 'p_5_29', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(30, 'p_5_30', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(31, 'p_5_31', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(32, 'p_5_32', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(33, 'p_5_33', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(34, 'p_5_34', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(35, 'p_5_35', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(36, 'p_5_36', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(37, 'p_5_37', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(38, 'p_5_38', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(39, 'p_5_39', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(40, 'p_5_40', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(41, 'p_5_41', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(42, 'p_5_42', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(43, 'p_5_43', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(44, 'p_5_44', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(45, 'p_5_45', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(46, 'p_5_46', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(47, 'p_5_47', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(48, 'p_5_48', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(49, 'p_5_49', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(50, 'p_5_50', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(51, 'p_5_51', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(52, 'p_5_52', 'Five Biswa (510 sqm)', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `plots_600`
--

CREATE TABLE `plots_600` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'Six Biswa (600 sqm)',
  `area` int(11) DEFAULT 600,
  `base_price` decimal(12,2) DEFAULT NULL,
  `infra_cost` decimal(12,2) DEFAULT NULL,
  `gov_cost` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('available','reserved','sold') DEFAULT 'available',
  `customer_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plots_600`
--

INSERT INTO `plots_600` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'p_6_1', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'sold', 1, NULL, NULL, '2026-05-19 05:11:59'),
(2, 'p_6_2', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(3, 'p_6_3', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(4, 'p_6_4', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(5, 'p_6_5', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(6, 'p_6_6', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(7, 'p_6_7', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(8, 'p_6_8', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(9, 'p_6_9', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(10, 'p_6_10', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(11, 'p_6_11', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(12, 'p_6_12', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(13, 'p_6_13', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(14, 'p_6_14', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(15, 'p_6_15', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(16, 'p_6_16', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(17, 'p_6_17', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(18, 'p_6_18', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(19, 'p_6_19', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(20, 'p_6_20', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(21, 'p_6_21', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(22, 'p_6_22', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(23, 'p_6_23', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(24, 'p_6_24', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(25, 'p_6_25', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(26, 'p_6_26', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(27, 'p_6_27', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(28, 'p_6_28', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(29, 'p_6_29', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(30, 'p_6_30', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(31, 'p_6_31', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(32, 'p_6_32', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(33, 'p_6_33', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(34, 'p_6_34', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(35, 'p_6_35', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(36, 'p_6_36', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(37, 'p_6_37', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(38, 'p_6_38', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(39, 'p_6_39', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(40, 'p_6_40', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(41, 'p_6_41', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(42, 'p_6_42', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(43, 'p_6_43', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(44, 'p_6_44', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(45, 'p_6_45', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(46, 'p_6_46', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(47, 'p_6_47', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(48, 'p_6_48', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(49, 'p_6_49', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(50, 'p_6_50', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(51, 'p_6_51', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(52, 'p_6_52', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(53, 'p_6_53', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(54, 'p_6_54', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(55, 'p_6_55', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(56, 'p_6_56', 'Six Biswa (600 sqm)', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `plots_1000`
--

CREATE TABLE `plots_1000` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'Ten Biswa (1000 sqm)',
  `area` int(11) DEFAULT 1000,
  `base_price` decimal(12,2) DEFAULT NULL,
  `infra_cost` decimal(12,2) DEFAULT NULL,
  `gov_cost` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('available','reserved','sold') DEFAULT 'available',
  `customer_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plots_1000`
--

INSERT INTO `plots_1000` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'p_10_E1', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'sold', 1, NULL, NULL, '2026-05-19 05:12:23'),
(2, 'p_10_E2', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(3, 'p_10_E3', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(4, 'p_10_E4', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(5, 'p_10_E5', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(6, 'p_10_E6', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(7, 'p_10_E7', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(8, 'p_10_E8', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(9, 'p_10_E9', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(10, 'p_10_E10', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(11, 'p_10_E11', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(12, 'p_10_E12', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(13, 'p_10_E13', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(14, 'p_10_E14', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(15, 'p_10_E15', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(16, 'p_10_E16', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(17, 'p_10_E17', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(18, 'p_10_E18', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(19, 'p_10_E19', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(20, 'p_10_E20', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(21, 'p_10_E21', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(22, 'p_10_E22', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(23, 'p_10_E23', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(24, 'p_10_E24', 'Ten Biswa (1000 sqm)', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `plots_vip`
--

CREATE TABLE `plots_vip` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'VIP',
  `area` int(11) DEFAULT NULL,
  `base_price` decimal(12,2) DEFAULT NULL,
  `infra_cost` decimal(12,2) DEFAULT NULL,
  `gov_cost` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('available','reserved','sold') DEFAULT 'available',
  `customer_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plots_vip`
--

INSERT INTO `plots_vip` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'p_vip_1', 'VIP', 0, 0.00, 0.00, 0.00, 0.00, 'sold', 1, NULL, NULL, '2026-05-19 05:13:18'),
(2, 'p_vip_2', 'VIP', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18'),
(3, 'p_vip_3', 'VIP', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18'),
(4, 'p_vip_4', 'VIP', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18'),
(5, 'p_vip_5', 'VIP', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18'),
(6, 'p_vip_6', 'VIP', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `unit_category_features`
--

CREATE TABLE `unit_category_features` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `feature` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_category_features`
--

INSERT INTO `unit_category_features` (`id`, `category`, `feature`, `sort_order`, `created_at`) VALUES
(1, 'standard', '1 master bedroom + 1 additional bedroom', 1, '2026-09-24 04:49:27'),
(2, 'standard', '1 living hall', 2, '2026-09-24 04:49:27'),
(3, 'standard', '1-2 bathrooms', 3, '2026-09-24 04:49:27'),
(4, 'standard', 'Fitted kitchen with full kitchen appliances', 4, '2026-09-24 04:49:27'),
(5, 'standard', 'Built-in wardrobes and cabinets', 5, '2026-09-24 04:49:27'),
(6, 'standard', 'Sanitary ware and lighting', 6, '2026-09-24 04:49:27'),
(7, 'standard', 'Washer and dryer', 7, '2026-09-24 04:49:27'),
(8, 'standard', 'Balcony', 8, '2026-09-24 04:49:27'),
(9, 'standard', 'Shared lift', 9, '2026-09-24 04:49:27'),
(10, 'standard', 'Shared outdoor parking', 10, '2026-09-24 04:49:27'),
(11, 'premium', '1 master bedroom + 2 additional bedrooms', 1, '2026-09-24 04:49:27'),
(12, 'premium', '1-2 living halls', 2, '2026-09-24 04:49:27'),
(13, 'premium', '2 bathrooms', 3, '2026-09-24 04:49:27'),
(14, 'premium', 'Fully equipped kitchen', 4, '2026-09-24 04:49:27'),
(15, 'premium', 'Selected bedroom and living furniture (semi-furnished)', 5, '2026-09-24 04:49:27'),
(16, 'premium', 'Upgraded finishes', 6, '2026-09-24 04:49:27'),
(17, 'premium', 'Washer and dryer', 7, '2026-09-24 04:49:27'),
(18, 'premium', 'Built-in cabinets and wardrobes', 8, '2026-09-24 04:49:27'),
(19, 'premium', 'Balcony', 9, '2026-09-24 04:49:27'),
(20, 'premium', 'Dedicated indoor parking + shared outdoor parking', 10, '2026-09-24 04:49:27'),
(21, 'premium', 'Shared lift', 11, '2026-09-24 04:49:27'),
(22, 'vip', '1 master bedroom + 2-3 additional bedrooms', 1, '2026-09-24 04:49:27'),
(23, 'vip', '1-2 living halls', 2, '2026-09-24 04:49:27'),
(24, 'vip', '2-3 bathrooms', 3, '2026-09-24 04:49:27'),
(25, 'vip', 'Fully furnished', 4, '2026-09-24 04:49:27'),
(26, 'vip', 'Upgraded kitchen and appliances', 5, '2026-09-24 04:49:27'),
(27, 'vip', 'Upgraded finishes and lighting', 6, '2026-09-24 04:49:27'),
(28, 'vip', 'Washer and dryer', 7, '2026-09-24 04:49:27'),
(29, 'vip', 'Built-in cabinets and wardrobes', 8, '2026-09-24 04:49:27'),
(30, 'vip', 'Balcony / terrace', 9, '2026-09-24 04:49:27'),
(31, 'vip', 'Private indoor parking + shared outdoor parking', 10, '2026-09-24 04:49:27'),
(32, 'vip', 'Shared lift', 11, '2026-09-24 04:49:27'),
(33, 'vvip', '1 master bedroom + 2-3 additional bedrooms', 1, '2026-09-24 04:49:27'),
(34, 'vvip', '1-2 living halls', 2, '2026-09-24 04:49:27'),
(35, 'vvip', '3 bathrooms', 3, '2026-09-24 04:49:27'),
(36, 'vvip', 'Private laundry', 4, '2026-09-24 04:49:27'),
(37, 'vvip', 'Fully equipped kitchen', 5, '2026-09-24 04:49:27'),
(38, 'vvip', 'Washer and dryer', 6, '2026-09-24 04:49:27'),
(39, 'vvip', 'Built-in cabinets and wardrobes', 7, '2026-09-24 04:49:27'),
(40, 'vvip', 'Fireplace and balcony', 8, '2026-09-24 04:49:27'),
(41, 'vvip', 'Shared lift', 9, '2026-09-24 04:49:27'),
(42, 'vvip', 'Fully furnished and equipped', 10, '2026-09-24 04:49:27'),
(43, 'vvip', 'Dedicated parking space(s), plus access to shared parking', 11, '2026-09-24 04:49:27'),
(44, 'vvip', 'No private lift, sauna or separate guest apartment', 12, '2026-09-24 04:49:27'),
(45, 'grand_residence', '1 master bedroom + 2-3 additional bedrooms', 1, '2026-09-24 04:49:27'),
(46, 'grand_residence', '2 living halls', 2, '2026-09-24 04:49:27'),
(47, 'grand_residence', '3 bathrooms', 3, '2026-09-24 04:49:27'),
(48, 'grand_residence', 'Fully furnished & equipped', 4, '2026-09-24 04:49:27'),
(49, 'grand_residence', 'Complete furniture, appliances and lighting', 5, '2026-09-24 04:49:27'),
(50, 'grand_residence', 'Coordinated interior finishes', 6, '2026-09-24 04:49:27'),
(51, 'grand_residence', 'Fully equipped kitchen', 7, '2026-09-24 04:49:27'),
(52, 'grand_residence', 'Private laundry', 8, '2026-09-24 04:49:27'),
(53, 'grand_residence', 'Washer and dryer', 9, '2026-09-24 04:49:27'),
(54, 'grand_residence', 'Built-in cabinets and wardrobes', 10, '2026-09-24 04:49:27'),
(55, 'grand_residence', 'Balcony / terrace', 11, '2026-09-24 04:49:27'),
(56, 'grand_residence', 'Private indoor parking + shared outdoor parking', 12, '2026-09-24 04:49:27'),
(57, 'grand_residence', 'Shared lift', 13, '2026-09-24 04:49:27'),
(58, 'grand_penthouse', '1 master bedroom + 2 additional bedrooms', 1, '2026-09-24 04:49:27'),
(59, 'grand_penthouse', '2 living halls', 2, '2026-09-24 04:49:27'),
(60, 'grand_penthouse', '3 bathrooms', 3, '2026-09-24 04:49:27'),
(61, 'grand_penthouse', 'Luxury penthouse finishes', 4, '2026-09-24 04:49:27'),
(62, 'grand_penthouse', 'Fully furnished & equipped', 5, '2026-09-24 04:49:27'),
(63, 'grand_penthouse', 'Fully equipped kitchen', 6, '2026-09-24 04:49:27'),
(64, 'grand_penthouse', 'Private laundry', 7, '2026-09-24 04:49:27'),
(65, 'grand_penthouse', 'Washer and dryer', 8, '2026-09-24 04:49:27'),
(66, 'grand_penthouse', 'Built-in cabinets and wardrobes', 9, '2026-09-24 04:49:27'),
(67, 'grand_penthouse', 'Balcony / terrace with best exposure', 10, '2026-09-24 04:49:27'),
(68, 'grand_penthouse', 'Premium private indoor parking', 11, '2026-09-24 04:49:27'),
(69, 'grand_penthouse', 'Private lift access', 12, '2026-09-24 04:49:27'),
(70, 'royal_penthouse', '2 master bedrooms + 2-3 additional bedrooms', 1, '2026-09-24 04:49:27'),
(71, 'royal_penthouse', '2-3 living halls', 2, '2026-09-24 04:49:27'),
(72, 'royal_penthouse', '3-4 bathrooms', 3, '2026-09-24 04:49:27'),
(73, 'royal_penthouse', 'Signature royal penthouse finishing', 4, '2026-09-24 04:49:27'),
(74, 'royal_penthouse', 'Fully furnished and equipped', 5, '2026-09-24 04:49:27'),
(75, 'royal_penthouse', 'Fully equipped gourmet kitchen', 6, '2026-09-24 04:49:27'),
(76, 'royal_penthouse', 'Private laundry / maid room', 7, '2026-09-24 04:49:27'),
(77, 'royal_penthouse', 'Washer and dryer', 8, '2026-09-24 04:49:27'),
(78, 'royal_penthouse', 'Built-in cabinets and wardrobes', 9, '2026-09-24 04:49:27'),
(79, 'royal_penthouse', 'Fireplace and large balcony / terrace', 10, '2026-09-24 04:49:27'),
(80, 'royal_penthouse', 'Private lift', 11, '2026-09-24 04:49:27'),
(81, 'royal_penthouse', 'Sauna and separate guest apartment', 12, '2026-09-24 04:49:27'),
(82, 'royal_penthouse', 'Premium private indoor parking', 13, '2026-09-24 04:49:27'),
(83, 'royal_penthouse', '24/7 security and concierge', 14, '2026-09-24 04:49:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `block_code` (`block_code`);

--
-- Indexes for table `block_amenities`
--
ALTER TABLE `block_amenities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `block_amenity_unique` (`block_id`,`amenity_key`);

--
-- Indexes for table `block_units`
--
ALTER TABLE `block_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `block_id` (`block_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `manzel_id` (`manzel_id`);

--
-- Indexes for table `block_unit_features`
--
ALTER TABLE `block_unit_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_feature_unique` (`unit_id`,`feature_key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manazil`
--
ALTER TABLE `manazil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manzel_block_name` (`block_id`,`name`);

--
-- Indexes for table `pay_200`
--
ALTER TABLE `pay_200`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plot_id` (`plot_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pay_260`
--
ALTER TABLE `pay_260`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plot_id` (`plot_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pay_300`
--
ALTER TABLE `pay_300`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plot_id` (`plot_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pay_400`
--
ALTER TABLE `pay_400`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plot_id` (`plot_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pay_510`
--
ALTER TABLE `pay_510`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plot_id` (`plot_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pay_600`
--
ALTER TABLE `pay_600`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plot_id` (`plot_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pay_1000`
--
ALTER TABLE `pay_1000`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plot_id` (`plot_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pay_block_units`
--
ALTER TABLE `pay_block_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pay_vip`
--
ALTER TABLE `pay_vip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plot_id` (`plot_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `plots_200`
--
ALTER TABLE `plots_200`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_200` (`customer_id`);

--
-- Indexes for table `plots_260`
--
ALTER TABLE `plots_260`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_260` (`customer_id`);

--
-- Indexes for table `plots_300`
--
ALTER TABLE `plots_300`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_300` (`customer_id`);

--
-- Indexes for table `plots_400`
--
ALTER TABLE `plots_400`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_400` (`customer_id`);

--
-- Indexes for table `plots_510`
--
ALTER TABLE `plots_510`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_500` (`customer_id`);

--
-- Indexes for table `plots_600`
--
ALTER TABLE `plots_600`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_600` (`customer_id`);

--
-- Indexes for table `plots_1000`
--
ALTER TABLE `plots_1000`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_1000` (`customer_id`);

--
-- Indexes for table `plots_vip`
--
ALTER TABLE `plots_vip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_vip` (`customer_id`);

--
-- Indexes for table `unit_category_features`
--
ALTER TABLE `unit_category_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_cat_feature` (`category`,`feature`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10035;

--
-- AUTO_INCREMENT for table `block_amenities`
--
ALTER TABLE `block_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `block_units`
--
ALTER TABLE `block_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100083;

--
-- AUTO_INCREMENT for table `block_unit_features`
--
ALTER TABLE `block_unit_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=475;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manazil`
--
ALTER TABLE `manazil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pay_200`
--
ALTER TABLE `pay_200`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pay_260`
--
ALTER TABLE `pay_260`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_300`
--
ALTER TABLE `pay_300`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pay_400`
--
ALTER TABLE `pay_400`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_510`
--
ALTER TABLE `pay_510`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_600`
--
ALTER TABLE `pay_600`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_1000`
--
ALTER TABLE `pay_1000`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_block_units`
--
ALTER TABLE `pay_block_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pay_vip`
--
ALTER TABLE `pay_vip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plots_200`
--
ALTER TABLE `plots_200`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `plots_260`
--
ALTER TABLE `plots_260`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=752;

--
-- AUTO_INCREMENT for table `plots_300`
--
ALTER TABLE `plots_300`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=652;

--
-- AUTO_INCREMENT for table `plots_400`
--
ALTER TABLE `plots_400`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `plots_510`
--
ALTER TABLE `plots_510`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `plots_600`
--
ALTER TABLE `plots_600`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `plots_1000`
--
ALTER TABLE `plots_1000`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `plots_vip`
--
ALTER TABLE `plots_vip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `unit_category_features`
--
ALTER TABLE `unit_category_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block_amenities`
--
ALTER TABLE `block_amenities`
  ADD CONSTRAINT `fk_block_amenities_block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `block_units`
--
ALTER TABLE `block_units`
  ADD CONSTRAINT `fk_block_units_block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_block_units_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_block_units_manzel` FOREIGN KEY (`manzel_id`) REFERENCES `manazil` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `block_unit_features`
--
ALTER TABLE `block_unit_features`
  ADD CONSTRAINT `fk_unit_features_unit` FOREIGN KEY (`unit_id`) REFERENCES `block_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manazil`
--
ALTER TABLE `manazil`
  ADD CONSTRAINT `fk_manazil_block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pay_200`
--
ALTER TABLE `pay_200`
  ADD CONSTRAINT `pay_200_ibfk_1` FOREIGN KEY (`plot_id`) REFERENCES `plots_200` (`id`),
  ADD CONSTRAINT `pay_200_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `pay_260`
--
ALTER TABLE `pay_260`
  ADD CONSTRAINT `pay_260_ibfk_1` FOREIGN KEY (`plot_id`) REFERENCES `plots_260` (`id`),
  ADD CONSTRAINT `pay_260_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `pay_300`
--
ALTER TABLE `pay_300`
  ADD CONSTRAINT `pay_300_ibfk_1` FOREIGN KEY (`plot_id`) REFERENCES `plots_300` (`id`),
  ADD CONSTRAINT `pay_300_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `pay_400`
--
ALTER TABLE `pay_400`
  ADD CONSTRAINT `pay_400_ibfk_1` FOREIGN KEY (`plot_id`) REFERENCES `plots_400` (`id`),
  ADD CONSTRAINT `pay_400_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `pay_510`
--
ALTER TABLE `pay_510`
  ADD CONSTRAINT `pay_510_ibfk_1` FOREIGN KEY (`plot_id`) REFERENCES `plots_510` (`id`),
  ADD CONSTRAINT `pay_510_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `pay_600`
--
ALTER TABLE `pay_600`
  ADD CONSTRAINT `pay_600_ibfk_1` FOREIGN KEY (`plot_id`) REFERENCES `plots_600` (`id`),
  ADD CONSTRAINT `pay_600_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `pay_1000`
--
ALTER TABLE `pay_1000`
  ADD CONSTRAINT `pay_1000_ibfk_1` FOREIGN KEY (`plot_id`) REFERENCES `plots_1000` (`id`),
  ADD CONSTRAINT `pay_1000_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `pay_block_units`
--
ALTER TABLE `pay_block_units`
  ADD CONSTRAINT `fk_pay_block_unit_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pay_block_unit_unit` FOREIGN KEY (`unit_id`) REFERENCES `block_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pay_vip`
--
ALTER TABLE `pay_vip`
  ADD CONSTRAINT `pay_vip_ibfk_1` FOREIGN KEY (`plot_id`) REFERENCES `plots_vip` (`id`),
  ADD CONSTRAINT `pay_vip_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `plots_200`
--
ALTER TABLE `plots_200`
  ADD CONSTRAINT `fk_customer_200` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `plots_260`
--
ALTER TABLE `plots_260`
  ADD CONSTRAINT `fk_customer_260` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `plots_300`
--
ALTER TABLE `plots_300`
  ADD CONSTRAINT `fk_customer_300` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `plots_400`
--
ALTER TABLE `plots_400`
  ADD CONSTRAINT `fk_customer_400` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `plots_510`
--
ALTER TABLE `plots_510`
  ADD CONSTRAINT `fk_customer_500` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `plots_600`
--
ALTER TABLE `plots_600`
  ADD CONSTRAINT `fk_customer_600` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `plots_1000`
--
ALTER TABLE `plots_1000`
  ADD CONSTRAINT `fk_customer_1000` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `plots_vip`
--
ALTER TABLE `plots_vip`
  ADD CONSTRAINT `fk_customer_vip` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
