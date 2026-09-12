-- ============================================================
-- KHAWARDB — به‌روزرسانی ساختار بلاک‌ها و اپارتمان‌ها (نسخه ۲)
--
-- یک) حذف فیلدهای category و units_per_floor و unit_size از جدول blocks
--     (تعداد واحد در منزل و کتگوری حالا متعلق به خود واحدها است)
-- دو) افزودن units_per_floor و category به جدول block_units
-- سه) ساخت جدول «امکانات بلاک» (block_amenities)
-- چهار) ساخت جدول «جزئیات واحد» (block_unit_features)
-- ============================================================

SET NAMES utf8mb4;

-- --------------------------------------------------------
-- ۱) حذف فیلدهای اضافی از جدول blocks
-- --------------------------------------------------------
ALTER TABLE `blocks`
  DROP COLUMN `category`,
  DROP COLUMN `units_per_floor`,
  DROP COLUMN `unit_size`;

-- --------------------------------------------------------
-- ۲) افزودن فیلدهای جدید به جدول block_units
-- --------------------------------------------------------
ALTER TABLE `block_units`
  ADD COLUMN `units_per_floor` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'تعداد واحد در این منزل (۱ تا ۴ عدد)' AFTER `floor_number`,
  ADD COLUMN `category` varchar(50) NOT NULL DEFAULT 'standard' COMMENT 'کتگوری واحد: standard، premium، vip، vvip و ...' AFTER `units_per_floor`;

-- به‌روزرسانی units_per_floor برای داده‌های قبلی (بر اساس تعداد واحدها در هر منزل)
UPDATE block_units bu
JOIN (
  SELECT block_id, floor_number, COUNT(*) AS cnt
  FROM block_units
  GROUP BY block_id, floor_number
) x ON x.block_id = bu.block_id AND x.floor_number = bu.floor_number
SET bu.units_per_floor = x.cnt;

-- --------------------------------------------------------
-- ۳) جدول امکانات بلاک (Lobby، آسانسور، پارکینگ و ...)
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `block_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `amenity_key` varchar(50) NOT NULL COMMENT 'شناسه امکانات (لطفاً با حروف انگلیسی)',
  `amenity_label` varchar(100) NOT NULL COMMENT 'نام امکانات به فارسی',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `block_amenity_unique` (`block_id`, `amenity_key`),
  CONSTRAINT `fk_block_amenities_block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- ۴) جدول جزئیات هر واحد/اپارتمان (دهلیز، سالون، اتاق خواب و ...)
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `block_unit_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `feature_key` varchar(50) NOT NULL COMMENT 'شناسه جزئیات (لطفاً با حروف انگلیسی)',
  `feature_label` varchar(100) NOT NULL COMMENT 'نام جزئیات به فارسی',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_feature_unique` (`unit_id`, `feature_key`),
  CONSTRAINT `fk_unit_features_unit` FOREIGN KEY (`unit_id`) REFERENCES `block_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;