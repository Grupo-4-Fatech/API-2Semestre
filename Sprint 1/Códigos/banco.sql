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
  `idtipo_mensagem` int NOT NULL,
  PRIMARY KEY (`id_cadastrar_mensagem`),
  KEY `fk_id_tipo_mensagem_cadastro_idx` (`idtipo_mensagem`),
  KEY `fk_email_cadastro_idx` (`email`),
  CONSTRAINT `fk_email_cadastro` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `fk_id_tipo_mensagem_cadastro` FOREIGN KEY (`idtipo_mensagem`) REFERENCES `tipo_mensagem` (`idtipo_mensagem`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastrar_mensagem`
--

LOCK TABLES `cadastrar_mensagem` WRITE;
/*!40000 ALTER TABLE `cadastrar_mensagem` DISABLE KEYS */;
INSERT INTO `cadastrar_mensagem` VALUES (1,'antocar@antocar.antocar','eu sou um antocar e prego a fisolofia antocaniana',1),(2,'gabriel@gabriel','gabriel gabriel gabriel biel',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1);
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
  `id_tipo_mensagem` int NOT NULL,
  `id_chat` int NOT NULL,
  `texto` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idmensagem`),
  KEY `fk_id_tipo_mensagem_idx` (`id_tipo_mensagem`),
  KEY `fk_id_chat_mensagem_idx` (`id_chat`),
  KEY `fk_email_idx` (`email`),
  CONSTRAINT `fk_email` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `fk_id_chat_mensagem` FOREIGN KEY (`id_chat`) REFERENCES `chat` (`idchat`),
  CONSTRAINT `fk_id_tipo_mensagem` FOREIGN KEY (`id_tipo_mensagem`) REFERENCES `tipo_mensagem` (`idtipo_mensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
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
-- Table structure for table `tipo_mensagem`
--

DROP TABLE IF EXISTS `tipo_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_mensagem` (
  `idtipo_mensagem` int NOT NULL AUTO_INCREMENT,
  `tipo_mensagem` varchar(255) NOT NULL,
  PRIMARY KEY (`idtipo_mensagem`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_mensagem`
--

LOCK TABLES `tipo_mensagem` WRITE;
/*!40000 ALTER TABLE `tipo_mensagem` DISABLE KEYS */;
INSERT INTO `tipo_mensagem` VALUES (1,'email'),(2,'sistema');
/*!40000 ALTER TABLE `tipo_mensagem` ENABLE KEYS */;
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
INSERT INTO `usuarios` VALUES ('adm@adm.com','adm','adms','','',3),('antocar@antocar.antocar','Antiniól','Antocar','cliente','antocar ',1),('asdasd@asdasd','asdsa','asdsa','cliente','asd',1),('bomboasl@oapks','bom','bomzinhos','suporte','dereg',2),('gabriel@gabriel','gabriel','lear','cliente','abacate',1),('usuario@usuario.com','usuario','usuarios','','',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-07  9:25:57
