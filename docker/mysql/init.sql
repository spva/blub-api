-- init.sql for Symfony development environment

-- Additional test database
CREATE DATABASE IF NOT EXISTS symfony_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- User for tests
CREATE USER 'symfony'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON symfony_db.* TO 'symfony'@'%';

-- Initial reference data
USE symfony_db;

CREATE TABLE IF NOT EXISTS test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);