-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.30 - MySQL Community Server - GPL
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
CREATE DATABASE IF NOT EXISTS `bd_ej_soft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
  `empleado_dni` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `empleado_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `empleado_apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `empleado_sexo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cargo_id` int DEFAULT NULL,
  `departamento_id` int DEFAULT NULL,
  `empleado_url_foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `empleado_create_date` datetime DEFAULT NULL,
  `empleado_update_date` datetime DEFAULT NULL,
  `empleado_estado` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_empleado: 1 rows
/*!40000 ALTER TABLE `tbl_empleado` DISABLE KEYS */;
REPLACE INTO `tbl_empleado` (`empleado_dni`, `empleado_nombre`, `empleado_apellido`, `empleado_sexo`, `cargo_id`, `departamento_id`, `empleado_url_foto`, `empleado_create_date`, `empleado_update_date`, `empleado_estado`) VALUES
	('0413199700796', 'ELMER JOHEL', 'MEJIA LEIVA', 'Masculino', 1, 1, 'default.png', '2023-05-22 20:18:41', '2023-05-22 20:18:41', 'Activo');
/*!40000 ALTER TABLE `tbl_empleado` ENABLE KEYS */;

-- Dumping structure for table bd_ej_soft.tbl_empleado_usuario
CREATE TABLE IF NOT EXISTS `tbl_empleado_usuario` (
  `usuario_email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `empleado_dni` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`usuario_email`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_email`) REFERENCES `tbl_usuario` (`usuario_email`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_empleado_usuario: ~1 rows (approximately)
REPLACE INTO `tbl_empleado_usuario` (`usuario_email`, `empleado_dni`) VALUES
	('Elmer', '0413199700796');

-- Dumping structure for table bd_ej_soft.tbl_marca
CREATE TABLE IF NOT EXISTS `tbl_marca` (
  `marca_id` int NOT NULL AUTO_INCREMENT,
  `marca_nombre` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marca_date_create` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marca_date_update` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marca_estado` varchar(45) COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_marca: ~0 rows (approximately)

-- Dumping structure for table bd_ej_soft.tbl_parte_vehiculo
CREATE TABLE IF NOT EXISTS `tbl_parte_vehiculo` (
  `parte_vehiculo_id` int NOT NULL AUTO_INCREMENT,
  `vehiculo_vin` varchar(17) COLLATE utf8mb4_general_ci NOT NULL,
  `parte_vehiculo_descripcion` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parte_vehiculo_costo` decimal(9,2) DEFAULT NULL,
  `parte_date_create` datetime DEFAULT NULL,
  `parte_date_update` datetime DEFAULT NULL,
  `tbl_parte_vehiculo_estado` varchar(45) COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  PRIMARY KEY (`parte_vehiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_parte_vehiculo: ~0 rows (approximately)

-- Dumping structure for table bd_ej_soft.tbl_seguro
CREATE TABLE IF NOT EXISTS `tbl_seguro` (
  `seguro_id` int NOT NULL AUTO_INCREMENT,
  `seguro_tipo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `seguro_empresa` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `seguro_monto_total` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`seguro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_seguro: ~0 rows (approximately)

-- Dumping structure for table bd_ej_soft.tbl_slider
CREATE TABLE IF NOT EXISTS `tbl_slider` (
  `slider_id` int NOT NULL,
  `slider_texto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slider_ruta_imagen` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slider_prioridad` int DEFAULT NULL,
  `slider_estado` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_slider: 0 rows
/*!40000 ALTER TABLE `tbl_slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_slider` ENABLE KEYS */;

-- Dumping structure for table bd_ej_soft.tbl_solicitud
CREATE TABLE IF NOT EXISTS `tbl_solicitud` (
  `solicitud_id` int NOT NULL AUTO_INCREMENT,
  `vehiculo_vin` varchar(17) COLLATE utf8mb4_general_ci NOT NULL,
  `cliente_id` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `solicitud_dni_cliente` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `solicitu_licencia_cliente` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `solicitud_tipo_seguro` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `solicitud_poliza` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `solicitud_empresa_aseguradora` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `solicutud_proceso` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `solicitud_date_create` datetime DEFAULT NULL,
  `solicitud_date_update` datetime DEFAULT NULL,
  `solicitud_estado` varchar(45) COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  PRIMARY KEY (`solicitud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_solicitud: ~0 rows (approximately)

-- Dumping structure for table bd_ej_soft.tbl_tipo_vehiculo
CREATE TABLE IF NOT EXISTS `tbl_tipo_vehiculo` (
  `tipo_vehiculo_id` int NOT NULL AUTO_INCREMENT,
  `tipo_vehiculo_descripcion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`tipo_vehiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_tipo_vehiculo: ~0 rows (approximately)

-- Dumping structure for table bd_ej_soft.tbl_usuario
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `usuario_email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_rol` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_create_date` datetime DEFAULT NULL,
  `usuario_update_date` datetime DEFAULT NULL,
  `usuario_estado` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_usuario: 2 rows
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
REPLACE INTO `tbl_usuario` (`usuario_email`, `usuario_password`, `usuario_rol`, `usuario_create_date`, `usuario_update_date`, `usuario_estado`) VALUES
	('Danny', '$2a$10$HGwCJPp65XsBFTopdhYx0OdGDXomnRU0XDkbMWvGrUPc5akqPnM3y', 'Gerente', '2023-05-20 22:05:18', '2023-05-20 22:05:18', 'Activo'),
	('Elmer', '$2a$10$wiI.D1u8rnbxlsQ5scxHkeaM867G.wT2LSIZNa/VJ18sbs2CmIFnG', 'Administrador', '2023-05-20 22:04:35', '2023-05-20 22:04:35', 'Activo');
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;

-- Dumping structure for table bd_ej_soft.tbl_vehiculo
CREATE TABLE IF NOT EXISTS `tbl_vehiculo` (
  `vehiculo_vin` varchar(17) COLLATE utf8mb4_general_ci NOT NULL,
  `vehiculo_placa` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehiculo_modelo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehiculo_costo_renta` decimal(9,2) DEFAULT NULL,
  `vehiculo_color` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehiculo_anio` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehiculo_kilometraje` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo_vehiculo_id` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `marca_id` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `vehiculo_date_create` datetime DEFAULT NULL,
  `vehiculo_date_update` datetime DEFAULT NULL,
  `vehiculo_estado` varchar(45) COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  PRIMARY KEY (`vehiculo_vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bd_ej_soft.tbl_vehiculo: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
