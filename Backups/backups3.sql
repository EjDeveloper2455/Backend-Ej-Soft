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

-- Dumping structure for procedure bd_ej_soft.sp_login
DELIMITER //
CREATE PROCEDURE `sp_login`(in email varchar(45))
BEGIN
	Select u.usuario_email as email,usuario_rol as rol ,u.usuario_password as `password`,
    e.empleado_dni as DNI, concat(e.empleado_nombre,' ',e.empleado_apellido) as nombre,
    e.empleado_url_foto as foto
    from tbl_usuario u
    inner join tbl_empleado_usuario eu on eu.usuario_email = u.usuario_email
    inner join tbl_empleado e on e.empleado_dni = eu.empleado_dni
    where u.usuario_email = email 
    and u.usuario_estado = 'Activo' and e.empleado_estado = 'Activo';
END//
DELIMITER ;

-- Dumping structure for table bd_ej_soft.tbl_empleado
CREATE TABLE IF NOT EXISTS `tbl_empleado` (
  `empleado_dni` varchar(45) NOT NULL,
  `empleado_nombre` varchar(100) DEFAULT NULL,
  `empleado_apellido` varchar(100) DEFAULT NULL,
  `empleado_sexo` varchar(45) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `empleado_url_foto` varchar(100) DEFAULT 'default.png',
  `empleado_create_date` datetime DEFAULT current_timestamp(),
  `empleado_update_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `empleado_estado` varchar(45) DEFAULT 'Activo',
  PRIMARY KEY (`empleado_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_empleado: ~0 rows (approximately)
REPLACE INTO `tbl_empleado` (`empleado_dni`, `empleado_nombre`, `empleado_apellido`, `empleado_sexo`, `cargo_id`, `departamento_id`, `empleado_url_foto`, `empleado_create_date`, `empleado_update_date`, `empleado_estado`) VALUES
	('0413199700796', 'ELMER JOHEL', 'MEJIA LEIVA', 'Masculino', 1, 1, 'default.png', '2023-05-22 20:18:41', '2023-05-22 20:18:41', 'Activo');

-- Dumping structure for table bd_ej_soft.tbl_empleado_usuario
CREATE TABLE IF NOT EXISTS `tbl_empleado_usuario` (
  `usuario_email` varchar(200) NOT NULL,
  `empleado_dni` varchar(45) NOT NULL,
  PRIMARY KEY (`usuario_email`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_email`) REFERENCES `tbl_usuario` (`usuario_email`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_empleado_usuario: ~0 rows (approximately)
REPLACE INTO `tbl_empleado_usuario` (`usuario_email`, `empleado_dni`) VALUES
	('Elmer', '0413199700796');

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

-- Dumping data for table bd_ej_soft.tbl_usuario: ~2 rows (approximately)
REPLACE INTO `tbl_usuario` (`usuario_email`, `usuario_password`, `usuario_rol`, `usuario_create_date`, `usuario_update_date`, `usuario_estado`) VALUES
	('Danny', '$2a$10$HGwCJPp65XsBFTopdhYx0OdGDXomnRU0XDkbMWvGrUPc5akqPnM3y', 'Gerente', '2023-05-20 22:05:18', '2023-05-20 22:05:18', 'Activo'),
	('Elmer', '$2a$10$wiI.D1u8rnbxlsQ5scxHkeaM867G.wT2LSIZNa/VJ18sbs2CmIFnG', 'Administrador', '2023-05-20 22:04:35', '2023-05-20 22:04:35', 'Activo');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
