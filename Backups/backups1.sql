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

-- Dumping structure for table bd_ej_soft.tbl_usuario
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `usuario_email` varchar(200) NOT NULL,
  `usuario_password` varchar(200) DEFAULT NULL,
  `usuario_rol` varchar(45) DEFAULT NULL,
  `usuario_create_date` datetime DEFAULT current_timestamp(),
  `usuario_update_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_estado` varchar(45) DEFAULT 'Activo',
  PRIMARY KEY (`usuario_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_usuario: ~1 rows (approximately)
REPLACE INTO `tbl_usuario` (`usuario_email`, `usuario_password`, `usuario_rol`, `usuario_create_date`, `usuario_update_date`, `usuario_estado`) VALUES
	('elmerjmejia55@gmail.com', '12345', 'Administrador', '2023-05-18 18:16:45', '2023-05-18 18:16:45', 'Activo');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
