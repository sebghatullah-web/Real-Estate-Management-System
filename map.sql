-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2026 at 06:17 AM
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
(1, 'admin', '$2y$10$EqGXPRqhCtXvedKyWZ0uPeE59JNaBg4AgEyorxdUC33hJXwmBt9xm', 'admin', 'admin@gmail.com', NULL, NULL, NULL, 'admin', '2026-06-16 03:51:32');

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
(1, 'غلام احمد', 'غلام فاروق', 'کابل', 'آزاد', '0791349150', 'ahmad@gmail.com', '4567899', 'img/profilePic/1779349428_download.jpg', '2026-05-19 05:23:58'),
(3, 'بریالی', 'حاجی شاه', 'ده سبز ناحیه 19', 'دیزاینر', '0791349150', 'baryali03@gmail.com', '127689', 'img/profilePic/1779350221_images.jpg', '2026-05-21 07:57:01'),
(4, 'محمد علم', 'احمد خان', 'ناحیه 5، کابل-افغانستان', 'آزاد', '0784848653', 'mohammad@gmail.com', '0435678', NULL, '2026-06-16 05:38:40');

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
(1, 1, 3, 1000.00, '2026-06-16 03:24:02', NULL);

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
  `type` varchar(50) DEFAULT 'دو بسوه‌ای',
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
(1, 'p_2_1', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'sold', 3, NULL, NULL, '2026-05-24 06:32:04'),
(2, 'p_2_2', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'sold', 3, NULL, NULL, '2026-05-19 05:07:09'),
(3, 'p_2_3', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'sold', 3, NULL, NULL, '2026-05-19 05:07:09'),
(4, 'p_2_4', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(5, 'p_2_5', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(6, 'p_2_6', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(7, 'p_2_7', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(8, 'p_2_8', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(9, 'p_2_9', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(10, 'p_2_10', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(11, 'p_2_11', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(12, 'p_2_12', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(13, 'p_2_13', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(14, 'p_2_14', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(15, 'p_2_15', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(16, 'p_2_16', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(17, 'p_2_17', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(18, 'p_2_18', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(19, 'p_2_19', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(20, 'p_2_20', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(21, 'p_2_21', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(22, 'p_2_22', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(23, 'p_2_23', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(24, 'p_2_24', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(25, 'p_2_25', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(26, 'p_2_26', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(27, 'p_2_27', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(28, 'p_2_28', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(29, 'p_2_29', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(30, 'p_2_30', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(31, 'p_2_31', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(32, 'p_2_32', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(33, 'p_2_33', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(34, 'p_2_34', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(35, 'p_2_35', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(36, 'p_2_36', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(37, 'p_2_37', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(38, 'p_2_38', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(39, 'p_2_39', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(40, 'p_2_40', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(41, 'p_2_41', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(42, 'p_2_42', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(43, 'p_2_43', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(44, 'p_2_44', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(45, 'p_2_45', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(46, 'p_2_46', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(47, 'p_2_47', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(48, 'p_2_48', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(49, 'p_2_49', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(50, 'p_2_50', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(51, 'p_2_51', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(52, 'p_2_52', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(53, 'p_2_53', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(54, 'p_2_54', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(55, 'p_2_55', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(56, 'p_2_56', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(57, 'p_2_57', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(58, 'p_2_58', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(59, 'p_2_59', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(60, 'p_2_60', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(61, 'p_2_61', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(62, 'p_2_62', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(63, 'p_2_63', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(64, 'p_2_64', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(65, 'p_2_65', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(66, 'p_2_66', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(67, 'p_2_67', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(68, 'p_2_68', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(69, 'p_2_69', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(70, 'p_2_70', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(71, 'p_2_71', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(72, 'p_2_72', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(73, 'p_2_73', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(74, 'p_2_74', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(75, 'p_2_75', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(76, 'p_2_76', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(77, 'p_2_77', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(78, 'p_2_78', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(79, 'p_2_79', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(80, 'p_2_80', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(81, 'p_2_81', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(82, 'p_2_82', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(83, 'p_2_83', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(84, 'p_2_84', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(85, 'p_2_85', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(86, 'p_2_86', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(87, 'p_2_87', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(88, 'p_2_88', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(89, 'p_2_89', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(90, 'p_2_90', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(91, 'p_2_91', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(92, 'p_2_92', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(93, 'p_2_93', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(94, 'p_2_94', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(95, 'p_2_95', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(96, 'p_2_96', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(97, 'p_2_97', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(98, 'p_2_98', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(99, 'p_2_99', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(100, 'p_2_100', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(101, 'p_2_101', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(102, 'p_2_102', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(103, 'p_2_103', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(104, 'p_2_104', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(105, 'p_2_105', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(106, 'p_2_106', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(107, 'p_2_107', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(108, 'p_2_108', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(109, 'p_2_109', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(110, 'p_2_110', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(111, 'p_2_111', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(112, 'p_2_112', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(113, 'p_2_113', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(114, 'p_2_114', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(115, 'p_2_115', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(116, 'p_2_116', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(117, 'p_2_117', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(118, 'p_2_118', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(119, 'p_2_119', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(120, 'p_2_120', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(121, 'p_2_121', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(122, 'p_2_122', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(123, 'p_2_123', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(124, 'p_2_124', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(125, 'p_2_125', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(126, 'p_2_126', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(127, 'p_2_127', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(128, 'p_2_128', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(129, 'p_2_129', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(130, 'p_2_130', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(131, 'p_2_131', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(132, 'p_2_132', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(133, 'p_2_133', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(134, 'p_2_134', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(135, 'p_2_135', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(136, 'p_2_136', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(137, 'p_2_137', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(138, 'p_2_138', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(139, 'p_2_139', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(140, 'p_2_140', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(141, 'p_2_141', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(142, 'p_2_142', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(143, 'p_2_143', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(144, 'p_2_144', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(145, 'p_2_145', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(146, 'p_2_146', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(147, 'p_2_147', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(148, 'p_2_148', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(149, 'p_2_149', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(150, 'p_2_150', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(151, 'p_2_151', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(152, 'p_2_152', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(153, 'p_2_153', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(154, 'p_2_154', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(155, 'p_2_155', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(156, 'p_2_156', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(157, 'p_2_157', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(158, 'p_2_158', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(159, 'p_2_159', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(160, 'p_2_160', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(161, 'p_2_161', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(162, 'p_2_162', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(163, 'p_2_163', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(164, 'p_2_164', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(165, 'p_2_165', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(166, 'p_2_166', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(167, 'p_2_167', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(168, 'p_2_168', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(169, 'p_2_169', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(170, 'p_2_170', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(171, 'p_2_171', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(172, 'p_2_172', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(173, 'p_2_173', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(174, 'p_2_174', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(175, 'p_2_175', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(176, 'p_2_176', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(177, 'p_2_177', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(178, 'p_2_178', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(179, 'p_2_179', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(180, 'p_2_180', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(181, 'p_2_181', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(182, 'p_2_182', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(183, 'p_2_183', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(184, 'p_2_184', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(185, 'p_2_185', 'دو بسوه‌ای', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `plots_260`
--

CREATE TABLE `plots_260` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'دونیم بسوه‌ای',
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
(1, 'p_2.6_1', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'sold', 1, NULL, NULL, '2026-05-19 05:08:36'),
(2, 'p_2.6_2', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:36'),
(3, 'p_2.6_3', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:36'),
(4, 'p_2.6_4', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(5, 'p_2.6_5', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(6, 'p_2.6_6', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(7, 'p_2.6_7', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(8, 'p_2.6_8', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(9, 'p_2.6_9', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(10, 'p_2.6_10', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(11, 'p_2.6_11', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(12, 'p_2.6_12', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(13, 'p_2.6_13', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(14, 'p_2.6_14', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(15, 'p_2.6_15', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(16, 'p_2.6_16', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(17, 'p_2.6_17', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(18, 'p_2.6_18', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(19, 'p_2.6_19', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(20, 'p_2.6_20', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(21, 'p_2.6_21', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(22, 'p_2.6_22', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(23, 'p_2.6_23', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(24, 'p_2.6_24', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(25, 'p_2.6_25', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(26, 'p_2.6_26', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(27, 'p_2.6_27', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(28, 'p_2.6_28', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(29, 'p_2.6_29', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(30, 'p_2.6_30', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(31, 'p_2.6_31', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(32, 'p_2.6_32', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(33, 'p_2.6_33', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(34, 'p_2.6_34', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(35, 'p_2.6_35', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(36, 'p_2.6_36', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(37, 'p_2.6_37', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(38, 'p_2.6_38', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(39, 'p_2.6_39', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(40, 'p_2.6_40', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(41, 'p_2.6_41', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(42, 'p_2.6_42', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(43, 'p_2.6_43', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(44, 'p_2.6_44', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(45, 'p_2.6_45', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(46, 'p_2.6_46', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(47, 'p_2.6_47', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(48, 'p_2.6_48', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(49, 'p_2.6_49', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(50, 'p_2.6_50', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(51, 'p_2.6_51', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(52, 'p_2.6_52', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(53, 'p_2.6_53', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(54, 'p_2.6_54', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(55, 'p_2.6_55', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(56, 'p_2.6_56', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(57, 'p_2.6_57', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(58, 'p_2.6_58', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(59, 'p_2.6_59', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(60, 'p_2.6_60', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(61, 'p_2.6_61', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(62, 'p_2.6_62', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(63, 'p_2.6_63', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(64, 'p_2.6_64', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(65, 'p_2.6_65', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(66, 'p_2.6_66', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(67, 'p_2.6_67', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(68, 'p_2.6_68', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(69, 'p_2.6_69', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(70, 'p_2.6_70', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(71, 'p_2.6_71', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(72, 'p_2.6_72', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'sold', 4, NULL, NULL, '2026-05-19 05:08:37'),
(73, 'p_2.6_73', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(74, 'p_2.6_74', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(75, 'p_2.6_75', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(76, 'p_2.6_76', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(77, 'p_2.6_77', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(78, 'p_2.6_78', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(79, 'p_2.6_79', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(80, 'p_2.6_80', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(81, 'p_2.6_81', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(82, 'p_2.6_82', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(83, 'p_2.6_83', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(84, 'p_2.6_84', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(85, 'p_2.6_85', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(86, 'p_2.6_86', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(87, 'p_2.6_87', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(88, 'p_2.6_88', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(89, 'p_2.6_89', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(90, 'p_2.6_90', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(91, 'p_2.6_91', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(92, 'p_2.6_92', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(93, 'p_2.6_93', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(94, 'p_2.6_94', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(95, 'p_2.6_95', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(96, 'p_2.6_96', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(97, 'p_2.6_97', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(98, 'p_2.6_98', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(99, 'p_2.6_99', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(100, 'p_2.6_100', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(101, 'p_2.6_101', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(102, 'p_2.6_102', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(103, 'p_2.6_103', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(104, 'p_2.6_104', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(105, 'p_2.6_105', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(106, 'p_2.6_106', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(107, 'p_2.6_107', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(108, 'p_2.6_108', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(109, 'p_2.6_109', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(110, 'p_2.6_110', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(111, 'p_2.6_111', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(112, 'p_2.6_112', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(113, 'p_2.6_113', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(114, 'p_2.6_114', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(115, 'p_2.6_115', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(116, 'p_2.6_116', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(117, 'p_2.6_117', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(118, 'p_2.6_118', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(119, 'p_2.6_119', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(120, 'p_2.6_120', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(121, 'p_2.6_121', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(122, 'p_2.6_122', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(123, 'p_2.6_123', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(124, 'p_2.6_124', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(125, 'p_2.6_125', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(126, 'p_2.6_126', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(127, 'p_2.6_127', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(128, 'p_2.6_128', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(129, 'p_2.6_129', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(130, 'p_2.6_130', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(131, 'p_2.6_131', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(132, 'p_2.6_132', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(133, 'p_2.6_133', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(134, 'p_2.6_134', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(135, 'p_2.6_135', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(136, 'p_2.6_136', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(137, 'p_2.6_137', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(138, 'p_2.6_138', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(139, 'p_2.6_139', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(140, 'p_2.6_140', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(141, 'p_2.6_141', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(142, 'p_2.6_142', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(143, 'p_2.6_143', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(144, 'p_2.6_144', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(145, 'p_2.6_145', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(146, 'p_2.6_146', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(147, 'p_2.6_147', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(148, 'p_2.6_148', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(149, 'p_2.6_149', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(150, 'p_2.6_150', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(151, 'p_2.6_151', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(152, 'p_2.6_152', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(153, 'p_2.6_153', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(154, 'p_2.6_154', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(155, 'p_2.6_155', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(156, 'p_2.6_156', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(157, 'p_2.6_157', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(158, 'p_2.6_158', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(159, 'p_2.6_159', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(160, 'p_2.6_160', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(161, 'p_2.6_161', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(162, 'p_2.6_162', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(163, 'p_2.6_163', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(164, 'p_2.6_164', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(165, 'p_2.6_165', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(166, 'p_2.6_166', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(167, 'p_2.6_167', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(168, 'p_2.6_168', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(169, 'p_2.6_169', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(170, 'p_2.6_170', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(171, 'p_2.6_171', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(172, 'p_2.6_172', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(173, 'p_2.6_173', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(174, 'p_2.6_174', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(175, 'p_2.6_175', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(176, 'p_2.6_176', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(177, 'p_2.6_177', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(178, 'p_2.6_178', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(179, 'p_2.6_179', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(180, 'p_2.6_180', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(181, 'p_2.6_181', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(182, 'p_2.6_182', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(183, 'p_2.6_183', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(184, 'p_2.6_184', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(185, 'p_2.6_185', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(186, 'p_2.6_186', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(187, 'p_2.6_187', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(188, 'p_2.6_188', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(189, 'p_2.6_189', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(190, 'p_2.6_190', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(191, 'p_2.6_191', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(192, 'p_2.6_192', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(193, 'p_2.6_193', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(194, 'p_2.6_194', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(195, 'p_2.6_195', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(196, 'p_2.6_196', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(197, 'p_2.6_197', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(198, 'p_2.6_198', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(199, 'p_2.6_199', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(200, 'p_2.6_200', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(201, 'p_2.6_201', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(202, 'p_2.6_202', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(203, 'p_2.6_203', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(204, 'p_2.6_204', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(205, 'p_2.6_205', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(206, 'p_2.6_206', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(207, 'p_2.6_207', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(208, 'p_2.6_208', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(209, 'p_2.6_209', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(210, 'p_2.6_210', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(211, 'p_2.6_211', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(212, 'p_2.6_212', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(213, 'p_2.6_213', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(214, 'p_2.6_214', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(215, 'p_2.6_215', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(216, 'p_2.6_216', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(217, 'p_2.6_217', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(218, 'p_2.6_218', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(219, 'p_2.6_219', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(220, 'p_2.6_220', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(221, 'p_2.6_221', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(222, 'p_2.6_222', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(223, 'p_2.6_223', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(224, 'p_2.6_224', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(225, 'p_2.6_225', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(226, 'p_2.6_226', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(227, 'p_2.6_227', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(228, 'p_2.6_228', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(229, 'p_2.6_229', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(230, 'p_2.6_230', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(231, 'p_2.6_231', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(232, 'p_2.6_232', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(233, 'p_2.6_233', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(234, 'p_2.6_234', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(235, 'p_2.6_235', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(236, 'p_2.6_236', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(237, 'p_2.6_237', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(238, 'p_2.6_238', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(239, 'p_2.6_239', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(240, 'p_2.6_240', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(241, 'p_2.6_241', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(242, 'p_2.6_242', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(243, 'p_2.6_243', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(244, 'p_2.6_244', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(245, 'p_2.6_245', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(246, 'p_2.6_246', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(247, 'p_2.6_247', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(248, 'p_2.6_248', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(249, 'p_2.6_249', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(250, 'p_2.6_250', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(251, 'p_2.6_251', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(252, 'p_2.6_252', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(253, 'p_2.6_253', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(254, 'p_2.6_254', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(255, 'p_2.6_255', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(256, 'p_2.6_256', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(257, 'p_2.6_257', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(258, 'p_2.6_258', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(259, 'p_2.6_259', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(260, 'p_2.6_260', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(261, 'p_2.6_261', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(262, 'p_2.6_262', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(263, 'p_2.6_263', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(264, 'p_2.6_264', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(265, 'p_2.6_265', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(266, 'p_2.6_266', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(267, 'p_2.6_267', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(268, 'p_2.6_268', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(269, 'p_2.6_269', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(270, 'p_2.6_270', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(271, 'p_2.6_271', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(272, 'p_2.6_272', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(273, 'p_2.6_273', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(274, 'p_2.6_274', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(275, 'p_2.6_275', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(276, 'p_2.6_276', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(277, 'p_2.6_277', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(278, 'p_2.6_278', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(279, 'p_2.6_279', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(280, 'p_2.6_280', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(281, 'p_2.6_281', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(282, 'p_2.6_282', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(283, 'p_2.6_283', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(284, 'p_2.6_284', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(285, 'p_2.6_285', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(286, 'p_2.6_286', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(287, 'p_2.6_287', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(288, 'p_2.6_288', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(289, 'p_2.6_289', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(290, 'p_2.6_290', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(291, 'p_2.6_291', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(292, 'p_2.6_292', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(293, 'p_2.6_293', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(294, 'p_2.6_294', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(295, 'p_2.6_295', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(296, 'p_2.6_296', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(297, 'p_2.6_297', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(298, 'p_2.6_298', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(299, 'p_2.6_299', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(300, 'p_2.6_300', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(301, 'p_2.6_301', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(302, 'p_2.6_302', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(303, 'p_2.6_303', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(304, 'p_2.6_304', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(305, 'p_2.6_305', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(306, 'p_2.6_306', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(307, 'p_2.6_307', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(308, 'p_2.6_308', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(309, 'p_2.6_309', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(310, 'p_2.6_310', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(311, 'p_2.6_311', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(312, 'p_2.6_312', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(313, 'p_2.6_313', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(314, 'p_2.6_314', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(315, 'p_2.6_315', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(316, 'p_2.6_316', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(317, 'p_2.6_317', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(318, 'p_2.6_318', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(319, 'p_2.6_319', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(320, 'p_2.6_320', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(321, 'p_2.6_321', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(322, 'p_2.6_322', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(323, 'p_2.6_323', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(324, 'p_2.6_324', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(325, 'p_2.6_325', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(326, 'p_2.6_326', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(327, 'p_2.6_327', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(328, 'p_2.6_328', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(329, 'p_2.6_329', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(330, 'p_2.6_330', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(331, 'p_2.6_331', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(332, 'p_2.6_332', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(333, 'p_2.6_333', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(334, 'p_2.6_334', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(335, 'p_2.6_335', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(336, 'p_2.6_336', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(337, 'p_2.6_337', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(338, 'p_2.6_338', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(339, 'p_2.6_339', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(340, 'p_2.6_340', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(341, 'p_2.6_341', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(342, 'p_2.6_342', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(343, 'p_2.6_343', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(344, 'p_2.6_344', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(345, 'p_2.6_345', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(346, 'p_2.6_346', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(347, 'p_2.6_347', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(348, 'p_2.6_348', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(349, 'p_2.6_349', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(350, 'p_2.6_350', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(351, 'p_2.6_351', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(352, 'p_2.6_352', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(353, 'p_2.6_353', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(354, 'p_2.6_354', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(355, 'p_2.6_355', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(356, 'p_2.6_356', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(357, 'p_2.6_357', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(358, 'p_2.6_358', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(359, 'p_2.6_359', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(360, 'p_2.6_360', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(361, 'p_2.6_361', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(362, 'p_2.6_362', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(363, 'p_2.6_363', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(364, 'p_2.6_364', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(365, 'p_2.6_365', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(366, 'p_2.6_366', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(367, 'p_2.6_367', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(368, 'p_2.6_368', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(369, 'p_2.6_369', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(370, 'p_2.6_370', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(371, 'p_2.6_371', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(372, 'p_2.6_372', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(373, 'p_2.6_373', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(374, 'p_2.6_374', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(375, 'p_2.6_375', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(376, 'p_2.6_376', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(377, 'p_2.6_377', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(378, 'p_2.6_378', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(379, 'p_2.6_379', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(380, 'p_2.6_380', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(381, 'p_2.6_381', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(382, 'p_2.6_382', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(383, 'p_2.6_383', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(384, 'p_2.6_384', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37');
INSERT INTO `plots_260` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(385, 'p_2.6_385', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(386, 'p_2.6_386', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(387, 'p_2.6_387', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(388, 'p_2.6_388', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(389, 'p_2.6_389', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(390, 'p_2.6_390', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(391, 'p_2.6_391', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(392, 'p_2.6_392', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(393, 'p_2.6_393', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(394, 'p_2.6_394', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(395, 'p_2.6_395', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(396, 'p_2.6_396', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(397, 'p_2.6_397', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(398, 'p_2.6_398', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(399, 'p_2.6_399', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(400, 'p_2.6_400', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(401, 'p_2.6_401', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(402, 'p_2.6_402', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(403, 'p_2.6_403', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(404, 'p_2.6_404', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(405, 'p_2.6_405', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(406, 'p_2.6_406', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(407, 'p_2.6_407', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(408, 'p_2.6_408', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(409, 'p_2.6_409', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(410, 'p_2.6_410', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(411, 'p_2.6_411', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(412, 'p_2.6_412', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(413, 'p_2.6_413', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(414, 'p_2.6_414', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(415, 'p_2.6_415', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(416, 'p_2.6_416', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(417, 'p_2.6_417', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(418, 'p_2.6_418', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(419, 'p_2.6_419', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(420, 'p_2.6_420', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(421, 'p_2.6_421', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(422, 'p_2.6_422', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(423, 'p_2.6_423', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(424, 'p_2.6_424', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(425, 'p_2.6_425', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(426, 'p_2.6_426', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(427, 'p_2.6_427', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(428, 'p_2.6_428', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(429, 'p_2.6_429', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(430, 'p_2.6_430', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(431, 'p_2.6_431', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(432, 'p_2.6_432', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(433, 'p_2.6_433', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(434, 'p_2.6_434', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(435, 'p_2.6_435', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(436, 'p_2.6_436', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(437, 'p_2.6_437', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(438, 'p_2.6_438', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(439, 'p_2.6_439', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(440, 'p_2.6_440', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(441, 'p_2.6_441', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
(442, 'p_2.6_442', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(443, 'p_2.6_443', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(444, 'p_2.6_444', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(445, 'p_2.6_445', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(446, 'p_2.6_446', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(447, 'p_2.6_447', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(448, 'p_2.6_448', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(449, 'p_2.6_449', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(450, 'p_2.6_450', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(451, 'p_2.6_451', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(452, 'p_2.6_452', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(453, 'p_2.6_453', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(454, 'p_2.6_454', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(455, 'p_2.6_455', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(456, 'p_2.6_456', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(457, 'p_2.6_457', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(458, 'p_2.6_458', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(459, 'p_2.6_459', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(460, 'p_2.6_460', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(461, 'p_2.6_461', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(462, 'p_2.6_462', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(463, 'p_2.6_463', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(464, 'p_2.6_464', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(465, 'p_2.6_465', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(466, 'p_2.6_466', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(467, 'p_2.6_467', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(468, 'p_2.6_468', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(469, 'p_2.6_469', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(470, 'p_2.6_470', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(471, 'p_2.6_471', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(472, 'p_2.6_472', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(473, 'p_2.6_473', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(474, 'p_2.6_474', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(475, 'p_2.6_475', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(476, 'p_2.6_476', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(477, 'p_2.6_477', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(478, 'p_2.6_478', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(479, 'p_2.6_479', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(480, 'p_2.6_480', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(481, 'p_2.6_481', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(482, 'p_2.6_482', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(483, 'p_2.6_483', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(484, 'p_2.6_484', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(485, 'p_2.6_485', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(486, 'p_2.6_486', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(487, 'p_2.6_487', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(488, 'p_2.6_488', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(489, 'p_2.6_489', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(490, 'p_2.6_490', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(491, 'p_2.6_491', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(492, 'p_2.6_492', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(493, 'p_2.6_493', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(494, 'p_2.6_494', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(495, 'p_2.6_495', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(496, 'p_2.6_496', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(497, 'p_2.6_497', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(498, 'p_2.6_498', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(499, 'p_2.6_499', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(500, 'p_2.6_500', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(501, 'p_2.6_501', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(502, 'p_2.6_502', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(503, 'p_2.6_503', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(504, 'p_2.6_504', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(505, 'p_2.6_505', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(506, 'p_2.6_506', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(507, 'p_2.6_507', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(508, 'p_2.6_508', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(509, 'p_2.6_509', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(510, 'p_2.6_510', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(511, 'p_2.6_511', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(512, 'p_2.6_512', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(513, 'p_2.6_513', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(514, 'p_2.6_514', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(515, 'p_2.6_515', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(516, 'p_2.6_516', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(517, 'p_2.6_517', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(518, 'p_2.6_518', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(519, 'p_2.6_519', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(520, 'p_2.6_520', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(521, 'p_2.6_521', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(522, 'p_2.6_522', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(523, 'p_2.6_523', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(524, 'p_2.6_524', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(525, 'p_2.6_525', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(526, 'p_2.6_526', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(527, 'p_2.6_527', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(528, 'p_2.6_528', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(529, 'p_2.6_529', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(530, 'p_2.6_530', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(531, 'p_2.6_531', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(532, 'p_2.6_532', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(533, 'p_2.6_533', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(534, 'p_2.6_534', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(535, 'p_2.6_535', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(536, 'p_2.6_536', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(537, 'p_2.6_537', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(538, 'p_2.6_538', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(539, 'p_2.6_539', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(540, 'p_2.6_540', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(541, 'p_2.6_541', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(542, 'p_2.6_542', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(543, 'p_2.6_543', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(544, 'p_2.6_544', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(545, 'p_2.6_545', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(546, 'p_2.6_546', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(547, 'p_2.6_547', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(548, 'p_2.6_548', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(549, 'p_2.6_549', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(550, 'p_2.6_550', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(551, 'p_2.6_551', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(552, 'p_2.6_552', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(553, 'p_2.6_553', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(554, 'p_2.6_554', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(555, 'p_2.6_555', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(556, 'p_2.6_556', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(557, 'p_2.6_557', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(558, 'p_2.6_558', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(559, 'p_2.6_559', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(560, 'p_2.6_560', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(561, 'p_2.6_561', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(562, 'p_2.6_562', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(563, 'p_2.6_563', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(564, 'p_2.6_564', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(565, 'p_2.6_565', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(566, 'p_2.6_566', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(567, 'p_2.6_567', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(568, 'p_2.6_568', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(569, 'p_2.6_569', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(570, 'p_2.6_570', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(571, 'p_2.6_571', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(572, 'p_2.6_572', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(573, 'p_2.6_573', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(574, 'p_2.6_574', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(575, 'p_2.6_575', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(576, 'p_2.6_576', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(577, 'p_2.6_577', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(578, 'p_2.6_578', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(579, 'p_2.6_579', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(580, 'p_2.6_580', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(581, 'p_2.6_581', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(582, 'p_2.6_582', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(583, 'p_2.6_583', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(584, 'p_2.6_584', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(585, 'p_2.6_585', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(586, 'p_2.6_586', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(587, 'p_2.6_587', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(588, 'p_2.6_588', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(589, 'p_2.6_589', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(590, 'p_2.6_590', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(591, 'p_2.6_591', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(592, 'p_2.6_592', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(593, 'p_2.6_593', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(594, 'p_2.6_594', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(595, 'p_2.6_595', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(596, 'p_2.6_596', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(597, 'p_2.6_597', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(598, 'p_2.6_598', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(599, 'p_2.6_599', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(600, 'p_2.6_600', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(601, 'p_2.6_601', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(602, 'p_2.6_602', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(603, 'p_2.6_603', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(604, 'p_2.6_604', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(605, 'p_2.6_605', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(606, 'p_2.6_606', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(607, 'p_2.6_607', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(608, 'p_2.6_608', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(609, 'p_2.6_609', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(610, 'p_2.6_610', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(611, 'p_2.6_611', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(612, 'p_2.6_612', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(613, 'p_2.6_613', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(614, 'p_2.6_614', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(615, 'p_2.6_615', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(616, 'p_2.6_616', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(617, 'p_2.6_617', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(618, 'p_2.6_618', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(619, 'p_2.6_619', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(620, 'p_2.6_620', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(621, 'p_2.6_621', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(622, 'p_2.6_622', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(623, 'p_2.6_623', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(624, 'p_2.6_624', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(625, 'p_2.6_625', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(626, 'p_2.6_626', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(627, 'p_2.6_627', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(628, 'p_2.6_628', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(629, 'p_2.6_629', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(630, 'p_2.6_630', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(631, 'p_2.6_631', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(632, 'p_2.6_632', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(633, 'p_2.6_633', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(634, 'p_2.6_634', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(635, 'p_2.6_635', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(636, 'p_2.6_636', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(637, 'p_2.6_637', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(638, 'p_2.6_638', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(639, 'p_2.6_639', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(640, 'p_2.6_640', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(641, 'p_2.6_641', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(642, 'p_2.6_642', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(643, 'p_2.6_643', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(644, 'p_2.6_644', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(645, 'p_2.6_645', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(646, 'p_2.6_646', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(647, 'p_2.6_647', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(648, 'p_2.6_648', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(649, 'p_2.6_649', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(650, 'p_2.6_650', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(651, 'p_2.6_651', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(652, 'p_2.6_652', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(653, 'p_2.6_653', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(654, 'p_2.6_654', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(655, 'p_2.6_655', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(656, 'p_2.6_656', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(657, 'p_2.6_657', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(658, 'p_2.6_658', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(659, 'p_2.6_659', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(660, 'p_2.6_660', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(661, 'p_2.6_661', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(662, 'p_2.6_662', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(663, 'p_2.6_663', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(664, 'p_2.6_664', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(665, 'p_2.6_665', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(666, 'p_2.6_666', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(667, 'p_2.6_667', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(668, 'p_2.6_668', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(669, 'p_2.6_669', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(670, 'p_2.6_670', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(671, 'p_2.6_671', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(672, 'p_2.6_672', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(673, 'p_2.6_673', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(674, 'p_2.6_674', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(675, 'p_2.6_675', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(676, 'p_2.6_676', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(677, 'p_2.6_677', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(678, 'p_2.6_678', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(679, 'p_2.6_679', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(680, 'p_2.6_680', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(681, 'p_2.6_681', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(682, 'p_2.6_682', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(683, 'p_2.6_683', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(684, 'p_2.6_684', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(685, 'p_2.6_685', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(686, 'p_2.6_686', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(687, 'p_2.6_687', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(688, 'p_2.6_688', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(689, 'p_2.6_689', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(690, 'p_2.6_690', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(691, 'p_2.6_691', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(692, 'p_2.6_692', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(693, 'p_2.6_693', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(694, 'p_2.6_694', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(695, 'p_2.6_695', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(696, 'p_2.6_696', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(697, 'p_2.6_697', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(698, 'p_2.6_698', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(699, 'p_2.6_699', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(700, 'p_2.6_700', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(701, 'p_2.6_701', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(702, 'p_2.6_702', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(703, 'p_2.6_703', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(704, 'p_2.6_704', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(705, 'p_2.6_705', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(706, 'p_2.6_706', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(707, 'p_2.6_707', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(708, 'p_2.6_708', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(709, 'p_2.6_709', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(710, 'p_2.6_710', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(711, 'p_2.6_711', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(712, 'p_2.6_712', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(713, 'p_2.6_713', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(714, 'p_2.6_714', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(715, 'p_2.6_715', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(716, 'p_2.6_716', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(717, 'p_2.6_717', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(718, 'p_2.6_718', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(719, 'p_2.6_719', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(720, 'p_2.6_720', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(721, 'p_2.6_721', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(722, 'p_2.6_722', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(723, 'p_2.6_723', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(724, 'p_2.6_724', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(725, 'p_2.6_725', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(726, 'p_2.6_726', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(727, 'p_2.6_727', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(728, 'p_2.6_728', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(729, 'p_2.6_729', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(730, 'p_2.6_730', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(731, 'p_2.6_731', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(732, 'p_2.6_732', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(733, 'p_2.6_733', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(734, 'p_2.6_734', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(735, 'p_2.6_735', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(736, 'p_2.6_736', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(737, 'p_2.6_737', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(738, 'p_2.6_738', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(739, 'p_2.6_739', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(740, 'p_2.6_740', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(741, 'p_2.6_741', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(742, 'p_2.6_742', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(743, 'p_2.6_743', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(744, 'p_2.6_744', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(745, 'p_2.6_745', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(746, 'p_2.6_746', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(747, 'p_2.6_747', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(748, 'p_2.6_748', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(749, 'p_2.6_749', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(750, 'p_2.6_750', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(751, 'p_2.6_751', 'دونیم بسوه‌ای', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `plots_300`
--

CREATE TABLE `plots_300` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'سه بسوه‌ای',
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
(1, 'p_3_1', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'sold', 1, NULL, NULL, '2026-05-19 05:09:51'),
(2, 'p_3_2', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(3, 'p_3_3', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(4, 'p_3_4', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(5, 'p_3_5', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(6, 'p_3_6', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(7, 'p_3_7', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(8, 'p_3_8', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(9, 'p_3_9', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(10, 'p_3_10', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(11, 'p_3_11', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(12, 'p_3_12', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(13, 'p_3_13', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(14, 'p_3_14', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(15, 'p_3_15', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(16, 'p_3_16', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(17, 'p_3_17', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(18, 'p_3_18', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(19, 'p_3_19', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(20, 'p_3_20', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(21, 'p_3_21', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(22, 'p_3_22', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(23, 'p_3_23', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(24, 'p_3_24', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(25, 'p_3_25', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(26, 'p_3_26', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(27, 'p_3_27', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(28, 'p_3_28', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(29, 'p_3_29', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(30, 'p_3_30', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(31, 'p_3_31', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(32, 'p_3_32', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(33, 'p_3_33', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(34, 'p_3_34', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(35, 'p_3_35', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(36, 'p_3_36', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(37, 'p_3_37', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(38, 'p_3_38', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(39, 'p_3_39', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(40, 'p_3_40', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(41, 'p_3_41', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(42, 'p_3_42', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(43, 'p_3_43', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(44, 'p_3_44', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(45, 'p_3_45', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(46, 'p_3_46', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(47, 'p_3_47', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(48, 'p_3_48', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(49, 'p_3_49', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(50, 'p_3_50', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(51, 'p_3_51', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(52, 'p_3_52', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(53, 'p_3_53', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(54, 'p_3_54', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(55, 'p_3_55', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(56, 'p_3_56', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(57, 'p_3_57', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(58, 'p_3_58', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(59, 'p_3_59', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(60, 'p_3_60', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(61, 'p_3_61', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(62, 'p_3_62', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(63, 'p_3_63', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(64, 'p_3_64', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(65, 'p_3_65', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(66, 'p_3_66', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(67, 'p_3_67', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(68, 'p_3_68', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(69, 'p_3_69', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(70, 'p_3_70', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(71, 'p_3_71', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(72, 'p_3_72', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(73, 'p_3_73', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(74, 'p_3_74', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(75, 'p_3_75', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(76, 'p_3_76', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(77, 'p_3_77', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(78, 'p_3_78', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(79, 'p_3_79', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(80, 'p_3_80', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(81, 'p_3_81', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(82, 'p_3_82', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(83, 'p_3_83', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(84, 'p_3_84', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(85, 'p_3_85', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(86, 'p_3_86', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(87, 'p_3_87', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(88, 'p_3_88', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(89, 'p_3_89', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(90, 'p_3_90', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(91, 'p_3_91', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(92, 'p_3_92', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(93, 'p_3_93', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(94, 'p_3_94', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(95, 'p_3_95', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(96, 'p_3_96', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(97, 'p_3_97', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(98, 'p_3_98', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(99, 'p_3_99', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(100, 'p_3_100', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(101, 'p_3_101', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(102, 'p_3_102', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(103, 'p_3_103', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(104, 'p_3_104', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(105, 'p_3_105', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(106, 'p_3_106', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(107, 'p_3_107', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(108, 'p_3_108', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(109, 'p_3_109', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(110, 'p_3_110', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(111, 'p_3_111', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(112, 'p_3_112', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(113, 'p_3_113', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(114, 'p_3_114', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(115, 'p_3_115', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(116, 'p_3_116', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(117, 'p_3_117', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(118, 'p_3_118', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(119, 'p_3_119', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(120, 'p_3_120', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(121, 'p_3_121', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(122, 'p_3_122', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(123, 'p_3_123', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(124, 'p_3_124', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(125, 'p_3_125', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(126, 'p_3_126', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(127, 'p_3_127', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(128, 'p_3_128', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(129, 'p_3_129', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(130, 'p_3_130', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(131, 'p_3_131', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(132, 'p_3_132', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(133, 'p_3_133', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(134, 'p_3_134', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(135, 'p_3_135', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(136, 'p_3_136', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(137, 'p_3_137', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(138, 'p_3_138', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(139, 'p_3_139', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(140, 'p_3_140', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(141, 'p_3_141', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(142, 'p_3_142', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(143, 'p_3_143', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(144, 'p_3_144', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(145, 'p_3_145', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(146, 'p_3_146', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(147, 'p_3_147', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(148, 'p_3_148', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(149, 'p_3_149', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(150, 'p_3_150', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(151, 'p_3_151', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(152, 'p_3_152', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(153, 'p_3_153', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(154, 'p_3_154', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(155, 'p_3_155', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(156, 'p_3_156', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(157, 'p_3_157', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(158, 'p_3_158', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(159, 'p_3_159', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(160, 'p_3_160', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(161, 'p_3_161', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(162, 'p_3_162', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(163, 'p_3_163', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(164, 'p_3_164', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(165, 'p_3_165', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(166, 'p_3_166', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(167, 'p_3_167', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(168, 'p_3_168', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(169, 'p_3_169', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(170, 'p_3_170', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(171, 'p_3_171', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(172, 'p_3_172', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(173, 'p_3_173', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(174, 'p_3_174', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(175, 'p_3_175', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(176, 'p_3_176', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(177, 'p_3_177', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(178, 'p_3_178', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(179, 'p_3_179', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(180, 'p_3_180', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(181, 'p_3_181', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(182, 'p_3_182', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(183, 'p_3_183', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(184, 'p_3_184', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(185, 'p_3_185', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(186, 'p_3_186', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(187, 'p_3_187', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(188, 'p_3_188', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(189, 'p_3_189', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(190, 'p_3_190', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(191, 'p_3_191', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(192, 'p_3_192', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(193, 'p_3_193', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(194, 'p_3_194', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(195, 'p_3_195', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(196, 'p_3_196', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(197, 'p_3_197', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(198, 'p_3_198', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(199, 'p_3_199', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(200, 'p_3_200', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(201, 'p_3_201', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(202, 'p_3_202', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(203, 'p_3_203', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(204, 'p_3_204', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(205, 'p_3_205', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(206, 'p_3_206', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(207, 'p_3_207', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(208, 'p_3_208', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(209, 'p_3_209', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(210, 'p_3_210', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(211, 'p_3_211', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(212, 'p_3_212', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(213, 'p_3_213', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(214, 'p_3_214', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(215, 'p_3_215', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(216, 'p_3_216', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(217, 'p_3_217', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(218, 'p_3_218', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(219, 'p_3_219', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(220, 'p_3_220', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(221, 'p_3_221', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(222, 'p_3_222', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(223, 'p_3_223', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(224, 'p_3_224', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(225, 'p_3_225', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(226, 'p_3_226', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(227, 'p_3_227', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(228, 'p_3_228', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(229, 'p_3_229', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(230, 'p_3_230', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(231, 'p_3_231', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(232, 'p_3_232', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(233, 'p_3_233', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(234, 'p_3_234', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(235, 'p_3_235', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(236, 'p_3_236', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(237, 'p_3_237', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(238, 'p_3_238', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(239, 'p_3_239', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(240, 'p_3_240', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(241, 'p_3_241', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(242, 'p_3_242', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(243, 'p_3_243', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(244, 'p_3_244', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(245, 'p_3_245', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(246, 'p_3_246', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(247, 'p_3_247', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(248, 'p_3_248', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(249, 'p_3_249', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(250, 'p_3_250', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(251, 'p_3_251', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(252, 'p_3_252', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(253, 'p_3_253', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(254, 'p_3_254', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(255, 'p_3_255', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(256, 'p_3_256', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(257, 'p_3_257', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(258, 'p_3_258', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(259, 'p_3_259', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(260, 'p_3_260', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(261, 'p_3_261', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(262, 'p_3_262', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(263, 'p_3_263', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(264, 'p_3_264', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(265, 'p_3_265', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(266, 'p_3_266', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(267, 'p_3_267', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(268, 'p_3_268', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(269, 'p_3_269', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(270, 'p_3_270', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(271, 'p_3_271', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(272, 'p_3_272', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(273, 'p_3_273', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(274, 'p_3_274', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(275, 'p_3_275', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(276, 'p_3_276', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(277, 'p_3_277', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(278, 'p_3_278', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(279, 'p_3_279', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(280, 'p_3_280', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(281, 'p_3_281', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(282, 'p_3_282', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(283, 'p_3_283', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(284, 'p_3_284', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(285, 'p_3_285', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(286, 'p_3_286', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(287, 'p_3_287', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(288, 'p_3_288', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(289, 'p_3_289', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(290, 'p_3_290', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(291, 'p_3_291', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(292, 'p_3_292', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(293, 'p_3_293', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(294, 'p_3_294', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(295, 'p_3_295', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(296, 'p_3_296', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(297, 'p_3_297', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(298, 'p_3_298', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(299, 'p_3_299', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(300, 'p_3_300', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(301, 'p_3_301', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(302, 'p_3_302', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(303, 'p_3_303', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(304, 'p_3_304', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(305, 'p_3_305', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(306, 'p_3_306', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(307, 'p_3_307', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(308, 'p_3_308', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(309, 'p_3_309', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(310, 'p_3_310', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(311, 'p_3_311', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(312, 'p_3_312', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(313, 'p_3_313', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(314, 'p_3_314', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(315, 'p_3_315', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(316, 'p_3_316', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(317, 'p_3_317', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(318, 'p_3_318', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(319, 'p_3_319', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(320, 'p_3_320', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(321, 'p_3_321', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(322, 'p_3_322', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(323, 'p_3_323', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(324, 'p_3_324', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(325, 'p_3_325', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(326, 'p_3_326', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(327, 'p_3_327', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(328, 'p_3_328', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(329, 'p_3_329', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(330, 'p_3_330', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(331, 'p_3_331', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(332, 'p_3_332', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(333, 'p_3_333', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(334, 'p_3_334', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(335, 'p_3_335', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(336, 'p_3_336', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(337, 'p_3_337', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(338, 'p_3_338', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(339, 'p_3_339', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(340, 'p_3_340', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(341, 'p_3_341', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(342, 'p_3_342', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(343, 'p_3_343', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(344, 'p_3_344', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(345, 'p_3_345', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(346, 'p_3_346', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(347, 'p_3_347', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(348, 'p_3_348', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(349, 'p_3_349', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(350, 'p_3_350', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(351, 'p_3_351', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(352, 'p_3_352', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(353, 'p_3_353', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(354, 'p_3_354', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(355, 'p_3_355', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(356, 'p_3_356', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(357, 'p_3_357', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(358, 'p_3_358', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(359, 'p_3_359', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(360, 'p_3_360', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(361, 'p_3_361', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(362, 'p_3_362', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(363, 'p_3_363', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(364, 'p_3_364', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(365, 'p_3_365', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(366, 'p_3_366', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(367, 'p_3_367', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(368, 'p_3_368', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(369, 'p_3_369', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(370, 'p_3_370', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(371, 'p_3_371', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(372, 'p_3_372', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(373, 'p_3_373', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(374, 'p_3_374', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(375, 'p_3_375', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(376, 'p_3_376', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(377, 'p_3_377', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(378, 'p_3_378', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(379, 'p_3_379', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(380, 'p_3_380', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(381, 'p_3_381', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(382, 'p_3_382', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(383, 'p_3_383', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(384, 'p_3_384', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(385, 'p_3_385', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(386, 'p_3_386', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(387, 'p_3_387', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(388, 'p_3_388', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(389, 'p_3_389', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(390, 'p_3_390', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(391, 'p_3_391', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(392, 'p_3_392', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(393, 'p_3_393', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(394, 'p_3_394', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(395, 'p_3_395', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(396, 'p_3_396', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(397, 'p_3_397', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51');
INSERT INTO `plots_300` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(398, 'p_3_398', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(399, 'p_3_399', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(400, 'p_3_400', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(401, 'p_3_401', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(402, 'p_3_402', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(403, 'p_3_403', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(404, 'p_3_404', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(405, 'p_3_405', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(406, 'p_3_406', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(407, 'p_3_407', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(408, 'p_3_408', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(409, 'p_3_409', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(410, 'p_3_410', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(411, 'p_3_411', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(412, 'p_3_412', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(413, 'p_3_413', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(414, 'p_3_414', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(415, 'p_3_415', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(416, 'p_3_416', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(417, 'p_3_417', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(418, 'p_3_418', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(419, 'p_3_419', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(420, 'p_3_420', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(421, 'p_3_421', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(422, 'p_3_422', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(423, 'p_3_423', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(424, 'p_3_424', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(425, 'p_3_425', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(426, 'p_3_426', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(427, 'p_3_427', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(428, 'p_3_428', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(429, 'p_3_429', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(430, 'p_3_430', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(431, 'p_3_431', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(432, 'p_3_432', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(433, 'p_3_433', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(434, 'p_3_434', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(435, 'p_3_435', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(436, 'p_3_436', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(437, 'p_3_437', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(438, 'p_3_438', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(439, 'p_3_439', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(440, 'p_3_440', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(441, 'p_3_441', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(442, 'p_3_442', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(443, 'p_3_443', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(444, 'p_3_444', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(445, 'p_3_445', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(446, 'p_3_446', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(447, 'p_3_447', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(448, 'p_3_448', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(449, 'p_3_449', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(450, 'p_3_450', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(451, 'p_3_451', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(452, 'p_3_452', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(453, 'p_3_453', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(454, 'p_3_454', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(455, 'p_3_455', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(456, 'p_3_456', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(457, 'p_3_457', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(458, 'p_3_458', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(459, 'p_3_459', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(460, 'p_3_460', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(461, 'p_3_461', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(462, 'p_3_462', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(463, 'p_3_463', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(464, 'p_3_464', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(465, 'p_3_465', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(466, 'p_3_466', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(467, 'p_3_467', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(468, 'p_3_468', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(469, 'p_3_469', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(470, 'p_3_470', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(471, 'p_3_471', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(472, 'p_3_472', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(473, 'p_3_473', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(474, 'p_3_474', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(475, 'p_3_475', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(476, 'p_3_476', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(477, 'p_3_477', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(478, 'p_3_478', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(479, 'p_3_479', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(480, 'p_3_480', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(481, 'p_3_481', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(482, 'p_3_482', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(483, 'p_3_483', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(484, 'p_3_484', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(485, 'p_3_485', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(486, 'p_3_486', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(487, 'p_3_487', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(488, 'p_3_488', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(489, 'p_3_489', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(490, 'p_3_490', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(491, 'p_3_491', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(492, 'p_3_492', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(493, 'p_3_493', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(494, 'p_3_494', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(495, 'p_3_495', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(496, 'p_3_496', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(497, 'p_3_497', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(498, 'p_3_498', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(499, 'p_3_499', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(500, 'p_3_500', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(501, 'p_3_501', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(502, 'p_3_502', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(503, 'p_3_503', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(504, 'p_3_504', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(505, 'p_3_505', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(506, 'p_3_506', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(507, 'p_3_507', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(508, 'p_3_508', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(509, 'p_3_509', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(510, 'p_3_510', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(511, 'p_3_511', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(512, 'p_3_512', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(513, 'p_3_513', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(514, 'p_3_514', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(515, 'p_3_515', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(516, 'p_3_516', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(517, 'p_3_517', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(518, 'p_3_518', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(519, 'p_3_519', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(520, 'p_3_520', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(521, 'p_3_521', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(522, 'p_3_522', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(523, 'p_3_523', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(524, 'p_3_524', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(525, 'p_3_525', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(526, 'p_3_526', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(527, 'p_3_527', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(528, 'p_3_528', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(529, 'p_3_529', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(530, 'p_3_530', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(531, 'p_3_531', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(532, 'p_3_532', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(533, 'p_3_533', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(534, 'p_3_534', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(535, 'p_3_535', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(536, 'p_3_536', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(537, 'p_3_537', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(538, 'p_3_538', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(539, 'p_3_539', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(540, 'p_3_540', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(541, 'p_3_541', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(542, 'p_3_542', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(543, 'p_3_543', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(544, 'p_3_544', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(545, 'p_3_545', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(546, 'p_3_546', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(547, 'p_3_547', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(548, 'p_3_548', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(549, 'p_3_549', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(550, 'p_3_550', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(551, 'p_3_551', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(552, 'p_3_552', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(553, 'p_3_553', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(554, 'p_3_554', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(555, 'p_3_555', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(556, 'p_3_556', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(557, 'p_3_557', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(558, 'p_3_558', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(559, 'p_3_559', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(560, 'p_3_560', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(561, 'p_3_561', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(562, 'p_3_562', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(563, 'p_3_563', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(564, 'p_3_564', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(565, 'p_3_565', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(566, 'p_3_566', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(567, 'p_3_567', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(568, 'p_3_568', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(569, 'p_3_569', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(570, 'p_3_570', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(571, 'p_3_571', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(572, 'p_3_572', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(573, 'p_3_573', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(574, 'p_3_574', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(575, 'p_3_575', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(576, 'p_3_576', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(577, 'p_3_577', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(578, 'p_3_578', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(579, 'p_3_579', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(580, 'p_3_580', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(581, 'p_3_581', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(582, 'p_3_582', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(583, 'p_3_583', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(584, 'p_3_584', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(585, 'p_3_585', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(586, 'p_3_586', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(587, 'p_3_587', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(588, 'p_3_588', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(589, 'p_3_589', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(590, 'p_3_590', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(591, 'p_3_591', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(592, 'p_3_592', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(593, 'p_3_593', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(594, 'p_3_594', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(595, 'p_3_595', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(596, 'p_3_596', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(597, 'p_3_597', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(598, 'p_3_598', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(599, 'p_3_599', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(600, 'p_3_600', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(601, 'p_3_601', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(602, 'p_3_602', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(603, 'p_3_603', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(604, 'p_3_604', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(605, 'p_3_605', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(606, 'p_3_606', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(607, 'p_3_607', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(608, 'p_3_608', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(609, 'p_3_609', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(610, 'p_3_610', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(611, 'p_3_611', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(612, 'p_3_612', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(613, 'p_3_613', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(614, 'p_3_614', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(615, 'p_3_615', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(616, 'p_3_616', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(617, 'p_3_617', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(618, 'p_3_618', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(619, 'p_3_619', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(620, 'p_3_620', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(621, 'p_3_621', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(622, 'p_3_622', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(623, 'p_3_623', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(624, 'p_3_624', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(625, 'p_3_625', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(626, 'p_3_626', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(627, 'p_3_627', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(628, 'p_3_628', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(629, 'p_3_629', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(630, 'p_3_630', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(631, 'p_3_631', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(632, 'p_3_632', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(633, 'p_3_633', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(634, 'p_3_634', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(635, 'p_3_635', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(636, 'p_3_636', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(637, 'p_3_637', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(638, 'p_3_638', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(639, 'p_3_639', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(640, 'p_3_640', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(641, 'p_3_641', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(642, 'p_3_642', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(643, 'p_3_643', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(644, 'p_3_644', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(645, 'p_3_645', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(646, 'p_3_646', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(647, 'p_3_647', 'سه بسوه‌ای', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `plots_400`
--

CREATE TABLE `plots_400` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'چهار بسوه‌ای',
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
(1, 'p_4_1', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'sold', 1, NULL, NULL, '2026-05-19 05:10:37'),
(2, 'p_4_2', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(3, 'p_4_3', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(4, 'p_4_4', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(5, 'p_4_5', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(6, 'p_4_6', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(7, 'p_4_7', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(8, 'p_4_8', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(9, 'p_4_9', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(10, 'p_4_10', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(11, 'p_4_11', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(12, 'p_4_12', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(13, 'p_4_13', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(14, 'p_4_14', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(15, 'p_4_15', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(16, 'p_4_16', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(17, 'p_4_17', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(18, 'p_4_18', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(19, 'p_4_19', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(20, 'p_4_20', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(21, 'p_4_21', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(22, 'p_4_22', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(23, 'p_4_23', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(24, 'p_4_24', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(25, 'p_4_25', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(26, 'p_4_26', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(27, 'p_4_27', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(28, 'p_4_28', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(29, 'p_4_29', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(30, 'p_4_30', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(31, 'p_4_31', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(32, 'p_4_32', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(33, 'p_4_33', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(34, 'p_4_34', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(35, 'p_4_35', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(36, 'p_4_36', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(37, 'p_4_37', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(38, 'p_4_38', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(39, 'p_4_39', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(40, 'p_4_40', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(41, 'p_4_41', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(42, 'p_4_42', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(43, 'p_4_43', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(44, 'p_4_44', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(45, 'p_4_45', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(46, 'p_4_46', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(47, 'p_4_47', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(48, 'p_4_48', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(49, 'p_4_49', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(50, 'p_4_50', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(51, 'p_4_51', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37'),
(52, 'p_4_52', 'چهار بسوه‌ای', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `plots_510`
--

CREATE TABLE `plots_510` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'پنج بسوه‌ای',
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
(1, 'p_5_1', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'sold', 1, NULL, NULL, '2026-05-19 05:11:17'),
(2, 'p_5_2', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(3, 'p_5_3', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(4, 'p_5_4', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(5, 'p_5_5', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(6, 'p_5_6', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(7, 'p_5_7', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(8, 'p_5_8', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(9, 'p_5_9', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(10, 'p_5_10', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(11, 'p_5_11', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(12, 'p_5_12', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(13, 'p_5_13', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(14, 'p_5_14', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(15, 'p_5_15', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(16, 'p_5_16', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(17, 'p_5_17', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(18, 'p_5_18', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(19, 'p_5_19', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(20, 'p_5_20', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(21, 'p_5_21', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(22, 'p_5_22', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(23, 'p_5_23', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(24, 'p_5_24', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(25, 'p_5_25', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(26, 'p_5_26', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(27, 'p_5_27', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(28, 'p_5_28', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(29, 'p_5_29', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(30, 'p_5_30', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(31, 'p_5_31', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(32, 'p_5_32', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(33, 'p_5_33', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(34, 'p_5_34', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(35, 'p_5_35', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(36, 'p_5_36', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(37, 'p_5_37', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(38, 'p_5_38', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(39, 'p_5_39', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(40, 'p_5_40', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(41, 'p_5_41', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(42, 'p_5_42', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(43, 'p_5_43', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(44, 'p_5_44', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(45, 'p_5_45', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(46, 'p_5_46', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(47, 'p_5_47', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(48, 'p_5_48', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(49, 'p_5_49', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(50, 'p_5_50', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(51, 'p_5_51', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17'),
(52, 'p_5_52', 'پنج بسوه‌ای', 510, 15000.00, 3500.00, 5100.00, 23600.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `plots_600`
--

CREATE TABLE `plots_600` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'شش بسوه‌ای',
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
(1, 'p_6_1', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'sold', 1, NULL, NULL, '2026-05-19 05:11:59'),
(2, 'p_6_2', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(3, 'p_6_3', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(4, 'p_6_4', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(5, 'p_6_5', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(6, 'p_6_6', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(7, 'p_6_7', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(8, 'p_6_8', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(9, 'p_6_9', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(10, 'p_6_10', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(11, 'p_6_11', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(12, 'p_6_12', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(13, 'p_6_13', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(14, 'p_6_14', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(15, 'p_6_15', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(16, 'p_6_16', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(17, 'p_6_17', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(18, 'p_6_18', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(19, 'p_6_19', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(20, 'p_6_20', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(21, 'p_6_21', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(22, 'p_6_22', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(23, 'p_6_23', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(24, 'p_6_24', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(25, 'p_6_25', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(26, 'p_6_26', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(27, 'p_6_27', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(28, 'p_6_28', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(29, 'p_6_29', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(30, 'p_6_30', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(31, 'p_6_31', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(32, 'p_6_32', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(33, 'p_6_33', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(34, 'p_6_34', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(35, 'p_6_35', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(36, 'p_6_36', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(37, 'p_6_37', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(38, 'p_6_38', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(39, 'p_6_39', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(40, 'p_6_40', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(41, 'p_6_41', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(42, 'p_6_42', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(43, 'p_6_43', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(44, 'p_6_44', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(45, 'p_6_45', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(46, 'p_6_46', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(47, 'p_6_47', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(48, 'p_6_48', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(49, 'p_6_49', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(50, 'p_6_50', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(51, 'p_6_51', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(52, 'p_6_52', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(53, 'p_6_53', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(54, 'p_6_54', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(55, 'p_6_55', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59'),
(56, 'p_6_56', 'شش بسوه‌ای', 600, 20000.00, 3640.00, 6000.00, 29640.00, 'available', NULL, NULL, NULL, '2026-05-19 05:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `plots_1000`
--

CREATE TABLE `plots_1000` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'ده بسوه‌ای',
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
(1, 'p_10_E1', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'sold', 1, NULL, NULL, '2026-05-19 05:12:23'),
(2, 'p_10_E2', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(3, 'p_10_E3', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(4, 'p_10_E4', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(5, 'p_10_E5', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(6, 'p_10_E6', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(7, 'p_10_E7', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(8, 'p_10_E8', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(9, 'p_10_E9', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(10, 'p_10_E10', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(11, 'p_10_E11', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(12, 'p_10_E12', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(13, 'p_10_E13', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(14, 'p_10_E14', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(15, 'p_10_E15', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(16, 'p_10_E16', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(17, 'p_10_E17', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(18, 'p_10_E18', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(19, 'p_10_E19', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(20, 'p_10_E20', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(21, 'p_10_E21', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(22, 'p_10_E22', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(23, 'p_10_E23', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23'),
(24, 'p_10_E24', 'ده بسوه‌ای', 1000, 30000.00, 4200.00, 10000.00, 44200.00, 'available', NULL, NULL, NULL, '2026-05-19 05:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `plots_vip`
--

CREATE TABLE `plots_vip` (
  `id` int(11) NOT NULL,
  `plot_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT 'vip',
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
(1, 'p_vip_1', 'vip', 0, 0.00, 0.00, 0.00, 0.00, 'sold', 1, NULL, NULL, '2026-05-19 05:13:18'),
(2, 'p_vip_2', 'vip', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18'),
(3, 'p_vip_3', 'vip', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18'),
(4, 'p_vip_4', 'vip', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18'),
(5, 'p_vip_5', 'vip', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18'),
(6, 'p_vip_6', 'vip', 0, 0.00, 0.00, 0.00, 0.00, 'available', NULL, NULL, NULL, '2026-05-19 05:13:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `national_id` (`national_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pay_200`
--
ALTER TABLE `pay_200`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pay_260`
--
ALTER TABLE `pay_260`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_300`
--
ALTER TABLE `pay_300`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=648;

--
-- AUTO_INCREMENT for table `plots_400`
--
ALTER TABLE `plots_400`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
-- Constraints for dumped tables
--

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
