<?php
/* ============================================================
   Migration: add "manazil" (buildings inside a block) support
   Creates:
     - manazil  table (block_id FK, name, code, floors_count, notes)
     - block_units.manzel_id column (nullable, FK -> manazil.id)
   Idempotent: safe to run multiple times.
   ============================================================ */
include __DIR__ . '/admin/config/db.php';

function col_exists($conn, $table, $col) {
    $r = $conn->query("SELECT COUNT(*) AS c FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '$table' AND COLUMN_NAME = '$col'");
    $row = $r->fetch_assoc();
    return intval($row['c']) > 0;
}

function table_exists($conn, $table) {
    $r = $conn->query("SELECT COUNT(*) AS c FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '$table'");
    $row = $r->fetch_assoc();
    return intval($row['c']) > 0;
}

// ---------- 1. manazil table ----------
if (!table_exists($conn, 'manazil')) {
    $sql = "CREATE TABLE manazil (
        id INT(11) NOT NULL AUTO_INCREMENT,
        block_id INT NOT NULL,
        name VARCHAR(100) NOT NULL COMMENT 'Building / manzel name, e.g. منزل 1',
        code VARCHAR(50) DEFAULT NULL COMMENT 'Optional short code',
        floors_count INT NOT NULL DEFAULT 1 COMMENT 'Number of floors',
        notes TEXT DEFAULT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT current_timestamp(),
        PRIMARY KEY (id),
        UNIQUE KEY manzel_block_name (block_id, name),
        CONSTRAINT fk_manazil_block FOREIGN KEY (block_id) REFERENCES blocks(id) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci";
    if ($conn->query($sql)) {
        echo "Created table manazil\n";
    } else {
        echo "ERROR creating manazil: " . $conn->error . "\n";
    }
} else {
    echo "manazil table already exists\n";
}

// ---------- 2. block_units.manzel_id ----------
if (!col_exists($conn, 'block_units', 'manzel_id')) {
    $sql = "ALTER TABLE block_units
        ADD COLUMN manzel_id INT(11) DEFAULT NULL AFTER block_id,
        ADD KEY manzel_id (manzel_id),
        ADD CONSTRAINT fk_block_units_manzel FOREIGN KEY (manzel_id) REFERENCES manazil(id) ON DELETE SET NULL ON UPDATE CASCADE";
    if ($conn->query($sql)) {
        echo "Added block_units.manzel_id\n";
    } else {
        echo "ERROR adding manzel_id: " . $conn->error . "\n";
    }
} else {
    echo "block_units.manzel_id already exists\n";
}

echo "Migration done.\n";
$conn->close();