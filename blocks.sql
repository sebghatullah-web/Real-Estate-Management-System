-- --------------------------------------------------------
-- بلاک‌ها (Blocks) و اپارتمان‌ها/واحدها (Block Units)
-- سیستم املاک KHAWARDB – دیتابیس: map
-- --------------------------------------------------------

SET NAMES utf8mb4;

--
-- Table structure for table `blocks`
-- بلاک: ساختمانی با چند منزل/طبقه که هر منزل ۱، ۲ یا ۳ واحد/اپارتمان دارد.
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_code` varchar(50) NOT NULL COMMENT 'کد بلاک',
  `block_name` varchar(100) DEFAULT NULL COMMENT 'نام بلاک',
  `size` int(11) NOT NULL COMMENT 'سایز بلاک (متر مربع) مثلاً 114، 412، 644، 902',
  `staircase_size` int(11) NOT NULL DEFAULT 45 COMMENT 'راه پله (متر مربع)',
  `floors_count` int(11) NOT NULL COMMENT 'تعداد منزل/طبقه‌ها',
  `units_per_floor` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'تعداد واحد در هر منزل (1، 2 یا 3)',
  `unit_size` decimal(10,2) NOT NULL COMMENT 'متراژ هر واحد = (سایز - راه پله) ÷ تعداد واحد در منزل',
  `category` enum('standard','premium','vip') NOT NULL DEFAULT 'standard' COMMENT 'کتگوری بلاک',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `block_code` (`block_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `block_units`
-- هر اپارتمان/واحد داخل یک بلاک.
--

CREATE TABLE IF NOT EXISTS `block_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `floor_number` int(11) NOT NULL COMMENT 'شماره منزل/طبقه',
  `unit_number` varchar(20) NOT NULL COMMENT 'شماره واحد (مثلاً 1، 2، 3)',
  `unit_code` varchar(100) NOT NULL COMMENT 'کد کامل واحد (بلاک-طبقه-واحد)',
  `rooms` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'تعداد اتاق (۱ اتاقه، ۲ اتاقه، ۳ اتاقه)',
  `unit_size` decimal(10,2) NOT NULL COMMENT 'متراژ واحد (متر مربع)',
  `status` enum('available','reserved','sold') NOT NULL DEFAULT 'available' COMMENT 'قابل فروش، رزرو شده، فروخته شده',
  `customer_id` int(11) DEFAULT NULL,
  `unit_price_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'قیمت واحد فی متر مربع (در وقت فروش ثبت می‌شود)',
  `gov_cost_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'خدمات دولت فی متر مربع (در وقت فروش ثبت می‌شود)',
  `infra_cost_per_meter` decimal(10,2) DEFAULT NULL COMMENT 'خدمات زیربنا فی متر مربع (در وقت فروش ثبت می‌شود)',
  `unit_price` decimal(12,2) DEFAULT NULL COMMENT 'قیمت کل واحد = نرخ فی متر × متراژ',
  `gov_cost` decimal(12,2) DEFAULT NULL COMMENT 'خدمات دولت (کل)',
  `infra_cost` decimal(12,2) DEFAULT NULL COMMENT 'خدمات زیربنا (کل)',
  `total_price` decimal(12,2) DEFAULT NULL COMMENT 'قیمت مجموعی واحد = قیمت + خدمات دولت + خدمات زیربنا',
  `sold_at` timestamp NULL DEFAULT NULL COMMENT 'تاریخ فروش',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `fk_block_units_block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_block_units_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `pay_block_units`
-- پرداخت‌های اپارتمان/واحدها (مثل pay_200, pay_400 برای نمرات)
--

CREATE TABLE IF NOT EXISTS `pay_block_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL COMMENT 'شناسه اپارتمان/واحد (block_units.id)',
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