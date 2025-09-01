-- MySQL dump 10.13  Distrib 9.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: libreria
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenes` (
  `cod_al` varchar(4) NOT NULL,
  `nom_al` varchar(30) DEFAULT NULL,
  `dir_al` varchar(30) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`cod_al`),
  UNIQUE KEY `nom_al` (`nom_al`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenes`
--

LOCK TABLES `almacenes` WRITE;
/*!40000 ALTER TABLE `almacenes` DISABLE KEYS */;
INSERT INTO `almacenes` VALUES ('AL01','Monsalve','Sucre 12-10',2888888),('AL02','Juan Marcet','M. Lamar 12-12',2804513),('AL03','Papelesa','Av. De las Américas 21-12',2821355);
/*!40000 ALTER TABLE `almacenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `cod_au` varchar(4) NOT NULL,
  `nom_au` varchar(30) DEFAULT NULL,
  `ape_au` varchar(30) DEFAULT NULL,
  `cod_nac` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`cod_au`),
  KEY `cod_nac` (`cod_nac`),
  CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`cod_nac`) REFERENCES `nacionalidad` (`cod_nac`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES ('A001','Fernando','de Rojas','N003'),('A002','Virginia','Woolf','N002'),('A003','Franz','Kafka','N001');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor_libro`
--

DROP TABLE IF EXISTS `autor_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor_libro` (
  `cod_au` varchar(4) DEFAULT NULL,
  `cod_lib` varchar(4) DEFAULT NULL,
  KEY `cod_au` (`cod_au`),
  KEY `cod_lib` (`cod_lib`),
  CONSTRAINT `autor_libro_ibfk_1` FOREIGN KEY (`cod_au`) REFERENCES `autor` (`cod_au`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `autor_libro_ibfk_2` FOREIGN KEY (`cod_lib`) REFERENCES `libro` (`cod_lib`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_libro`
--

LOCK TABLES `autor_libro` WRITE;
/*!40000 ALTER TABLE `autor_libro` DISABLE KEYS */;
INSERT INTO `autor_libro` VALUES ('A001','L001'),('A002','L002'),('A003','L003');
/*!40000 ALTER TABLE `autor_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabecera_nota_venta`
--

DROP TABLE IF EXISTS `cabecera_nota_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabecera_nota_venta` (
  `num` int NOT NULL AUTO_INCREMENT,
  `fecha_not` date DEFAULT NULL,
  `cod_al` varchar(4) DEFAULT NULL,
  `cod_emp` varchar(4) DEFAULT NULL,
  `ci_cliente` varchar(10) DEFAULT NULL,
  `total` float(4,2) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `cod_al` (`cod_al`),
  KEY `cod_emp` (`cod_emp`),
  KEY `ci_cliente` (`ci_cliente`),
  CONSTRAINT `cabecera_nota_venta_ibfk_1` FOREIGN KEY (`cod_al`) REFERENCES `almacenes` (`cod_al`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cabecera_nota_venta_ibfk_2` FOREIGN KEY (`cod_emp`) REFERENCES `empleados` (`cod_emp`) ON UPDATE CASCADE,
  CONSTRAINT `cabecera_nota_venta_ibfk_3` FOREIGN KEY (`ci_cliente`) REFERENCES `clientes` (`ci_cli`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabecera_nota_venta`
--

LOCK TABLES `cabecera_nota_venta` WRITE;
/*!40000 ALTER TABLE `cabecera_nota_venta` DISABLE KEYS */;
INSERT INTO `cabecera_nota_venta` VALUES (1,'2004-06-20','AL01','E002','121212121',52.50),(2,'2005-03-14','AL02','E002','123456789',11.00),(3,'2005-05-10','AL01','E001','121212121',40.60);
/*!40000 ALTER TABLE `cabecera_nota_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `cod_car` varchar(4) NOT NULL,
  `desc_car` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_car`),
  UNIQUE KEY `desc_car` (`desc_car`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES ('C002','administrador'),('C003','gerente'),('C001','vendedor');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ci_cli` varchar(10) NOT NULL,
  `nom_cli` varchar(30) DEFAULT NULL,
  `ape_cli` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ci_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('111222333','Juan','Piedra'),('121212121','Martha','Vasquez'),('123456789','Paula','Gomez');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_nota_venta`
--

DROP TABLE IF EXISTS `detalle_nota_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_nota_venta` (
  `num` int DEFAULT NULL,
  `cod_lib` varchar(4) DEFAULT NULL,
  `nro_uni` int DEFAULT NULL,
  `sub_t` double(4,2) DEFAULT NULL,
  KEY `cod_lib` (`cod_lib`),
  KEY `num` (`num`),
  CONSTRAINT `detalle_nota_venta_ibfk_1` FOREIGN KEY (`cod_lib`) REFERENCES `libro` (`cod_lib`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detalle_nota_venta_ibfk_2` FOREIGN KEY (`num`) REFERENCES `cabecera_nota_venta` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_nota_venta`
--

LOCK TABLES `detalle_nota_venta` WRITE;
/*!40000 ALTER TABLE `detalle_nota_venta` DISABLE KEYS */;
INSERT INTO `detalle_nota_venta` VALUES (1,'L002',5,5.00),(2,'L001',1,11.00),(3,'L003',2,40.60),(1,'L002',5,5.00),(2,'L001',1,11.00),(3,'L003',2,40.60);
/*!40000 ALTER TABLE `detalle_nota_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `cod_ed` varchar(4) NOT NULL,
  `nom_ed` varchar(30) DEFAULT NULL,
  `dir_ed` varchar(30) DEFAULT NULL,
  `URL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_ed`),
  UNIQUE KEY `nom_ed` (`nom_ed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES ('ED01','Oceano','Sucre 12-21','www.oceano.com'),('ED02','Salvat','Tarqui 14-74','www.salvat.com'),('ED03','Norma','Bolivar 11-10','www.norma.com');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial_libro`
--

DROP TABLE IF EXISTS `editorial_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial_libro` (
  `cod_ed` varchar(4) DEFAULT NULL,
  `cod_lib` varchar(4) DEFAULT NULL,
  KEY `cod_ed` (`cod_ed`),
  KEY `cod_lib` (`cod_lib`),
  CONSTRAINT `editorial_libro_ibfk_1` FOREIGN KEY (`cod_ed`) REFERENCES `editorial` (`cod_ed`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `editorial_libro_ibfk_2` FOREIGN KEY (`cod_lib`) REFERENCES `libro` (`cod_lib`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial_libro`
--

LOCK TABLES `editorial_libro` WRITE;
/*!40000 ALTER TABLE `editorial_libro` DISABLE KEYS */;
INSERT INTO `editorial_libro` VALUES ('ED02','L001'),('ED01','L001'),('ED03','L003');
/*!40000 ALTER TABLE `editorial_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `ci` varchar(30) NOT NULL,
  `fecha_n` date DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `cod_emp` varchar(4) NOT NULL,
  `nom_emp` varchar(30) DEFAULT NULL,
  `ape_emp` varchar(30) DEFAULT NULL,
  `cod_car` varchar(4) DEFAULT NULL,
  `cod_al` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`cod_emp`),
  KEY `cod_car` (`cod_car`),
  KEY `cod_al` (`cod_al`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`cod_car`) REFERENCES `cargo` (`cod_car`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`cod_al`) REFERENCES `almacenes` (`cod_al`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('E001','Miguel','Cardoso','C001','AL01'),('E002','Pablo','Guaman','C001','AL02'),('E003','Ivan','Tacuri','C001','AL01'),('E004','Daniel','Palacios','C003','AL03'),('E005','Pablo','Fernandez','C003','AL01'),('E006','Catalina','Guerrero','C003','AL02'),('E007','Diego','Moscoso','C002','AL02'),('E008','Ximena','Aguirre','C002','AL03');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `cod_id` varchar(4) NOT NULL,
  `desc_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_id`),
  UNIQUE KEY `desc_id` (`desc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES ('I001','espanol'),('I003','frances'),('I002','ingles');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `cod_lib` varchar(4) NOT NULL,
  `edicion` int DEFAULT NULL,
  `fecha_lib` date DEFAULT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `precio` double(4,2) DEFAULT NULL,
  PRIMARY KEY (`cod_lib`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES ('L001',5,'2000-05-20','La Celestina',11.00),('L002',4,'1999-03-24','Al Faro',10.50),('L003',1,'2004-11-18','La Metamorfosis',20.30);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_almacen`
--

DROP TABLE IF EXISTS `libro_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_almacen` (
  `cod_lib` varchar(4) DEFAULT NULL,
  `cod_al` varchar(4) DEFAULT NULL,
  `nro_ejem` int DEFAULT NULL,
  KEY `cod_lib` (`cod_lib`),
  KEY `cod_al` (`cod_al`),
  CONSTRAINT `libro_almacen_ibfk_1` FOREIGN KEY (`cod_lib`) REFERENCES `libro` (`cod_lib`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libro_almacen_ibfk_2` FOREIGN KEY (`cod_al`) REFERENCES `almacenes` (`cod_al`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_almacen`
--

LOCK TABLES `libro_almacen` WRITE;
/*!40000 ALTER TABLE `libro_almacen` DISABLE KEYS */;
INSERT INTO `libro_almacen` VALUES ('L001','AL01',50),('L002','AL02',24),('L003','AL01',36),('L001','AL02',10);
/*!40000 ALTER TABLE `libro_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_idioma`
--

DROP TABLE IF EXISTS `libro_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_idioma` (
  `cod_lib` varchar(4) DEFAULT NULL,
  `cod_id` varchar(4) DEFAULT NULL,
  KEY `cod_lib` (`cod_lib`),
  KEY `cod_id` (`cod_id`),
  CONSTRAINT `libro_idioma_ibfk_1` FOREIGN KEY (`cod_lib`) REFERENCES `libro` (`cod_lib`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libro_idioma_ibfk_2` FOREIGN KEY (`cod_id`) REFERENCES `idioma` (`cod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_idioma`
--

LOCK TABLES `libro_idioma` WRITE;
/*!40000 ALTER TABLE `libro_idioma` DISABLE KEYS */;
INSERT INTO `libro_idioma` VALUES ('L001','I002'),('L002','I003'),('L003','I002');
/*!40000 ALTER TABLE `libro_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_idioma_traductor`
--

DROP TABLE IF EXISTS `libro_idioma_traductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_idioma_traductor` (
  `cod_lib` varchar(4) DEFAULT NULL,
  `cod_id` varchar(4) DEFAULT NULL,
  `cod_tra` varchar(4) DEFAULT NULL,
  KEY `cod_lib` (`cod_lib`),
  KEY `cod_id` (`cod_id`),
  KEY `cod_tra` (`cod_tra`),
  CONSTRAINT `libro_idioma_traductor_ibfk_1` FOREIGN KEY (`cod_lib`) REFERENCES `libro` (`cod_lib`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libro_idioma_traductor_ibfk_2` FOREIGN KEY (`cod_id`) REFERENCES `idioma` (`cod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libro_idioma_traductor_ibfk_3` FOREIGN KEY (`cod_tra`) REFERENCES `traductor` (`cod_tra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_idioma_traductor`
--

LOCK TABLES `libro_idioma_traductor` WRITE;
/*!40000 ALTER TABLE `libro_idioma_traductor` DISABLE KEYS */;
INSERT INTO `libro_idioma_traductor` VALUES ('L001','I002','T002'),('L002','I002','T001'),('L003','I002','T003');
/*!40000 ALTER TABLE `libro_idioma_traductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacionalidad` (
  `cod_nac` varchar(4) NOT NULL,
  `desc_nac` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_nac`),
  UNIQUE KEY `desc_nac` (`desc_nac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES ('N001','chilena'),('N002','ecuatoriana'),('N003','peruana');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traductor`
--

DROP TABLE IF EXISTS `traductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traductor` (
  `cod_tra` varchar(4) NOT NULL,
  `nom_tra` varchar(30) DEFAULT NULL,
  `ape_tra` varchar(30) DEFAULT NULL,
  `cod_nac` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`cod_tra`),
  KEY `cod_nac` (`cod_nac`),
  CONSTRAINT `traductor_ibfk_1` FOREIGN KEY (`cod_nac`) REFERENCES `nacionalidad` (`cod_nac`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traductor`
--

LOCK TABLES `traductor` WRITE;
/*!40000 ALTER TABLE `traductor` DISABLE KEYS */;
INSERT INTO `traductor` VALUES ('T001','Hugo','Ponce','N001'),('T002','Paco','Lopez','N001'),('T003','Luis','Serrano','N003');
/*!40000 ALTER TABLE `traductor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29 23:29:42
