-- --------------------------------------------------------
-- Blocks & Block Units (Apartments) tables
-- KHAWARDB Real Estate System – database: map — version 2
-- --------------------------------------------------------

SET NAMES utf8mb4;

--
-- Table structure for table `blocks`
-- Block: a building with several floors. The number of units per floor and the category
-- belong to the units themselves (block_units), not to the block.
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
-- Each apartment/unit inside a block.
-- Each floor can have 1 to 4 units and each unit has its own category.
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
-- Building amenities/services (lobby, elevator, parking, etc.)
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
-- Details of each unit/apartment (foyer, living room, bedroom, etc.)
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