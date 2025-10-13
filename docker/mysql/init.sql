-- init.sql for Symfony development environment

-- Additional test database
--- CREATE DATABASE IF NOT EXISTS symfony_db;

-- User for tests
CREATE USER 'symfony'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON symfony_db.* TO 'symfony'@'%';

-- Initial reference data
USE symfony_db;
