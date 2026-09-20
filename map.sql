-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2026 at 08:40 AM
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
            'Ten Biswa (1000 sqm)',
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
            'Two Biswa (200 sqm)',
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
            'Two and a Half Biswa (260 sqm)',
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
            'Three Biswa (300 sqm)',
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
            'Four Biswa (400 sqm)',
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
            'Five Biswa (510 sqm)',
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
            'Six Biswa (600 sqm)',
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
(1, 'Ghulam Ahmad', 'Ghulam Farooq', 'Kabul', 'Self-employed', '0791349150', 'ahmad@gmail.com', '4567899', 'img/profilePic/1779349428_download.jpg', '2026-05-19 05:23:58'),
(3, 'Baryali', 'Haji Shah', 'Dehsabz, District 19', 'Designer', '0791349150', 'baryali03@gmail.com', '127689', 'img/profilePic/1779350221_images.jpg', '2026-05-21 07:57:01'),
(4, 'Mohammad Alam', 'Ahmad Khan', 'District 5, Kabul - Afghanistan', 'Self-employed', '0784848653', 'mohammad@gmail.com', '0435678', NULL, '2026-06-16 05:38:40'),
(5, 'Haji Zalmai', 'Haji Ghulam', 'Macroryan 3', 'Self-employed', '0791349150', 'zalmai03@gmail.com', '12345', NULL, '2026-08-16 04:22:11');

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
(146, 'p_2_146', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(147, 'p_2_147', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(148, 'p_2_148', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(149, 'p_2_149', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(150, 'p_2_150', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(151, 'p_2_151', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(152, 'p_2_152', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(153, 'p_2_153', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(154, 'p_2_154', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(155, 'p_2_155', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(156, 'p_2_156', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(157, 'p_2_157', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(158, 'p_2_158', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(159, 'p_2_159', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(160, 'p_2_160', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(161, 'p_2_161', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(162, 'p_2_162', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(163, 'p_2_163', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(164, 'p_2_164', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(165, 'p_2_165', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(166, 'p_2_166', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(167, 'p_2_167', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(168, 'p_2_168', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(169, 'p_2_169', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(170, 'p_2_170', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(171, 'p_2_171', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(172, 'p_2_172', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(173, 'p_2_173', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(174, 'p_2_174', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(175, 'p_2_175', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(176, 'p_2_176', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(177, 'p_2_177', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(178, 'p_2_178', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(179, 'p_2_179', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(180, 'p_2_180', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(181, 'p_2_181', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(182, 'p_2_182', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(183, 'p_2_183', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(184, 'p_2_184', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09'),
(185, 'p_2_185', 'Two Biswa (200 sqm)', 200, 3000.00, 1960.00, 2000.00, 6960.00, 'available', NULL, NULL, NULL, '2026-05-19 05:07:09');

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
(340, 'p_2.6_340', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37'),
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
(384, 'p_2.6_384', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:37');
INSERT INTO `plots_260` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
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
(497, 'p_2.6_497', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(498, 'p_2.6_498', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(499, 'p_2.6_499', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(500, 'p_2.6_500', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(501, 'p_2.6_501', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(502, 'p_2.6_502', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(503, 'p_2.6_503', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(504, 'p_2.6_504', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(505, 'p_2.6_505', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(506, 'p_2.6_506', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(507, 'p_2.6_507', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(508, 'p_2.6_508', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(509, 'p_2.6_509', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(510, 'p_2.6_510', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(511, 'p_2.6_511', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(512, 'p_2.6_512', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(513, 'p_2.6_513', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(514, 'p_2.6_514', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(515, 'p_2.6_515', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(516, 'p_2.6_516', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(517, 'p_2.6_517', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(518, 'p_2.6_518', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(519, 'p_2.6_519', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(520, 'p_2.6_520', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(521, 'p_2.6_521', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(522, 'p_2.6_522', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(523, 'p_2.6_523', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(524, 'p_2.6_524', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(525, 'p_2.6_525', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(526, 'p_2.6_526', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(527, 'p_2.6_527', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(528, 'p_2.6_528', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(529, 'p_2.6_529', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(530, 'p_2.6_530', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(531, 'p_2.6_531', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(532, 'p_2.6_532', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(533, 'p_2.6_533', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(534, 'p_2.6_534', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(535, 'p_2.6_535', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(536, 'p_2.6_536', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(537, 'p_2.6_537', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(538, 'p_2.6_538', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(539, 'p_2.6_539', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(540, 'p_2.6_540', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(541, 'p_2.6_541', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(542, 'p_2.6_542', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(543, 'p_2.6_543', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(544, 'p_2.6_544', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(545, 'p_2.6_545', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(546, 'p_2.6_546', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(547, 'p_2.6_547', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(548, 'p_2.6_548', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(549, 'p_2.6_549', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(550, 'p_2.6_550', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(551, 'p_2.6_551', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(552, 'p_2.6_552', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(553, 'p_2.6_553', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(554, 'p_2.6_554', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(555, 'p_2.6_555', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(556, 'p_2.6_556', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(557, 'p_2.6_557', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(558, 'p_2.6_558', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(559, 'p_2.6_559', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(560, 'p_2.6_560', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(561, 'p_2.6_561', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(562, 'p_2.6_562', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(563, 'p_2.6_563', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(564, 'p_2.6_564', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(565, 'p_2.6_565', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(566, 'p_2.6_566', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(567, 'p_2.6_567', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(568, 'p_2.6_568', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(569, 'p_2.6_569', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(570, 'p_2.6_570', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(571, 'p_2.6_571', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(572, 'p_2.6_572', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(573, 'p_2.6_573', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(574, 'p_2.6_574', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(575, 'p_2.6_575', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(576, 'p_2.6_576', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(577, 'p_2.6_577', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(578, 'p_2.6_578', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(579, 'p_2.6_579', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(580, 'p_2.6_580', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(581, 'p_2.6_581', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(582, 'p_2.6_582', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(583, 'p_2.6_583', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(584, 'p_2.6_584', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(585, 'p_2.6_585', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(586, 'p_2.6_586', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(587, 'p_2.6_587', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(588, 'p_2.6_588', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(589, 'p_2.6_589', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(590, 'p_2.6_590', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(591, 'p_2.6_591', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(592, 'p_2.6_592', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(593, 'p_2.6_593', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(594, 'p_2.6_594', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(595, 'p_2.6_595', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(596, 'p_2.6_596', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(597, 'p_2.6_597', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(598, 'p_2.6_598', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(599, 'p_2.6_599', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(600, 'p_2.6_600', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(601, 'p_2.6_601', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(602, 'p_2.6_602', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(603, 'p_2.6_603', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(604, 'p_2.6_604', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(605, 'p_2.6_605', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(606, 'p_2.6_606', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(607, 'p_2.6_607', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(608, 'p_2.6_608', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(609, 'p_2.6_609', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(610, 'p_2.6_610', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(611, 'p_2.6_611', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(612, 'p_2.6_612', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(613, 'p_2.6_613', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(614, 'p_2.6_614', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(615, 'p_2.6_615', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(616, 'p_2.6_616', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(617, 'p_2.6_617', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(618, 'p_2.6_618', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(619, 'p_2.6_619', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(620, 'p_2.6_620', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(621, 'p_2.6_621', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(622, 'p_2.6_622', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(623, 'p_2.6_623', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(624, 'p_2.6_624', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(625, 'p_2.6_625', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(626, 'p_2.6_626', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(627, 'p_2.6_627', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(628, 'p_2.6_628', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(629, 'p_2.6_629', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(630, 'p_2.6_630', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(631, 'p_2.6_631', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(632, 'p_2.6_632', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(633, 'p_2.6_633', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(634, 'p_2.6_634', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(635, 'p_2.6_635', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(636, 'p_2.6_636', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(637, 'p_2.6_637', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(638, 'p_2.6_638', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(639, 'p_2.6_639', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(640, 'p_2.6_640', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(641, 'p_2.6_641', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(642, 'p_2.6_642', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(643, 'p_2.6_643', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(644, 'p_2.6_644', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(645, 'p_2.6_645', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(646, 'p_2.6_646', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(647, 'p_2.6_647', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(648, 'p_2.6_648', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(649, 'p_2.6_649', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(650, 'p_2.6_650', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(651, 'p_2.6_651', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(652, 'p_2.6_652', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(653, 'p_2.6_653', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(654, 'p_2.6_654', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(655, 'p_2.6_655', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(656, 'p_2.6_656', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(657, 'p_2.6_657', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(658, 'p_2.6_658', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(659, 'p_2.6_659', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(660, 'p_2.6_660', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(661, 'p_2.6_661', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(662, 'p_2.6_662', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(663, 'p_2.6_663', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(664, 'p_2.6_664', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(665, 'p_2.6_665', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(666, 'p_2.6_666', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(667, 'p_2.6_667', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(668, 'p_2.6_668', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(669, 'p_2.6_669', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(670, 'p_2.6_670', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(671, 'p_2.6_671', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(672, 'p_2.6_672', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(673, 'p_2.6_673', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(674, 'p_2.6_674', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(675, 'p_2.6_675', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(676, 'p_2.6_676', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(677, 'p_2.6_677', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(678, 'p_2.6_678', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(679, 'p_2.6_679', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(680, 'p_2.6_680', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(681, 'p_2.6_681', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(682, 'p_2.6_682', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(683, 'p_2.6_683', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(684, 'p_2.6_684', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(685, 'p_2.6_685', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(686, 'p_2.6_686', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(687, 'p_2.6_687', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(688, 'p_2.6_688', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(689, 'p_2.6_689', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(690, 'p_2.6_690', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(691, 'p_2.6_691', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(692, 'p_2.6_692', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(693, 'p_2.6_693', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(694, 'p_2.6_694', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(695, 'p_2.6_695', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(696, 'p_2.6_696', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(697, 'p_2.6_697', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(698, 'p_2.6_698', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(699, 'p_2.6_699', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(700, 'p_2.6_700', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(701, 'p_2.6_701', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(702, 'p_2.6_702', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(703, 'p_2.6_703', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(704, 'p_2.6_704', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(705, 'p_2.6_705', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(706, 'p_2.6_706', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(707, 'p_2.6_707', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(708, 'p_2.6_708', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(709, 'p_2.6_709', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(710, 'p_2.6_710', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(711, 'p_2.6_711', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(712, 'p_2.6_712', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(713, 'p_2.6_713', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(714, 'p_2.6_714', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(715, 'p_2.6_715', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(716, 'p_2.6_716', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(717, 'p_2.6_717', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(718, 'p_2.6_718', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(719, 'p_2.6_719', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(720, 'p_2.6_720', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(721, 'p_2.6_721', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(722, 'p_2.6_722', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(723, 'p_2.6_723', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(724, 'p_2.6_724', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(725, 'p_2.6_725', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(726, 'p_2.6_726', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(727, 'p_2.6_727', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(728, 'p_2.6_728', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(729, 'p_2.6_729', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(730, 'p_2.6_730', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(731, 'p_2.6_731', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(732, 'p_2.6_732', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(733, 'p_2.6_733', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(734, 'p_2.6_734', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(735, 'p_2.6_735', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(736, 'p_2.6_736', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(737, 'p_2.6_737', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(738, 'p_2.6_738', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(739, 'p_2.6_739', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(740, 'p_2.6_740', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(741, 'p_2.6_741', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(742, 'p_2.6_742', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(743, 'p_2.6_743', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(744, 'p_2.6_744', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(745, 'p_2.6_745', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(746, 'p_2.6_746', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(747, 'p_2.6_747', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(748, 'p_2.6_748', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(749, 'p_2.6_749', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(750, 'p_2.6_750', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38'),
(751, 'p_2.6_751', 'Two and a Half Biswa (260 sqm)', 260, 4000.00, 2100.00, 2600.00, 8700.00, 'available', NULL, NULL, NULL, '2026-05-19 05:08:38');

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
(288, 'p_3_288', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(289, 'p_3_289', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(290, 'p_3_290', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(291, 'p_3_291', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(292, 'p_3_292', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(293, 'p_3_293', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(294, 'p_3_294', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(295, 'p_3_295', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(296, 'p_3_296', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(297, 'p_3_297', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(298, 'p_3_298', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(299, 'p_3_299', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(300, 'p_3_300', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(301, 'p_3_301', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(302, 'p_3_302', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(303, 'p_3_303', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(304, 'p_3_304', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(305, 'p_3_305', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(306, 'p_3_306', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(307, 'p_3_307', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(308, 'p_3_308', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(309, 'p_3_309', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(310, 'p_3_310', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(311, 'p_3_311', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(312, 'p_3_312', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(313, 'p_3_313', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(314, 'p_3_314', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(315, 'p_3_315', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(316, 'p_3_316', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(317, 'p_3_317', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(318, 'p_3_318', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(319, 'p_3_319', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(320, 'p_3_320', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(321, 'p_3_321', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(322, 'p_3_322', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(323, 'p_3_323', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(324, 'p_3_324', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(325, 'p_3_325', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(326, 'p_3_326', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(327, 'p_3_327', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(328, 'p_3_328', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(329, 'p_3_329', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(330, 'p_3_330', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(331, 'p_3_331', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(332, 'p_3_332', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(333, 'p_3_333', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(334, 'p_3_334', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(335, 'p_3_335', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(336, 'p_3_336', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(337, 'p_3_337', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(338, 'p_3_338', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(339, 'p_3_339', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(340, 'p_3_340', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(341, 'p_3_341', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(342, 'p_3_342', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(343, 'p_3_343', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(344, 'p_3_344', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(345, 'p_3_345', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(346, 'p_3_346', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(347, 'p_3_347', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(348, 'p_3_348', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(349, 'p_3_349', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(350, 'p_3_350', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(351, 'p_3_351', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(352, 'p_3_352', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(353, 'p_3_353', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(354, 'p_3_354', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(355, 'p_3_355', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(356, 'p_3_356', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(357, 'p_3_357', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(358, 'p_3_358', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(359, 'p_3_359', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(360, 'p_3_360', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(361, 'p_3_361', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(362, 'p_3_362', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(363, 'p_3_363', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(364, 'p_3_364', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(365, 'p_3_365', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(366, 'p_3_366', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(367, 'p_3_367', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(368, 'p_3_368', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(369, 'p_3_369', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(370, 'p_3_370', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(371, 'p_3_371', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(372, 'p_3_372', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(373, 'p_3_373', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(374, 'p_3_374', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(375, 'p_3_375', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(376, 'p_3_376', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(377, 'p_3_377', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(378, 'p_3_378', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(379, 'p_3_379', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(380, 'p_3_380', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(381, 'p_3_381', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(382, 'p_3_382', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(383, 'p_3_383', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(384, 'p_3_384', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(385, 'p_3_385', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(386, 'p_3_386', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(387, 'p_3_387', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(388, 'p_3_388', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(389, 'p_3_389', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(390, 'p_3_390', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(391, 'p_3_391', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(392, 'p_3_392', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(393, 'p_3_393', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(394, 'p_3_394', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(395, 'p_3_395', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(396, 'p_3_396', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(397, 'p_3_397', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51');
INSERT INTO `plots_300` (`id`, `plot_code`, `type`, `area`, `base_price`, `infra_cost`, `gov_cost`, `total_price`, `status`, `customer_id`, `latitude`, `longitude`, `created_at`) VALUES
(398, 'p_3_398', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(399, 'p_3_399', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(400, 'p_3_400', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(401, 'p_3_401', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(402, 'p_3_402', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(403, 'p_3_403', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(404, 'p_3_404', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(405, 'p_3_405', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(406, 'p_3_406', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(407, 'p_3_407', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(408, 'p_3_408', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(409, 'p_3_409', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(410, 'p_3_410', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(411, 'p_3_411', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(412, 'p_3_412', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(413, 'p_3_413', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(414, 'p_3_414', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(415, 'p_3_415', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(416, 'p_3_416', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(417, 'p_3_417', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(418, 'p_3_418', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(419, 'p_3_419', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(420, 'p_3_420', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(421, 'p_3_421', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(422, 'p_3_422', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(423, 'p_3_423', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(424, 'p_3_424', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(425, 'p_3_425', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(426, 'p_3_426', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(427, 'p_3_427', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(428, 'p_3_428', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(429, 'p_3_429', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(430, 'p_3_430', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(431, 'p_3_431', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(432, 'p_3_432', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(433, 'p_3_433', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(434, 'p_3_434', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(435, 'p_3_435', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(436, 'p_3_436', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(437, 'p_3_437', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(438, 'p_3_438', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(439, 'p_3_439', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(440, 'p_3_440', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(441, 'p_3_441', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(442, 'p_3_442', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(443, 'p_3_443', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(444, 'p_3_444', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(445, 'p_3_445', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(446, 'p_3_446', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(447, 'p_3_447', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(448, 'p_3_448', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(449, 'p_3_449', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(450, 'p_3_450', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(451, 'p_3_451', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(452, 'p_3_452', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(453, 'p_3_453', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(454, 'p_3_454', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(455, 'p_3_455', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(456, 'p_3_456', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(457, 'p_3_457', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(458, 'p_3_458', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(459, 'p_3_459', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(460, 'p_3_460', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(461, 'p_3_461', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(462, 'p_3_462', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(463, 'p_3_463', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(464, 'p_3_464', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(465, 'p_3_465', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(466, 'p_3_466', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(467, 'p_3_467', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(468, 'p_3_468', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(469, 'p_3_469', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(470, 'p_3_470', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(471, 'p_3_471', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(472, 'p_3_472', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(473, 'p_3_473', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(474, 'p_3_474', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(475, 'p_3_475', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(476, 'p_3_476', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(477, 'p_3_477', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(478, 'p_3_478', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(479, 'p_3_479', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(480, 'p_3_480', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(481, 'p_3_481', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(482, 'p_3_482', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(483, 'p_3_483', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(484, 'p_3_484', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(485, 'p_3_485', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(486, 'p_3_486', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(487, 'p_3_487', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(488, 'p_3_488', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(489, 'p_3_489', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(490, 'p_3_490', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(491, 'p_3_491', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(492, 'p_3_492', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(493, 'p_3_493', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(494, 'p_3_494', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(495, 'p_3_495', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(496, 'p_3_496', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(497, 'p_3_497', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(498, 'p_3_498', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(499, 'p_3_499', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(500, 'p_3_500', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(501, 'p_3_501', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(502, 'p_3_502', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(503, 'p_3_503', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(504, 'p_3_504', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(505, 'p_3_505', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(506, 'p_3_506', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(507, 'p_3_507', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(508, 'p_3_508', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(509, 'p_3_509', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(510, 'p_3_510', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(511, 'p_3_511', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(512, 'p_3_512', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(513, 'p_3_513', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(514, 'p_3_514', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(515, 'p_3_515', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(516, 'p_3_516', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(517, 'p_3_517', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(518, 'p_3_518', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(519, 'p_3_519', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(520, 'p_3_520', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(521, 'p_3_521', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(522, 'p_3_522', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(523, 'p_3_523', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(524, 'p_3_524', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(525, 'p_3_525', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(526, 'p_3_526', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(527, 'p_3_527', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(528, 'p_3_528', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(529, 'p_3_529', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(530, 'p_3_530', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(531, 'p_3_531', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(532, 'p_3_532', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(533, 'p_3_533', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(534, 'p_3_534', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(535, 'p_3_535', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(536, 'p_3_536', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(537, 'p_3_537', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(538, 'p_3_538', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(539, 'p_3_539', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(540, 'p_3_540', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(541, 'p_3_541', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(542, 'p_3_542', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(543, 'p_3_543', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(544, 'p_3_544', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(545, 'p_3_545', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(546, 'p_3_546', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(547, 'p_3_547', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(548, 'p_3_548', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(549, 'p_3_549', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(550, 'p_3_550', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(551, 'p_3_551', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(552, 'p_3_552', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(553, 'p_3_553', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(554, 'p_3_554', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(555, 'p_3_555', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(556, 'p_3_556', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(557, 'p_3_557', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(558, 'p_3_558', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(559, 'p_3_559', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(560, 'p_3_560', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(561, 'p_3_561', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(562, 'p_3_562', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(563, 'p_3_563', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(564, 'p_3_564', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(565, 'p_3_565', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(566, 'p_3_566', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(567, 'p_3_567', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(568, 'p_3_568', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(569, 'p_3_569', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(570, 'p_3_570', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(571, 'p_3_571', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(572, 'p_3_572', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(573, 'p_3_573', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(574, 'p_3_574', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(575, 'p_3_575', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(576, 'p_3_576', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:51'),
(577, 'p_3_577', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(578, 'p_3_578', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(579, 'p_3_579', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(580, 'p_3_580', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(581, 'p_3_581', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(582, 'p_3_582', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(583, 'p_3_583', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(584, 'p_3_584', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(585, 'p_3_585', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(586, 'p_3_586', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(587, 'p_3_587', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(588, 'p_3_588', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(589, 'p_3_589', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(590, 'p_3_590', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(591, 'p_3_591', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(592, 'p_3_592', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(593, 'p_3_593', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(594, 'p_3_594', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(595, 'p_3_595', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(596, 'p_3_596', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(597, 'p_3_597', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(598, 'p_3_598', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(599, 'p_3_599', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(600, 'p_3_600', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(601, 'p_3_601', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(602, 'p_3_602', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(603, 'p_3_603', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(604, 'p_3_604', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(605, 'p_3_605', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(606, 'p_3_606', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(607, 'p_3_607', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(608, 'p_3_608', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(609, 'p_3_609', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(610, 'p_3_610', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(611, 'p_3_611', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(612, 'p_3_612', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(613, 'p_3_613', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(614, 'p_3_614', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(615, 'p_3_615', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(616, 'p_3_616', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(617, 'p_3_617', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(618, 'p_3_618', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(619, 'p_3_619', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(620, 'p_3_620', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(621, 'p_3_621', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(622, 'p_3_622', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(623, 'p_3_623', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(624, 'p_3_624', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(625, 'p_3_625', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(626, 'p_3_626', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(627, 'p_3_627', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(628, 'p_3_628', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(629, 'p_3_629', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(630, 'p_3_630', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(631, 'p_3_631', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(632, 'p_3_632', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(633, 'p_3_633', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(634, 'p_3_634', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(635, 'p_3_635', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(636, 'p_3_636', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(637, 'p_3_637', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(638, 'p_3_638', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(639, 'p_3_639', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(640, 'p_3_640', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(641, 'p_3_641', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(642, 'p_3_642', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(643, 'p_3_643', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(644, 'p_3_644', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(645, 'p_3_645', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(646, 'p_3_646', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52'),
(647, 'p_3_647', 'Three Biswa (300 sqm)', 300, 5000.00, 2240.00, 3000.00, 10240.00, 'available', NULL, NULL, NULL, '2026-05-19 05:09:52');

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
(52, 'p_4_52', 'Four Biswa (400 sqm)', 400, 10000.00, 2800.00, 4000.00, 16800.00, 'available', NULL, NULL, NULL, '2026-05-19 05:10:37');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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


-- --------------------------------------------------------
-- Blocks & Apartments tables
-- KHAWARDB Real Estate System – database: map — version 2
-- --------------------------------------------------------

SET NAMES utf8mb4;

--
-- Table structure for table `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_code` varchar(50) NOT NULL COMMENT 'Block code',
  `block_name` varchar(100) DEFAULT NULL COMMENT 'Block name',
  `size` int(11) NOT NULL COMMENT 'Block size (sqm) e.g. 114, 412, 644, 902',
  `staircase_size` int(11) NOT NULL DEFAULT 45 COMMENT 'Staircase (sqm)',
  `floors_count` int(11) NOT NULL COMMENT 'Number of floors',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `block_code` (`block_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `block_units`
--

CREATE TABLE IF NOT EXISTS `block_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `floor_number` int(11) NOT NULL COMMENT 'Floor number',
  `units_per_floor` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Number of units on this floor (1 to 4 units)',
  `category` varchar(50) NOT NULL DEFAULT 'standard' COMMENT 'Unit category: standard, premium, vip, vvip, etc.',
  `unit_number` varchar(20) NOT NULL COMMENT 'Unit number (e.g. 1, 2, 3, 4)',
  `unit_code` varchar(100) NOT NULL COMMENT 'Full unit code (block-floor-unit)',
  `rooms` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Number of rooms (1-Bedroom, 2-Bedroom, 3-Bedroom)',
  `unit_size` decimal(10,2) NOT NULL COMMENT 'Unit area (sqm)',
  `status` enum('available','reserved','sold') NOT NULL DEFAULT 'available' COMMENT 'For sale, reserved, sold',
  `customer_id` int(11) DEFAULT NULL,
  `unit_price_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'Unit price per sqm (set at the time of sale)',
  `gov_cost_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'Government services per sqm (set at the time of sale)',
  `infra_cost_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'Infrastructure services per sqm (set at the time of sale)',
  `unit_price` decimal(12,2) DEFAULT NULL COMMENT 'Total unit price = price per sqm x area',
  `gov_cost` decimal(12,2) DEFAULT NULL COMMENT 'Government services (total)',
  `infra_cost` decimal(12,2) DEFAULT NULL COMMENT 'Infrastructure services (total)',
  `total_price` decimal(12,2) DEFAULT NULL COMMENT 'Total unit price = unit price + government services + infrastructure',
  `sold_at` timestamp NULL DEFAULT NULL COMMENT 'Sale date',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `fk_block_units_block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_block_units_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `block_amenities`
--

CREATE TABLE IF NOT EXISTS `block_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `amenity_key` varchar(50) NOT NULL COMMENT 'Amenity identifier (English letters)',
  `amenity_label` varchar(100) NOT NULL COMMENT 'Amenity name (English)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `block_amenity_unique` (`block_id`, `amenity_key`),
  CONSTRAINT `fk_block_amenities_block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `block_unit_features`
--

CREATE TABLE IF NOT EXISTS `block_unit_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `feature_key` varchar(50) NOT NULL COMMENT 'Feature identifier (English letters)',
  `feature_label` varchar(100) NOT NULL COMMENT 'Feature name (English)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_feature_unique` (`unit_id`, `feature_key`),
  CONSTRAINT `fk_unit_features_unit` FOREIGN KEY (`unit_id`) REFERENCES `block_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `pay_block_units`
-- Payments for apartments/units (like pay_200, pay_400 for plots)
--

CREATE TABLE IF NOT EXISTS `pay_block_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL COMMENT 'Apartment/unit identifier (block_units.id)',
  `customer_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `fk_pay_block_unit_unit` FOREIGN KEY (`unit_id`) REFERENCES `block_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pay_block_unit_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;