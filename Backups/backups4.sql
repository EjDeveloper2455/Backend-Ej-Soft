-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bd_ej_soft
CREATE DATABASE IF NOT EXISTS `bd_ej_soft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bd_ej_soft`;

-- Dumping structure for view bd_ej_soft.tbl_empleado_usuario
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `tbl_empleado_usuario`;
;

-- Dumping structure for view bd_ej_soft.tbl_slider
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `tbl_slider`;
;

-- Dumping structure for view bd_ej_soft.tbl_usuario
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `tbl_usuario`;
;

-- Dumping structure for view bd_ej_soft.tbl_empleado
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `tbl_empleado` (
	`empleado_dni` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`empleado_nombre` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`empleado_apellido` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`empleado_sexo` VARCHAR(45) NULL COLLATE 'utf8mb4_general_ci',
	`cargo_id` INT(11) NULL,
	`departamento_id` INT(11) NULL,
	`empleado_url_foto` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`empleado_create_date` DATETIME NULL,
	`empleado_update_date` DATETIME NULL,
	`empleado_estado` VARCHAR(45) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view bd_ej_soft.tbl_empleado_usuario
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `tbl_empleado_usuario` (
	`usuario_email` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_general_ci',
	`empleado_dni` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view bd_ej_soft.tbl_slider
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `tbl_slider` (
	`slider_id` INT(11) NOT NULL,
	`slider_texto` VARCHAR(200) NULL COLLATE 'utf8mb4_general_ci',
	`slider_ruta_imagen` VARCHAR(200) NULL COLLATE 'utf8mb4_general_ci',
	`slider_prioridad` INT(11) NULL,
	`slider_estado` VARCHAR(45) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view bd_ej_soft.tbl_usuario
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `tbl_usuario` (
	`usuario_email` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_general_ci',
	`usuario_password` VARCHAR(200) NULL COLLATE 'utf8mb4_general_ci',
	`usuario_rol` VARCHAR(45) NULL COLLATE 'utf8mb4_general_ci',
	`usuario_create_date` DATETIME NULL,
	`usuario_update_date` DATETIME NULL,
	`usuario_estado` VARCHAR(45) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view bd_ej_soft.tbl_empleado
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `tbl_empleado`;
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
