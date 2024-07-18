-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemahospitalar
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_cons` int NOT NULL AUTO_INCREMENT,
  `id_pac` int DEFAULT NULL,
  `id_med` int DEFAULT NULL,
  `id_trat` int DEFAULT NULL,
  `data_cons` date DEFAULT NULL,
  `diag_cons` text,
  PRIMARY KEY (`id_cons`),
  KEY `id_pac` (`id_pac`),
  KEY `fk_med` (`id_med`),
  KEY `fk_trat_idx` (`id_trat`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_pac`) REFERENCES `paciente` (`id_pac`),
  CONSTRAINT `fk_med` FOREIGN KEY (`id_med`) REFERENCES `medico` (`id_med`),
  CONSTRAINT `fk_trat` FOREIGN KEY (`id_trat`) REFERENCES `tratamento` (`id_trat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,1,1,1,'2014-07-15','Hipertensao'),(2,2,2,2,'2024-07-16','Eletrocardiograma');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_med` int NOT NULL AUTO_INCREMENT,
  `nome_med` varchar(255) NOT NULL,
  `crm_med` char(8) NOT NULL,
  `esp_med` varchar(255) DEFAULT 'Geral',
  PRIMARY KEY (`id_med`),
  UNIQUE KEY `crm_med` (`crm_med`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Jonathan Silva','556677CE','Clínico Geral'),(2,'Bruna Paula','585177CE','Cardiologista');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_pac` int NOT NULL AUTO_INCREMENT,
  `nome_pac` varchar(250) NOT NULL,
  `cpf_pac` varchar(15) NOT NULL,
  `ende_pac` text,
  `nasc_pac` date DEFAULT NULL,
  `tel_pac` char(11) DEFAULT NULL,
  PRIMARY KEY (`id_pac`),
  UNIQUE KEY `cpf_pac_UNIQUE` (`cpf_pac`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Ana Silva','650.987.498-39','Rua A, 675','1980-05-15','85958762'),(2,'Carlos Sousa','342.861.498-02','Rua B, 832','1975-08-20','85567685');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamento`
--

DROP TABLE IF EXISTS `tratamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamento` (
  `id_trat` int NOT NULL AUTO_INCREMENT,
  `nome_trat` varchar(255) NOT NULL,
  `desc_trat` text,
  PRIMARY KEY (`id_trat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamento`
--

LOCK TABLES `tratamento` WRITE;
/*!40000 ALTER TABLE `tratamento` DISABLE KEYS */;
INSERT INTO `tratamento` VALUES (1,'Tratamento A','Descrição tratamento A'),(2,'Tratamento B','Descrição tratamento B');
/*!40000 ALTER TABLE `tratamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-18 18:42:39
