CREATE DATABASE  IF NOT EXISTS `bd_api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_api`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_api
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cadastrar_mensagem`
--

DROP TABLE IF EXISTS `cadastrar_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastrar_mensagem` (
  `id_cadastrar_mensagem` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `texto` varchar(255) NOT NULL,
  `tipo_mensagem` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cadastrar_mensagem`),
  KEY `fk_email_cadastro_idx` (`email`),
  CONSTRAINT `fk_email_cadastro` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastrar_mensagem`
--

LOCK TABLES `cadastrar_mensagem` WRITE;
/*!40000 ALTER TABLE `cadastrar_mensagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadastrar_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `idchat` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idchat`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_usuario`
--

DROP TABLE IF EXISTS `chat_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_usuario` (
  `idchat` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`idchat`,`email`),
  KEY `fk_idchat_idx` (`idchat`),
  KEY `fk_email_chat_usu_idx` (`email`),
  CONSTRAINT `fk_email_chat_usu` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `fk_idchat_chat_usu` FOREIGN KEY (`idchat`) REFERENCES `chat` (`idchat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_usuario`
--

LOCK TABLES `chat_usuario` WRITE;
/*!40000 ALTER TABLE `chat_usuario` DISABLE KEYS */;
INSERT INTO `chat_usuario` VALUES (1,'dionisio@leao'),(1,'gabriel@coutinho'),(2,'gabriel@coutinho'),(11,'andre@ribeiro'),(11,'gabriel@coutinho'),(12,'antonio@marcelo'),(12,'gabriel@coutinho'),(13,'andre@ribeiro'),(13,'antonio@marcelo');
/*!40000 ALTER TABLE `chat_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `idgrupo` int NOT NULL AUTO_INCREMENT,
  `idchat` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`idgrupo`),
  KEY `fk_idchat_idx` (`idchat`),
  CONSTRAINT `fk_idchat` FOREIGN KEY (`idchat`) REFERENCES `chat` (`idchat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_usuario`
--

DROP TABLE IF EXISTS `grupo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_usuario` (
  `idgrupo` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`idgrupo`,`email`),
  KEY `fk_idgrupo_idx` (`idgrupo`),
  KEY `fk_email_gru_idx` (`email`),
  CONSTRAINT `fk_email_gru` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `fk_idgrupo` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_usuario`
--

LOCK TABLES `grupo_usuario` WRITE;
/*!40000 ALTER TABLE `grupo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensagem` (
  `idmensagem` int NOT NULL AUTO_INCREMENT,
  `id_chat` int NOT NULL,
  `texto` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_mensagem` varchar(255) NOT NULL,
  PRIMARY KEY (`idmensagem`),
  KEY `fk_id_chat_mensagem_idx` (`id_chat`),
  KEY `fk_email_idx` (`email`),
  CONSTRAINT `fk_email` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `fk_id_chat_mensagem` FOREIGN KEY (`id_chat`) REFERENCES `chat` (`idchat`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
INSERT INTO `mensagem` VALUES (1,1,'asdas','gabriel@coutinho','2022-05-08 22:52:10','Sistema'),(2,1,'asdas','gabriel@coutinho','2022-05-08 22:52:13','Sistema'),(3,1,'ASD','antonio@marcelo','2022-05-08 22:54:07','Sistema'),(4,1,'asda','gabriel@coutinho','2022-05-08 22:54:11','Sistema');
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `idPerfil` int NOT NULL AUTO_INCREMENT,
  `Tipo_Perfil` varchar(255) NOT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Cliente'),(2,'Suporte'),(3,'Adiministrador');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `nome_empresa` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `projetos` varchar(255) NOT NULL,
  `idperfil` int NOT NULL,
  `senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_idperfil_idx` (`idperfil`),
  CONSTRAINT `fk_idperfil` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('andre@ribeiro','andre','oracle','desenvolvedor','alterar',3,'and'),('antonio@marcelo','marcelo','lear','desenvolvedor','crud',3,'mar'),('bruna@dias','bruna','embraer','master','aviao beta',3,'bru'),('dionisio@leao','dionisio','kabum','po','cliente',3,'dio'),('everton@rocha','everton','pro4tech','desenvolvedor','crud',1,'evt'),('gabriel@coutinho','gabriel','lear','desenvolvedor','chat',3,'couto');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd_api'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09  1:08:27
