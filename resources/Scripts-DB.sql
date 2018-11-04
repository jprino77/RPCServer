-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_los_amigos
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cancha`
--

DROP TABLE IF EXISTS `cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) NOT NULL,
  `deporte_id` int(11) NOT NULL,
  `tipo_cancha_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `disponible` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_filial_deporte_deporte1_idx` (`deporte_id`),
  KEY `fk_filial_deporte_tipo_cancha1_idx` (`tipo_cancha_id`),
  KEY `fk_filial_deporte_filial1_idx` (`filial_id`),
  CONSTRAINT `fk_filial_deporte_deporte1` FOREIGN KEY (`deporte_id`) REFERENCES `deporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_filial_deporte_filial1` FOREIGN KEY (`filial_id`) REFERENCES `filial` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_filial_deporte_tipo_cancha1` FOREIGN KEY (`tipo_cancha_id`) REFERENCES `tipo_cancha` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancha`
--

LOCK TABLES `cancha` WRITE;
/*!40000 ALTER TABLE `cancha` DISABLE KEYS */;
INSERT INTO `cancha` VALUES (1,'00',1,1,1,''),(2,'02',1,2,1,''),(3,'03',2,1,2,''),(4,'05',1,1,3,''),(5,'06',1,2,3,''),(6,'04',2,2,2,''),(9,'07',2,1,3,''),(10,'08',2,2,3,'');
/*!40000 ALTER TABLE `cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deporte`
--

DROP TABLE IF EXISTS `deporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deporte` (
  `id` int(11) NOT NULL,
  `codigo` varchar(5) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deporte`
--

LOCK TABLES `deporte` WRITE;
/*!40000 ALTER TABLE `deporte` DISABLE KEYS */;
INSERT INTO `deporte` VALUES (1,'FU','Futbol'),(2,'TE','Tenis'),(3,'BA','Basket');
/*!40000 ALTER TABLE `deporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `altura` int(11) NOT NULL,
  `localidad_id` int(11) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_filial_localidad1_idx` (`localidad_id`),
  CONSTRAINT `fk_filial_localidad1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES (1,'Filial 1','Carlos calvo',123,1,'0303456','',''),(2,'Filial 2','San martin',1158,2,'0303456',NULL,''),(3,'Casa Central','La Prida',1,3,'0303456',NULL,'');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_filial`
--

DROP TABLE IF EXISTS `horarios_filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios_filial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_semana` int(11) NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time NOT NULL,
  `filial_id` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_horarios_filial_filial1_idx` (`filial_id`),
  CONSTRAINT `fk_horarios_filial_filial1` FOREIGN KEY (`filial_id`) REFERENCES `filial` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_filial`
--

LOCK TABLES `horarios_filial` WRITE;
/*!40000 ALTER TABLE `horarios_filial` DISABLE KEYS */;
INSERT INTO `horarios_filial` VALUES (1,0,'08:00:00','14:00:00',1,''),(2,1,'08:00:00','14:00:00',1,''),(6,2,'10:00:00','20:00:00',1,''),(7,3,'08:00:00','16:00:00',1,''),(8,4,'08:00:00','16:00:00',1,''),(9,6,'08:00:00','16:00:00',1,''),(10,2,'10:00:00','20:00:00',2,''),(11,3,'08:00:00','16:00:00',2,''),(12,1,'08:00:00','14:00:00',2,''),(13,4,'08:00:00','14:00:00',2,''),(14,5,'10:00:00','16:00:00',2,''),(16,3,'08:00:00','16:00:00',3,''),(17,1,'08:00:00','14:00:00',3,''),(18,4,'08:00:00','14:00:00',3,''),(19,5,'10:00:00','16:00:00',3,''),(20,0,'10:00:00','16:00:00',3,'');
/*!40000 ALTER TABLE `horarios_filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Lanus',1824),(2,'Banfield',1828),(3,'Lomas de Zamora',1832);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'00','afiliado'),(2,'01','admin');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cancha`
--

DROP TABLE IF EXISTS `tipo_cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cancha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cancha`
--

LOCK TABLES `tipo_cancha` WRITE;
/*!40000 ALTER TABLE `tipo_cancha` DISABLE KEYS */;
INSERT INTO `tipo_cancha` VALUES (1,'CE','cemento'),(2,'PA','pasto'),(3,'LA','ladrillo');
/*!40000 ALTER TABLE `tipo_cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora_solicitud` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_hora_desde` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_hora_hasta` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cancha_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cancelado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_turno_canchas1_idx` (`cancha_id`),
  KEY `fk_turno_afiliado1_idx` (`usuario_id`),
  CONSTRAINT `fk_turno_afiliado1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`numero_afiliado_legajo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turno_canchas1` FOREIGN KEY (`cancha_id`) REFERENCES `cancha` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (1,'2018-10-10 12:48:10','2018-10-17 11:00:00','2018-10-17 19:00:00',9,5,''),(2,'2018-10-10 12:55:05','2018-10-11 13:11:00','2018-10-11 16:11:00',2,5,'\0'),(3,'2018-10-10 12:55:05','2018-10-17 15:00:00','2018-10-17 19:00:00',1,5,''),(4,'2018-10-10 12:55:05','2018-10-10 16:11:00','2018-10-10 17:11:00',2,5,'\0'),(5,'2018-10-17 12:45:23','2018-10-17 14:00:00','2018-10-17 19:00:00',2,5,'\0');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `numero_afiliado_legajo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `altura` int(11) DEFAULT NULL,
  `localidad_id` int(11) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_nacimieto` date DEFAULT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`numero_afiliado_legajo`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_afiliado_localidad_idx` (`localidad_id`),
  KEY `fk_afiliado_rol1_idx` (`rol_id`),
  CONSTRAINT `fk_afiliado_localidad` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_afiliado_rol1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'prueba','prueba','falsa',123,1,'0303456',NULL,'1989-02-21','prueba','123',1,''),(5,'Julian','Prino','sarasa',123,1,'155122222222222','jprino@gmail.com','2017-04-06','julian','123456',1,'');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_los_amigos'
--

--
-- Dumping routines for database 'db_los_amigos'
--
/*!50003 DROP PROCEDURE IF EXISTS `CREAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREAR_USUARIO`(IN p_nombre varchar(45), IN p_apellido varchar(45), IN p_calle varchar(100), IN p_altura int, IN p_localidad_id int, IN p_telefono varchar(15), IN p_email varchar(100), IN p_fecha_nacimieto date, IN p_usuario varchar(45), IN p_clave varchar(45), IN p_perfil_codigo varchar(2))
BEGIN

INSERT INTO `db_los_amigos`.`usuario`
(`nombre`,
`apellido`,
`calle`,
`altura`,
`localidad_id`,
`telefono`,
`email`,
`fecha_nacimieto`,
`usuario`,
`clave`,
`rol_id`,
`activo`)
VALUES
(p_nombre ,
p_apellido ,
p_calle ,
p_altura ,
p_localidad_id ,
p_telefono ,
p_email ,
p_fecha_nacimieto ,
p_usuario ,
p_clave ,
(select id from rol where codigo = p_perfil_codigo),
1 );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRAER_ALQUILERES_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRAER_ALQUILERES_ADMIN`(IN p_apellido varchar(45), IN p_nombre varchar(45), IN p_telefono varchar(15), IN p_email varchar(100))
    COMMENT 'Traer todos los turnos'
BEGIN


	IF p_apellido is not NULL THEN
		set @apellido = CONCAT (' and u.apellido = ', QUOTE(p_apellido));
	ELSE
		set @apellido = ' ';
	END IF;

	IF p_nombre is not NULL THEN
		set @nombre = CONCAT (' and u.nombre = ', QUOTE(p_nombre));
	ELSE
		set @nombre = ' ';
	END IF;

	IF (p_telefono is not NULL) THEN
		set @telefono = CONCAT (' and u.telefono =', QUOTE(p_telefono));
	ELSE
		set @telefono = ' ';
	END IF;
    
	IF (p_email is not NULL) THEN
		set @email = CONCAT (' and u.email =', QUOTE(p_email));
	ELSE
		set @email = ' ';
	END IF;
    
    

set @querys = CONCAT ('select u.numero_afiliado_legajo, u.apellido, u.nombre, t.fecha_hora_desde, t.fecha_hora_hasta, tp.descripcion, de.descripcion  
from turno t
inner join usuario u on u.numero_afiliado_legajo = t.usuario_id
inner join cancha ca on ca.id = t.cancha_id
inner join tipo_cancha tp on tp.id = ca.tipo_cancha_id
inner join deporte de on de.id = ca.deporte_id
where t.cancelado = false', @apellido, @nombre, @telefono, @email, ' order by t.fecha_hora_desde desc');

    PREPARE stmt FROM @querys;
    EXECUTE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRAER_ALQUILERES_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRAER_ALQUILERES_USUARIO`(IN p_usuario_id int, IN p_filial_id int, IN p_deporte_id int,IN p_fecha_alquiler_desde date, IN p_fecha_alquiler_hasta date)
    COMMENT 'Trae las canchas alquiladas por el usuario'
BEGIN

set @usuario = concat(' where tu.usuario_id = ',QUOTE(p_usuario_id), ' and tu.cancelado = 0 ');

	IF p_filial_id is not NULL THEN
		set @filial = CONCAT (' and ca.filial_id = ', QUOTE(p_filial_id));
	ELSE
		set @filial = ' ';
	END IF;

	IF p_deporte_id is not NULL THEN
		set @deporte = CONCAT (' and de.id = ', QUOTE(p_deporte_id));
	ELSE
		set @deporte = ' ';
	END IF;

	IF (p_fecha_alquiler_desde is not NULL) THEN
		set @fecha_alquiler = CONCAT (' and CAST(tu.fecha_hora_desde AS DATE) between ', QUOTE(p_fecha_alquiler_desde), ' and ', QUOTE(p_fecha_alquiler_hasta));
	ELSE
		set @fecha_alquiler = ' ';
	END IF;


set @querys = CONCAT ('select ca.codigo as cancha_codigo, tc.descripcion as tipo_cancha_descripcion, de.descripcion as deporte_descripcion, tu.fecha_hora_desde as fecha_hora_desde, tu.fecha_hora_hasta as fecha_hora_hasta , 
case 
 when TIMESTAMPDIFF(minute,now(),tu.fecha_hora_desde) > 120 then true 
 else false end as puede_anular,tu.id as turno_id, ca.deporte_id as deporte_id, ca.id as cancha_id,ca.filial_id as filial_id from turno tu
inner join cancha ca on ca.id = tu.cancha_id
inner join deporte de on de.id = ca.deporte_id
inner join tipo_cancha tc on tc.id = ca.tipo_cancha_id', @usuario, @filial, @deporte, @fecha_alquiler, ' order by tu.fecha_hora_desde desc');

    PREPARE stmt FROM @querys;
    EXECUTE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRAER_CANCHAS_DISPONIBLES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRAER_CANCHAS_DISPONIBLES`(
	IN p_filial_id int,
	IN p_deporte int,
    IN p_fecha_desde timestamp,
    IN p_fecha_hasta timestamp
)
    COMMENT 'Trae las canchas disponibles entre determinadas fechas'
BEGIN
 select distinct ca.id as 'cancha_id', ca.codigo as 'cancha_codigo', tc.id as 'tipo_id', tc.descripcion as 'tipo_descripcion' 
 from cancha ca 
 inner join tipo_cancha tc on tc.id= ca.tipo_cancha_id
 where ca.filial_id = p_filial_id and ca.deporte_id = p_deporte
 and ca.id not in (select cancha_id from  turno tu
 where  ( p_fecha_desde between tu.fecha_hora_desde and tu.fecha_hora_hasta)
 or ( p_fecha_hasta between tu.fecha_hora_desde and tu.fecha_hora_hasta)
 or (tu.fecha_hora_desde between p_fecha_desde and p_fecha_hasta)
 or (tu.fecha_hora_hasta between p_fecha_desde and p_fecha_hasta) 
 and tu.cancelado = 0)
 order by ca.codigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-04 18:08:16
