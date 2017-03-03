CREATE DATABASE  IF NOT EXISTS `Colas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Colas`;
-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: Colas
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB-1~jessie

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
-- Table structure for table `Paso`
--

DROP TABLE IF EXISTS `Paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paso` (
  `idPaso` int(11) NOT NULL,
  `idTipoPaso` int(11) NOT NULL,
  `nombrePaso` varchar(100) NOT NULL,
  PRIMARY KEY (`idPaso`,`idTipoPaso`),
  KEY `fk_Paso_1_idx` (`idTipoPaso`),
  CONSTRAINT `fk_Paso_1` FOREIGN KEY (`idTipoPaso`) REFERENCES `TipoPaso` (`idTipoPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paso`
--

LOCK TABLES `Paso` WRITE;
/*!40000 ALTER TABLE `Paso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PasoRequisito`
--

DROP TABLE IF EXISTS `PasoRequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PasoRequisito` (
  `idPaso` int(11) NOT NULL,
  `idTipoPaso` int(11) NOT NULL,
  `idRequisito` int(11) NOT NULL,
  `idTipoRequisito` int(11) NOT NULL,
  PRIMARY KEY (`idTipoPaso`,`idPaso`,`idRequisito`,`idTipoRequisito`),
  KEY `fk_PasoRequisito_1_idx` (`idPaso`),
  KEY `fk_PasoRequisito_3_idx` (`idRequisito`),
  KEY `fk_PasoRequisito_4_idx` (`idTipoRequisito`),
  CONSTRAINT `fk_PasoRequisito_1` FOREIGN KEY (`idPaso`) REFERENCES `Paso` (`idPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PasoRequisito_2` FOREIGN KEY (`idTipoPaso`) REFERENCES `Paso` (`idTipoPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PasoRequisito_3` FOREIGN KEY (`idRequisito`) REFERENCES `Requisito` (`idRequisito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PasoRequisito_4` FOREIGN KEY (`idTipoRequisito`) REFERENCES `Requisito` (`idTipoRequisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PasoRequisito`
--

LOCK TABLES `PasoRequisito` WRITE;
/*!40000 ALTER TABLE `PasoRequisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `PasoRequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proceso`
--

DROP TABLE IF EXISTS `Proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proceso` (
  `idProceso` int(11) NOT NULL,
  `nombreProceso` varchar(45) NOT NULL,
  `descripcionProceso` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProceso`),
  UNIQUE KEY `nombreProceso_UNIQUE` (`nombreProceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proceso`
--

LOCK TABLES `Proceso` WRITE;
/*!40000 ALTER TABLE `Proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requisito`
--

DROP TABLE IF EXISTS `Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requisito` (
  `idRequisito` int(11) NOT NULL,
  `idTipoRequisito` int(11) NOT NULL,
  `nombreRequisito` varchar(45) NOT NULL,
  PRIMARY KEY (`idRequisito`,`idTipoRequisito`),
  UNIQUE KEY `nombreRequisito_UNIQUE` (`nombreRequisito`),
  KEY `fk_Requisito_1_idx` (`idTipoRequisito`),
  CONSTRAINT `fk_Requisito_1` FOREIGN KEY (`idTipoRequisito`) REFERENCES `TipoRequisito` (`idTipoRequisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requisito`
--

LOCK TABLES `Requisito` WRITE;
/*!40000 ALTER TABLE `Requisito` DISABLE KEYS */;
INSERT INTO `Requisito` VALUES (2,1,'Carnet'),(1,2,'Copia de DUI'),(3,3,'Copia de NIT');
/*!40000 ALTER TABLE `Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoPaso`
--

DROP TABLE IF EXISTS `TipoPaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoPaso` (
  `idTipoPaso` int(11) NOT NULL,
  `nombreTipoPaso` varchar(45) NOT NULL COMMENT 'Se especifican los tiposde pasos  para que una solicitud de trámite sea efectiva.',
  PRIMARY KEY (`idTipoPaso`),
  UNIQUE KEY `nombreTipoPaso_UNIQUE` (`nombreTipoPaso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoPaso`
--

LOCK TABLES `TipoPaso` WRITE;
/*!40000 ALTER TABLE `TipoPaso` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoPaso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoRequisito`
--

DROP TABLE IF EXISTS `TipoRequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoRequisito` (
  `idTipoRequisito` int(11) NOT NULL,
  `nombreTipoRequisito` varchar(45) NOT NULL COMMENT 'Se especifícan los tipos de requicitos para la realización de una solicitud',
  PRIMARY KEY (`idTipoRequisito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoRequisito`
--

LOCK TABLES `TipoRequisito` WRITE;
/*!40000 ALTER TABLE `TipoRequisito` DISABLE KEYS */;
INSERT INTO `TipoRequisito` VALUES (1,'Nesesario'),(2,'Opcional'),(3,'Sugerido');
/*!40000 ALTER TABLE `TipoRequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso`
--

DROP TABLE IF EXISTS `caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso` (
  `idproceso` int(11) NOT NULL,
  `idSolicitud` int(11) NOT NULL,
  `atiendeCaso` varchar(9) NOT NULL,
  `comentarios` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproceso`,`idSolicitud`),
  KEY `fk_caso_2_idx` (`idSolicitud`),
  CONSTRAINT `fk_caso_1` FOREIGN KEY (`idproceso`) REFERENCES `Proceso` (`idProceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caso_2` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitud` (`idsolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casoDetalle`
--

DROP TABLE IF EXISTS `casoDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casoDetalle` (
  `idSolicitud` int(11) NOT NULL,
  `idProceso` int(11) NOT NULL,
  `idPaso` int(11) NOT NULL,
  `idprocesoDetalle` int(11) NOT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idSolicitud`,`idProceso`),
  KEY `fk_casoDetalle_2_idx` (`idProceso`),
  KEY `fk_casoDetalle_3_idx` (`idPaso`),
  KEY `fk_casoDetalle_4_idx` (`idprocesoDetalle`),
  CONSTRAINT `fk_casoDetalle_1` FOREIGN KEY (`idSolicitud`) REFERENCES `caso` (`idSolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_casoDetalle_2` FOREIGN KEY (`idProceso`) REFERENCES `caso` (`idproceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_casoDetalle_3` FOREIGN KEY (`idPaso`) REFERENCES `procesoDetalle` (`idPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_casoDetalle_4` FOREIGN KEY (`idprocesoDetalle`) REFERENCES `procesoDetalle` (`idprocesoDetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casoDetalle`
--

LOCK TABLES `casoDetalle` WRITE;
/*!40000 ALTER TABLE `casoDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `casoDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casoDetalleRequisito`
--

DROP TABLE IF EXISTS `casoDetalleRequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casoDetalleRequisito` (
  `idcaso` int(11) NOT NULL,
  `idproceso` int(11) NOT NULL,
  `idsolicitud` int(11) NOT NULL,
  `idPaso` int(11) NOT NULL,
  `idTipoPaso` int(11) NOT NULL,
  `idRequisito` int(11) NOT NULL,
  `idTipoRequisito` int(11) NOT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcaso`,`idproceso`,`idsolicitud`),
  KEY `fk_casoDetalleRequisito_1_idx` (`idsolicitud`),
  KEY `fk_casoDetalleRequisito_3_idx` (`idproceso`),
  KEY `fk_casoDetalleRequisito_4_idx` (`idTipoPaso`),
  KEY `fk_casoDetalleRequisito_2_idx` (`idPaso`),
  KEY `fk_casoDetalleRequisito_5_idx` (`idRequisito`),
  KEY `fk_casoDetalleRequisito_6_idx` (`idTipoRequisito`),
  CONSTRAINT `fk_casoDetalleRequisito_1` FOREIGN KEY (`idsolicitud`) REFERENCES `casoDetalle` (`idSolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_casoDetalleRequisito_2` FOREIGN KEY (`idPaso`) REFERENCES `PasoRequisito` (`idPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_casoDetalleRequisito_3` FOREIGN KEY (`idproceso`) REFERENCES `casoDetalle` (`idProceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_casoDetalleRequisito_4` FOREIGN KEY (`idTipoPaso`) REFERENCES `PasoRequisito` (`idTipoPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_casoDetalleRequisito_5` FOREIGN KEY (`idRequisito`) REFERENCES `PasoRequisito` (`idRequisito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_casoDetalleRequisito_6` FOREIGN KEY (`idTipoRequisito`) REFERENCES `PasoRequisito` (`idTipoRequisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casoDetalleRequisito`
--

LOCK TABLES `casoDetalleRequisito` WRITE;
/*!40000 ALTER TABLE `casoDetalleRequisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `casoDetalleRequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casoDetalleRequisitoAtestado`
--

DROP TABLE IF EXISTS `casoDetalleRequisitoAtestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casoDetalleRequisitoAtestado` (
  `idcaso` int(11) NOT NULL,
  `idproceso` int(11) NOT NULL,
  `idsolicitud` int(11) NOT NULL,
  `pathArchivo` varchar(255) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcaso`,`idproceso`,`idsolicitud`,`pathArchivo`),
  UNIQUE KEY `pathArchivo_UNIQUE` (`pathArchivo`),
  CONSTRAINT `fk_casoDetalleRequisitoAtestado_1` FOREIGN KEY (`idcaso`, `idproceso`, `idsolicitud`) REFERENCES `casoDetalleRequisito` (`idcaso`, `idproceso`, `idsolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casoDetalleRequisitoAtestado`
--

LOCK TABLES `casoDetalleRequisitoAtestado` WRITE;
/*!40000 ALTER TABLE `casoDetalleRequisitoAtestado` DISABLE KEYS */;
/*!40000 ALTER TABLE `casoDetalleRequisitoAtestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesoDetalle`
--

DROP TABLE IF EXISTS `procesoDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procesoDetalle` (
  `idprocesoDetalle` int(11) NOT NULL,
  `idproceso` int(11) NOT NULL,
  `idPaso` int(11) NOT NULL,
  `procesoDetallePadre` int(11) NOT NULL DEFAULT '0',
  `Detalle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprocesoDetalle`,`idproceso`,`idPaso`,`procesoDetallePadre`),
  KEY `fk_procesoDetalle_1_idx` (`idPaso`),
  KEY `fk_procesoDetalle_2_idx` (`idproceso`),
  KEY `fk_procesoDetalle_3_idx` (`procesoDetallePadre`),
  CONSTRAINT `fk_procesoDetalle_1` FOREIGN KEY (`idPaso`) REFERENCES `Paso` (`idPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_procesoDetalle_2` FOREIGN KEY (`idproceso`) REFERENCES `Proceso` (`idProceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_procesoDetalle_3` FOREIGN KEY (`procesoDetallePadre`) REFERENCES `procesoDetalle` (`idprocesoDetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesoDetalle`
--

LOCK TABLES `procesoDetalle` WRITE;
/*!40000 ALTER TABLE `procesoDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `procesoDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud` (
  `idsolicitud` int(11) NOT NULL,
  `solicitante` varchar(9) NOT NULL,
  `fechaSolicitud` datetime NOT NULL,
  `personal` varchar(9) NOT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idsolicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-02 14:33:54
