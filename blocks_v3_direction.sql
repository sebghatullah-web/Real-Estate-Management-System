-- KHAWARDB - block_units "direction" (position/location inside the building) column (version 3)
-- Adds the position of each unit inside its building: north / south / east / west / center
-- Run this once against an existing database that already ran blocks_v2.sql:

ALTER TABLE `block_units`
  ADD COLUMN `direction` varchar(20) DEFAULT NULL
  COMMENT 'Location of the unit inside the building (north/south/east/west/center)'
  AFTER `unit_size`;