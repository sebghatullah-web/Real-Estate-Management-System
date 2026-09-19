-- ============================================================
-- KHAWARDB - Blocks & Apartments structure upgrade (version 2)
--
-- 1) Remove category, units_per_floor and unit_size fields from the blocks table
--    (units per floor and category now belong to the units themselves)
-- 2) Add units_per_floor and category to the block_units table
-- 3) Create the block amenities table (block_amenities)
-- 4) Create the unit features table (block_unit_features)
-- ============================================================

SET NAMES utf8mb4;

-- --------------------------------------------------------
-- 1) Remove extra fields from the blocks table
-- --------------------------------------------------------
ALTER TABLE `blocks`
  DROP COLUMN `category`,
  DROP COLUMN `units_per_floor`,
  DROP COLUMN `unit_size`;

-- --------------------------------------------------------
-- 2) Add new fields to the block_units table
-- --------------------------------------------------------
ALTER TABLE `block_units`
  ADD COLUMN `units_per_floor` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Number of units on this floor (1 to 4)' AFTER `floor_number`,
  ADD COLUMN `category` varchar(50) NOT NULL DEFAULT 'standard' COMMENT 'Unit category: standard, premium, vip, vvip, etc.' AFTER `units_per_floor`;

-- Update units_per_floor for existing data (based on the number of units on each floor)
UPDATE block_units bu
JOIN (
  SELECT block_id, floor_number, COUNT(*) AS cnt
  FROM block_units
  GROUP BY block_id, floor_number
) x ON x.block_id = bu.block_id AND x.floor_number = bu.floor_number
SET bu.units_per_floor = x.cnt;

-- --------------------------------------------------------
-- 3) Block amenities table (Lobby, Elevator, Parking, etc.)
-- --------------------------------------------------------
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

-- --------------------------------------------------------
-- 4) Unit features table (foyer, living room, bedroom, etc.)
-- --------------------------------------------------------
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