-- MySQL dump 10.13  Distrib 9.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: compania
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
-- Table structure for table `carga_f`
--

DROP TABLE IF EXISTS `carga_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carga_f` (
  `eci` varchar(10) NOT NULL,
  `dep_nom` varchar(30) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `fechan_n` date DEFAULT NULL,
  `relacion` varchar(10) DEFAULT NULL,
  KEY `eci` (`eci`),
  CONSTRAINT `carga_f_ibfk_1` FOREIGN KEY (`eci`) REFERENCES `empleado` (`ci`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga_f`
--

LOCK TABLES `carga_f` WRITE;
/*!40000 ALTER TABLE `carga_f` DISABLE KEYS */;
INSERT INTO `carga_f` VALUES ('333445555','Maria','F','1986-02-02','Hija'),('333445555','Teodoro','M','1990-10-10','Hijo'),('333445555','Ana','F','1965-09-15','Conyuge'),('987654321','Alberto','M','1967-07-06','Conyuge'),('123456789','Miguel','M','1984-11-05','Hijo'),('123456789','Maria','F','1987-01-09','Hija'),('123456789','Elizabeth','F','1960-12-12','Conyuge');
/*!40000 ALTER TABLE `carga_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_nombre` varchar(30) DEFAULT NULL,
  `id_numero` int NOT NULL,
  `jefeci` varchar(10) DEFAULT NULL,
  `jefe_fi` date DEFAULT NULL,
  PRIMARY KEY (`id_numero`),
  KEY `jefeci` (`jefeci`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`jefeci`) REFERENCES `empleado` (`ci`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES ('Compras',1,'333445555','1978-06-06'),('Administrativo',4,'987654321','1982-12-05'),('Investigacion',5,'888665555','1980-12-05');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `nombre` varchar(10) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `ci` varchar(30) NOT NULL,
  `fecha_n` date DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `superci` varchar(30) DEFAULT NULL,
  `dno` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('Juan','Polo','123456789','1959-03-03','Sucre 7-12','M',3000.00,'333445555','5'),('Humberto','Pons','333445555','1960-12-25','Bolivar 5-67','M',4000.00,'888665555','5'),('Marcia','Mora','453453453','1960-03-29','Colombia 4-23','F',2500.00,'333445555','5'),('Pablo','Castro','666884444','1955-09-15','Bolivar 1-50','M',3800.00,'333445555','5'),('Jaime','Perez','888665555','1957-04-05','Sangurima 8-34','M',5500.00,NULL,'1'),('Elena','Tapia','987654321','1961-05-03','Ordonez 7-29','F',4300.00,'888665555','4'),('Manuel','Bonilla','987987987','1958-07-16','B. Malo 1-10','M',2500.00,'987654321','4'),('Irma','Vega','999887777','1950-11-13','P. Cordova 3-45','F',2500.00,'987654321','4');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacion`
--

DROP TABLE IF EXISTS `localizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacion` (
  `id_numero` int NOT NULL,
  `dep_loca` varchar(30) DEFAULT NULL,
  KEY `id_numero` (`id_numero`),
  CONSTRAINT `localizacion_ibfk_1` FOREIGN KEY (`id_numero`) REFERENCES `departamento` (`id_numero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacion`
--

LOCK TABLES `localizacion` WRITE;
/*!40000 ALTER TABLE `localizacion` DISABLE KEYS */;
INSERT INTO `localizacion` VALUES (4,'Guayaquil'),(5,'Quito'),(5,'Manta'),(5,'Cuenca'),(1,'Cuenca');
/*!40000 ALTER TABLE `localizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `pnombre` varchar(30) DEFAULT NULL,
  `pnumero` int NOT NULL,
  `plocal` varchar(30) DEFAULT NULL,
  `dnum` int DEFAULT NULL,
  PRIMARY KEY (`pnumero`),
  KEY `dnum` (`dnum`),
  CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `departamento` (`id_numero`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES ('ProductoX',1,'Quito',5),('ProductoY',2,'Manta',5),('ProductoZ',3,'Cuenca',5),('Computadora',10,'Guayaquil',4),('Reorganizar',20,'Cuenca',1),('Beneficios',30,'Guayaquil',4);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabaja_en`
--

DROP TABLE IF EXISTS `trabaja_en`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabaja_en` (
  `eci` varchar(10) NOT NULL,
  `pno` int NOT NULL,
  `horas` double(4,2) DEFAULT NULL,
  KEY `eci` (`eci`),
  KEY `pno` (`pno`),
  CONSTRAINT `trabaja_en_ibfk_1` FOREIGN KEY (`eci`) REFERENCES `empleado` (`ci`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trabaja_en_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `proyecto` (`pnumero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabaja_en`
--

LOCK TABLES `trabaja_en` WRITE;
/*!40000 ALTER TABLE `trabaja_en` DISABLE KEYS */;
INSERT INTO `trabaja_en` VALUES ('123456789',1,12.50),('123456789',2,15.60),('666884444',3,14.70),('453453453',1,10.00),('453453453',2,10.00),('333445555',2,20.00),('333445555',3,10.00),('333445555',10,10.00),('333445555',20,10.00),('999887777',30,30.00),('999887777',10,5.00),('987987987',10,15.00),('987987987',30,17.00),('987654321',30,10.00),('987654321',20,12.00),('888665555',20,NULL);
/*!40000 ALTER TABLE `trabaja_en` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29 23:27:53
