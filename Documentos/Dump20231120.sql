-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: empreenda_mais
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `descricao` longtext,
  `data_criacao` date DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `media_url` longtext,
  `id_colaborador` int DEFAULT NULL,
  `foto_capa` longtext,
  PRIMARY KEY (`id`),
  KEY `id_colaborador_idx` (`id_colaborador`),
  CONSTRAINT `id_colaborador` FOREIGN KEY (`id_colaborador`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Curso MEI','<p>Curso relacionado ao MEI - SEBRAE</p>','2023-11-20','Dicas','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/videoseries?si=bONYQPuFyzpFrC2E&amp;list=PL5NqtK07eSyx4Zs8EaUz9YHeDJI_n1qDN\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>',3,'https://sebrae.com.br/Sebrae/Portal%20Sebrae/Imagens%20SebraeNA/Sebrai-pg-MEI-Headers-Formaliza%c3%a7%c3%a3o.png');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscricao_curso`
--

DROP TABLE IF EXISTS `inscricao_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscricao_curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  `data_inscricao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `inscricao_curso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `inscricao_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscricao_curso`
--

LOCK TABLES `inscricao_curso` WRITE;
/*!40000 ALTER TABLE `inscricao_curso` DISABLE KEYS */;
INSERT INTO `inscricao_curso` VALUES (1,1,1,'2023-11-20');
/*!40000 ALTER TABLE `inscricao_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_usuario`
--

DROP TABLE IF EXISTS `perfil_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `telefone1` varchar(20) DEFAULT NULL,
  `telefone2` varchar(20) DEFAULT NULL,
  `escolaridade` varchar(100) DEFAULT NULL,
  `renda` varchar(100) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `logradouro` varchar(300) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(20) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `foto_url` longtext,
  `foto_upl` longblob,
  `ocupacao` varchar(45) DEFAULT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `interesse1` varchar(50) DEFAULT NULL,
  `interesse2` varchar(50) DEFAULT NULL,
  `interesse3` varchar(50) DEFAULT NULL,
  `contato1` varchar(200) DEFAULT NULL,
  `contato2` varchar(200) DEFAULT NULL,
  `contato3` varchar(200) DEFAULT NULL,
  `contato4` varchar(200) DEFAULT NULL,
  `compartilhar_telefone1` tinyint DEFAULT NULL,
  `compartilhar_telefone2` tinyint DEFAULT NULL,
  `compartilhar_endereco` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_usuario`
--

LOCK TABLES `perfil_usuario` WRITE;
/*!40000 ALTER TABLE `perfil_usuario` DISABLE KEYS */;
INSERT INTO `perfil_usuario` VALUES (1,'(11) 1234-5678','(11) 91234-5678','Ensino Medio Completo','1 a 3 Salarios Minimos',1,'Rua dos Testes, 100','Teste','SP','12345-678','1996-02-01','https://www.portaldapropaganda.com.br/noticias/wp-content/uploads/2016/02/Boneco-de-Teste_VolvonoCarnaval.jpg',NULL,'Testador de testes','Sou um testador de testes fazendo testes','Testar','Testar Muito','Testar Sempre','www.lojadetestes.com','@TesteFeliz','@testeBriguento','@testeFbk',1,0,0),(2,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,'https://media.istockphoto.com/id/1192884194/pt/vetorial/admin-sign-on-laptop-icon-stock-vector.jpg?s=1024x1024&w=is&k=20&c=B9nPHPR578_ws-Z_0yEEh7dpf4ziSHyzYZq873jAhVs=',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `perfil_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postagem`
--

DROP TABLE IF EXISTS `postagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postagem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `corpo` longtext,
  `media_url` varchar(500) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `likes` int DEFAULT NULL,
  `data_postagem` date DEFAULT NULL,
  `perfil_id` int DEFAULT NULL,
  `denuncia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_id` (`perfil_id`),
  CONSTRAINT `postagem_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postagem`
--

LOCK TABLES `postagem` WRITE;
/*!40000 ALTER TABLE `postagem` DISABLE KEYS */;
INSERT INTO `postagem` VALUES (2,'Marmotinhas + Java','Esses negócios gordos curam o ódio que o Java dá','https://fotos.amomeupet.org/uploads/fotos/1643926761_61fc54e9484d0_hd.jpeg','Outros',NULL,'2023-11-12',1,NULL),(3,'Teste de Postagem 3','<p>Lorem ipsum dolor sit amet. In dolor dolorem aut sequi obcaecati et debitis rerum 33 obcaecati iste ab cupiditate blanditiis. Rem nostrum deserunt et error nulla sed atque corrupti. Non omnis voluptatum non distinctio eveniet hic magnam ipsam non nisi exercitationem eos obcaecati itaque a architecto expedita.</p>\r\n<p><iframe src=\"https://www.youtube.com/embed/D0UnqGm_miA\" width=\"560\" height=\"314\" allowfullscreen=\"allowfullscreen\"></iframe></p>','','Outros',NULL,'2023-11-15',1,NULL),(4,'Postagem 4 ','<p>Lorem ipsum dolor sit amet. In dolor dolorem aut sequi obcaecati et debitis rerum 33 obcaecati iste ab cupiditate blanditiis. Rem nostrum deserunt et error nulla sed atque corrupti. Non omnis voluptatum non distinctio eveniet hic magnam ipsam non nisi exercitationem eos obcaecati itaque a architecto expedita.</p>\r <p><iframe src=\"https://www.youtube.com/embed/7X8II6J-6mU\" width=\"560\" height=\"314\" allowfullscreen=\"allowfullscreen\"></iframe></p>','','Perguntas',NULL,'2023-11-15',1,NULL),(10,'Post Admin','<p>Postagem ADmin</p>','https://media.istockphoto.com/id/1192884194/pt/vetorial/admin-sign-on-laptop-icon-stock-vector.jpg?s=1024x1024&w=is&k=20&c=B9nPHPR578_ws-Z_0yEEh7dpf4ziSHyzYZq873jAhVs=','Dicas',NULL,'2023-11-19',4,NULL),(12,'kajhdkhah','<p>askjdhakshd</p>','','Vagas',NULL,'2023-11-19',2,1);
/*!40000 ALTER TABLE `postagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tipo_usuario` varchar(50) NOT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `compartilhar_email` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Usuario Testador de Testes','usuario@teste.com','USER','23456',1),(2,'Usuario Teste 2','usuario2@teste.com','USER','12345',NULL),(3,'SEBRAE','colab1@email.com','COLAB','342145',0),(4,'Nome Colaborador 2','colab2@email.com','COLAB','abcd123',NULL),(6,'UserAdmin','admin@email.com','ADMIN','12345',NULL),(7,'Jorge Augusto','jorge@email.com','USER','12345',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'empreenda_mais'
--

--
-- Dumping routines for database 'empreenda_mais'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-20 22:24:18
