CREATE DATABASE  IF NOT EXISTS `inventarios` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventarios`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: inventarios
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `info` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2021-11-17',''),(2,'2021-12-24',NULL),(3,'2021-12-07',NULL),(4,'2021-10-20',NULL),(5,'2021-11-30',NULL);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'??cidos minerales no oxidantes'),(2,'??cidos minerales oxidantes'),(3,'??cidos organicos'),(4,'Alcoholes y glicoles.'),(5,'Aldehidos'),(6,'Amidas'),(7,'Aminas alfaticas y aromaticas'),(8,'Azo compuestos, diazo compuestos e hidracinas'),(10,'Causticos'),(13,'Esteres'),(16,'Hidrocarburos aromaticos'),(17,'??rgano-halogenos'),(19,'Cetonas'),(22,'Otros metales elementales o mezclados en forma de polvo'),(23,'Otros metales elementales y aleaciones'),(24,'Metales y compuestos de metales toxicos'),(27,'Compuestos org??nicos'),(30,'Per??xidos e hidroper??xidos org??nicos'),(33,'Sulfuros org??nicos'),(102,'Explosivos'),(104,'Agentes oxidantes fuertes'),(105,'Agentes reductores fuertes');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `tipo_inventario` varchar(6) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tipo_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES ('I.P','Inventario de laboratorio de pesados'),('I.R','Inventario de residuos'),('I.RA','Inventario de reactivos');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_l_pesados`
--

DROP TABLE IF EXISTS `inventario_l_pesados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_l_pesados` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(40) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `num_serie` varchar(30) DEFAULT NULL,
  `uso` varchar(140) DEFAULT NULL,
  `clave_patrimonial` varchar(35) DEFAULT NULL,
  `guia_y_manual` varchar(50) DEFAULT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  `laboratorio` varchar(8) DEFAULT NULL,
  `antiguedad` int DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_laboratorio_idx` (`laboratorio`),
  KEY `fk_tipo_idx` (`tipo`),
  CONSTRAINT `fk_laboratorio` FOREIGN KEY (`laboratorio`) REFERENCES `laboratorio` (`id`),
  CONSTRAINT `fk_tipo` FOREIGN KEY (`tipo`) REFERENCES `inventario` (`tipo_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_l_pesados`
--

LOCK TABLES `inventario_l_pesados` WRITE;
/*!40000 ALTER TABLE `inventario_l_pesados` DISABLE KEYS */;
INSERT INTO `inventario_l_pesados` VALUES ('LALIM-001','Un equipo  Digestor  con bomba de vac??o y de dos unidades Kjeldahl.','CRODE',NULL,'2830879',NULL,NULL,NULL,'Fuera de servicio','L.AL',10,'I.P'),('LALIM-002','Digestor destilador Kjeldahl marca','LABCONCO',NULL,'2829806','Para determinacion de proteIna',NULL,NULL,NULL,'L.AL',10,'I.P'),('LALIM-003','Parrilla Electrica c/ agitador magn??tico.','CORNING',NULL,NULL,'Calentamiento',NULL,NULL,NULL,'L.AL',10,'I.P'),('LALIM-004','Autoclave vertical c/ man??metro','CEOUSA',NULL,NULL,'Esterilizacion de material y equipo por calor humedo ',NULL,NULL,NULL,'L.AL',30,'I.P'),('LALIM-005','Evaporador Rotatorio al vacio','KFRAMO',NULL,'2829679',NULL,NULL,NULL,'Fuera de servicio','L.AL',15,'I.P'),('LALIM-006','Balanza granataria cap. 2600 gr','OHAUS',NULL,'2830188','Pesar muestras',NULL,NULL,NULL,'L.AL',30,'I.P'),('LALIM-007','Balanza anal??tica adventure cap.210 g ','OHAUS',NULL,NULL,'Pesar muestras',NULL,NULL,NULL,'L.AL',8,'I.P'),('LALIM-008','Bomba de vacio ','FELI WELCH',NULL,'2890056','Para filtracion',NULL,NULL,NULL,'L.AL',35,'I.P'),('LALIM-009','Contador de colonias','SOL-BAT',NULL,'28300296','para contar colonias ',NULL,NULL,NULL,'L.AL',35,'I.P'),('LALIM-010','Microscopio binocular ','KARL ZEISS',NULL,'2830498',NULL,NULL,NULL,'4 en uso y 2 en reparacion ','L.AL',8,'I.P'),('LALIM-011','Microscopio binocular ','3B',NULL,NULL,NULL,NULL,NULL,NULL,'L.AL',6,'I.P'),('LALIM-012','Esteroscopio','SWFT',NULL,'2830527','Para observar cuerpos opacos',NULL,NULL,NULL,'L.AL',20,'I.P'),('LALIM-013','Refract??metro ABBE','IROSCOPE',NULL,NULL,NULL,NULL,NULL,'En reparacion ','L.AL',20,'I.P'),('LALIM-014','Espectrofot??metro 6/20-T9273','PERKINS',NULL,NULL,NULL,NULL,NULL,'Fuera de servicio','L.AL',20,'I.P'),('LALIM-015','Mufla de 0-1200?? C','CAISA',NULL,NULL,NULL,NULL,NULL,'En reparacion ','L.AL',25,'I.P'),('LALIM-016','Mufla de 0-1200?? C','THERMOLYNE',NULL,'2830812','Calentamiento de muestras, esterilizacion de materia por vapor seco',NULL,NULL,NULL,'L.AL',20,'I.P'),('LALIM-017','Ba??o mar??a el??ctrico','RIOSSA',NULL,'2830932','para ba??os marias en practicas',NULL,NULL,NULL,'L.AL',15,'I.P'),('LALIM-018','Ba??o mar??a el??ctrico','J.M. ORTIZ',NULL,NULL,NULL,NULL,NULL,'Fuera de servicio','L.AL',10,'I.P'),('LALIM-019','Estufa Horno de 0-300??C','J.M. ORTIZ',NULL,'2830932','Para calentamiento ',NULL,NULL,NULL,'L.AL',25,'I.P'),('LALIM-020','Horno de secado de circulaci??n forzada  de 0-300?? C','RIOSSA',NULL,'2830933','Para deshidratar muestras y esterilizar material ',NULL,NULL,NULL,'L.AL',7,'I.P'),('LALIM-021','Incubadora','RIOSSA',NULL,NULL,NULL,NULL,NULL,'Fuera de servicio','L.AL',35,'I.P'),('LALIM-022','Incubador vertical ','PRESCION-SCIENTIFIC',NULL,NULL,NULL,NULL,NULL,'Fuera de servicio','L.AL',30,'I.P'),('LALIM-023','Estufa de vacio con termostato','LAB-LINE INSTRUMENT',NULL,NULL,NULL,NULL,NULL,'Fuera de servicio','L.AL',15,'I.P'),('LALIM-024','Campana de extracci??n ','CRODE',NULL,'2844786',NULL,NULL,NULL,'Fuera de servicio','L.AL',20,'I.P'),('LALIM-025','Campana de extracci??n','DEDUTEL',NULL,NULL,'Extraccion de gases en practicas',NULL,NULL,NULL,'L.AL',5,'I.P'),('LALIM-026','Refrigerador  dos puertas horizontales 9 pies','GENERAL ELECTRIC',NULL,NULL,'Almacenamiento de muestras ',NULL,NULL,NULL,'L.AL',10,'I.P'),('LALIM-027','Refrigerador dos puertas horizontales  7 pies','LG',NULL,NULL,NULL,NULL,NULL,'Fuera de servicio','L.AL',7,'I.P'),('LALIM-028','Microdigestor KJELDAHL de 6 unidades','CRODE',NULL,NULL,'Para calentar',NULL,NULL,NULL,'L.AL',10,'I.P'),('LALIM-029','Microdestilador  KJELDAHL','CRODE',NULL,NULL,NULL,NULL,NULL,'Fuera de servicio','L.AL',10,'I.P'),('LALIM-030','Refrigerador  20.5 ft???','FRIGIDARE',NULL,NULL,'Almacenamiento de muestras y reactivos',NULL,NULL,NULL,'L.AL',2,'I.P'),('LALIM-031','Incubadora ','BOKEL',NULL,NULL,'Para incubar muestras echas en practicas ',NULL,NULL,NULL,'L.AL',2,'I.P'),('LAMB-001','Aparato incutrol','Hach ',NULL,NULL,'Control de temperatura',NULL,NULL,NULL,'L.AM',10,'I.P'),('LAMB-002','Bomba de vac??o','Milipore, Felisa, Master cool',NULL,NULL,'Filtaci??n',NULL,NULL,NULL,'L.AM',8,'I.P'),('LAMB-003','Bomba de aireaci??n','Optima',NULL,NULL,'Aereaci??n',NULL,NULL,NULL,'L.AM',10,'I.P'),('LAMB-004','Campana de extracci??n  ','LapConco',NULL,NULL,'Extracci??n de gases',NULL,NULL,NULL,'L.AM',15,'I.P'),('LAMB-005','Compresor de gases','Graftsman',NULL,NULL,'Para Cromatografo',NULL,NULL,NULL,'L.AM',10,'I.P'),('LAMB-006','Balanza anal??tica','Navigator',NULL,NULL,'Pesados con mayor presici??n',NULL,NULL,NULL,'L.AM',5,'I.P'),('LAMB-007','Balanza granataria','Ohuus',NULL,NULL,'Pesar',NULL,NULL,NULL,'L.AM',7,'I.P'),('LAMB-008','Balanza electr??nica','Ohuus',NULL,NULL,'',NULL,NULL,NULL,'L.AM',5,'I.P'),('LAMB-009','Muflas','Frederiksen, Barnestead',NULL,NULL,'Calcinaci??n',NULL,NULL,NULL,'L.AM',15,'I.P'),('LAMB-010','Estufa de cultivo','Riossa',NULL,NULL,'Incubaci??n de microorganismos',NULL,NULL,NULL,'L.AM',10,'I.P'),('LAMB-011','Estufa de secado','Shel-Lab, Riossa',NULL,NULL,'Eliminacion de humedad',NULL,NULL,NULL,'L.AM',10,'I.P'),('LAMB-012','Refrigerador','Frigidire',NULL,NULL,'Precervacion de muestras',NULL,NULL,NULL,'L.AM',1,'I.P'),('LAMB-013','Parrilla de agitaci??n con calentamiento','Corning',NULL,NULL,'Agitacion y calentamiento',NULL,NULL,NULL,'L.AM',3,'I.P'),('LAMB-014','Parrilla el??ctrica','Corning, Thermolyne, Thermoscientitic',NULL,NULL,'calentamiento',NULL,NULL,NULL,'L.AM',3,'I.P'),('LAMB-015','Ba??o mar??a','Riossa',NULL,NULL,'Calentamiento',NULL,NULL,NULL,'L.AM',15,'I.P'),('LAMB-016','Incubadora','??Riossa',NULL,NULL,'Incuvacion de microorganismos',NULL,NULL,NULL,'L.AM',10,'I.P'),('LAMB-017','Rota vapor','Buchi',NULL,'28dit0007a','Prificacion de solventes',NULL,NULL,NULL,'L.AM',15,'I.P'),('LAMB-018','Espectrofot??metro de absorci??n at??mica','Perkinenmer',NULL,NULL,'Determinacion de metales',NULL,NULL,NULL,'L.AM',17,'I.P'),('LAMB-019','Espectrofot??metro de lectura directa','Hach dr2000, dr2800',NULL,'Lpg422.53.00012','Determinacion de diversos parametros',NULL,NULL,NULL,'L.AM',3,'I.P'),('LAMB-020','Potenci??metro','suelos',NULL,NULL,'Determinacion de pH',NULL,NULL,NULL,'L.AM',1,'I.P'),('LAMB-021','Turbidimetro','Motte',NULL,NULL,'Determinacion de turbidez',NULL,NULL,NULL,'L.AM',5,'I.P'),('LAMB-022','Conductimetro',NULL,NULL,'910205798','Derminacion tem, SDT, Cond.',NULL,NULL,NULL,'L.AM',4,'I.P'),('LAMB-023','Microscopios','Konas, Iencou satm',NULL,NULL,'Obcervacion de microorganismos',NULL,NULL,NULL,'L.AM',12,'I.P'),('LAMB-024','Esterilizador','All. American',NULL,NULL,'eliminacion de microorganismos',NULL,NULL,NULL,'L.AM',8,'I.P'),('LAMB-025','Cromatografo de gases','Varian',NULL,NULL,'Determinacion de la composicion de los gases',NULL,NULL,NULL,'L.AM',10,'I.P'),('LAMB-026','Medidor de turbidez','Orbeco-hellige',NULL,NULL,'Determinacion de Turbidez',NULL,NULL,NULL,'L.AM',9,'I.P'),('LAMB-027','Medidor de conductividad','Hach ',NULL,NULL,'Determinacion de Condutivilidad',NULL,NULL,NULL,'L.AM',7,'I.P'),('LAMB-028','Medidor de pH ','orion',NULL,NULL,'Determinacion de pH',NULL,NULL,NULL,'L.AM',3,'I.P'),('LAMB-029','Medidor de salinidad','Ysi',NULL,NULL,'Determinacion de salinidad',NULL,NULL,NULL,'L.AM',5,'I.P'),('LAMB-030','Microdestilador','Crode',NULL,NULL,'Separacion de sustancias atraves de su punto de ebullici??n',NULL,NULL,NULL,'L.AM',8,'I.P'),('LAMB-031','Medidor port??til de solidos disueltos','Hanna',NULL,NULL,'Determinacion de SDT',NULL,NULL,NULL,'L.AM',10,'I.P'),('LAMB-032','Medidor de ruido','Extech',NULL,NULL,'Medicion de los deciveles que existen en el ambiente',NULL,NULL,NULL,'L.AM',13,'I.P'),('LAMB-033','Medidor electr??nico multifuncional','Dedutel',NULL,NULL,NULL,NULL,NULL,NULL,'L.AM',14,'I.P'),('LAMB-034','Olla de presi??n','Stel, Ecko',NULL,NULL,NULL,NULL,NULL,NULL,'L.AM',10,'I.P'),('LANA-001','Destilador',NULL,'A1015-B61','2112100760853','Obtenci??n de agua destilada para todos los laboratorios',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-002','Estufa ','Thermolyne',NULL,NULL,'Para secado de material y reactivos',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-003','Estufa ','Isotemp',NULL,NULL,NULL,NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-004','Mufla',NULL,'P501',NULL,NULL,NULL,NULL,'DA??ADA','L.AN',NULL,'I.P'),('LANA-005','Mufla','Lindemberg',NULL,NULL,'Para calentar residuos s??lidos',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-006','Balanza anal??tica','Adam','PW254','AE4381639','Para pesaje de reactivos con exactitud',NULL,NULL,'Capacidad: 250g, d= 0.0001g','L.AN',NULL,'I.P'),('LANA-007','Balanza anal??tica',NULL,'E1240','E2161119283095','Para pesaje de reactivos con exactitud',NULL,NULL,'Capacidad: 250g, d= 0.0001g','L.AN',NULL,'I.P'),('LANA-008','Balanza anal??tica',NULL,'AR2140','128851225271149','Para pesaje de reactivos con exactitud',NULL,NULL,'Capacidad: 250g, d= 0.0001g','L.AN',NULL,'I.P'),('LANA-009','Balanza anal??tica','Adam','RE4381641','AE4381641','Para pesaje de reactivos con exactitud',NULL,NULL,'Da??ada','L.AN',NULL,'I.P'),('LANA-010','Balanza anal??tica',NULL,'AR2140','N13123','Para pesaje de reactivos con exactitud',NULL,NULL,'Tiene error','L.AN',NULL,'I.P'),('LANA-011','Parrilla','Corning',NULL,NULL,'Calentamiento de muestras',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-012','Parrilla','Corning',NULL,NULL,'Calentamiento de muestras',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-013','Parrilla','Corning',NULL,NULL,'Calentamiento de muestras',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-014','Parrilla','Corning',NULL,NULL,'Calentamiento de muestras',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-015','Bomba de vac??o',NULL,NULL,NULL,'Se utiliza para hacer filtraciones al vac??o.',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LANA-016','Bomba de vac??o',NULL,NULL,NULL,'Se utiliza para hacer filtraciones al vac??o.',NULL,NULL,NULL,'L.AN',NULL,'I.P'),('LFIS-001','Balanza anal??tica','ADE','','','Para pesaje de sustancias o muestras   ',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-002','Balanza Anal??tica','Ohaus','Adventurer','K3391227390147','Para pesaje de sustancias o muestras   ',NULL,NULL,'Capacidad: 210g, d= 0.0001g','L.FQ',NULL,'I.P'),('LFIS-003','Bomba de vac??o','Koblenz','DGP-134',NULL,'Se utiliza para hacer filtraciones al vac??o.',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-004','Color??metro','Klett-Summerson','33784',NULL,'Colorimetr??a',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-005','Espectrofot??metro UV-VIS','Perkin Elmer','Lambda 10','110N8112510','Determinaci??n de concentraciones',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-006','Espectrofot??metro UV-VIS','Dedutel','DECLQUIM-QI',NULL,'Determinaci??n de concentraciones',NULL,NULL,'DA??ADO','L.FQ',NULL,'I.P'),('LFIS-007','Espectrofot??metro','Milton Roy','Spectronic 21D',NULL,'Determinaci??n de concentraciones',NULL,NULL,'DA??ADO','L.FQ',NULL,'I.P'),('LFIS-008','Espectrofot??metro','Milton Roy','Spectronic 21D',NULL,'Determinaci??n de concentraciones',NULL,NULL,'DA??ADO','L.FQ',NULL,'I.P'),('LFIS-009','Espectrofot??metro','Milton Roy','Spectronic 21D',NULL,'Determinaci??n de concentraciones',NULL,NULL,'DA??ADO','L.FQ',NULL,'I.P'),('LFIS-010','Espectrofot??metro','Bausch & Lamb','Spectronic 20',NULL,'Determinaci??n de concentraciones',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-011','Espectrofot??metro port??til','Hanna',NULL,NULL,NULL,NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-012','Comparador de color','Taylor',NULL,NULL,NULL,NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-013','Estufa','Riossa','I060600636',NULL,'Para secado de material y reactivos',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-014','Parrilla con agitaci??n','Corning','PC420D','33507225087','Calentamiento y agitaci??n de muestras',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-015','Parrilla con agitaci??n','Corning','PC220','350200108515','Calentamiento y agitaci??n de muestras',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-016','Multiparrilla','PMC Barnstead','524C','978051222371','Calentamiento y agitaci??n de muestras',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-017','Multiparrilla','PMC Barnstead','524C','978051222368','Calentamiento y agitaci??n de muestras',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-018','Agitador','Corning','PC353',NULL,'Agitaci??n de muestras',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LFIS-019','Agitador','Corning',NULL,NULL,'Agitaci??n de muestras',NULL,NULL,NULL,'L.FQ',NULL,'I.P'),('LINOR-001','Centrifuga de 6 tubos','Clay Adams',NULL,NULL,'Separaci??n de muestras',NULL,NULL,NULL,'L.QI',28,'I.P'),('LINOR-002','Balanza anal??tica','ADE',NULL,NULL,'Para pesaje de sustancias o muestras   ',NULL,NULL,NULL,'L.QI',5,'I.P'),('LINOR-003','Balanza anal??tica','Ohaus','Adventurer',NULL,'Para pesaje de sustancias o muestras   ',NULL,NULL,NULL,'L.QI',5,'I.P'),('LINOR-004','Balanza granataria','Ohaus','Adventurer','1225270807','Para pesaje de sustancias o muestras   ',NULL,NULL,'Capacidad: 2100g, d= 0.1g  FUERA DE OPERACI??N','L.QI',18,'I.P'),('LINOR-005','Parrilla con agitaci??n','IKA','C-MAG HS7',NULL,'Calentamiento y agitaci??n de muestras',NULL,NULL,'Con termopar (0-500??C)','L.QI',2,'I.P'),('LINOR-006','Parrilla con agitaci??n','IKA','C-MAG HS7',NULL,'Calentamiento y agitaci??n de muestras',NULL,NULL,'Con termopar (0-500??C)','L.QI',2,'I.P'),('LINOR-007','Parrilla sin agitaci??n','Thermoline','HP46825','639930354686','Calentamiento de muestras',NULL,NULL,'FUERA DE OPERACI??N','L.QI',10,'I.P'),('LINOR-008','Parrilla sin agitaci??n','Thermoline','HP46825','','Calentamiento de muestras',NULL,NULL,'NO ENCONTRADA','L.QI',7,'I.P'),('LINOR-009','Parrilla sin agitaci??n','Thermoline','HP46825','64981152316','Calentamiento de muestras',NULL,NULL,NULL,'L.QI',7,'I.P'),('LINOR-010','Campana de extracci??n',NULL,NULL,NULL,'Extracci??n de gases',NULL,NULL,NULL,'L.QI',8,'I.P'),('LINOR-011','Agitador Electrico','mag-mix','6594',NULL,'Agitaci??n de muestras',NULL,NULL,NULL,'L.QI',10,'I.P'),('LINOR012','Parrilla de Calentamiento','CIMAREC','HP131535','1,31506E+12','Calentamiento de muestras',NULL,NULL,NULL,'L.QI',5,'I.P'),('LIONOR013','Balanza Granataria','OHAUS',NULL,NULL,'Para pesaje de sustancias o muestras   ',NULL,NULL,NULL,'L.QI',28,'I.P'),('LORG-001','Balanza anal??tica','Ohaus','Adventurer','12851225271145P','Para pesaje de sustancias o muestras   ',NULL,NULL,'Capacidad: 210g, d= 0.0001g','L.QO',30,'I.P'),('LORG-002','Balanza granataria','ADAM ','Nimbus','AE9XD115','Para pesaje de sustancias o muestras   ',NULL,NULL,'Capacidad: 220g, d= 0.001g','L.QO',2,'I.P'),('LORG-003','Balanza anal??tica','ADAM ','PW 254','AE4381315','Para pesaje de sustancias o muestras   ',NULL,NULL,'Capacidad: 250g, d= 0.0001g','L.QO',10,'I.P'),('LORG-004','Balanza granataria de un plato','Ohaus',NULL,NULL,'Para pesaje de sustancias o muestras   ',NULL,NULL,'DA??ADA','L.QO',40,'I.P'),('LORG-005','Balanza granataria de un plato','DGN ',NULL,NULL,'Para pesaje de sustancias o muestras   ',NULL,NULL,'DA??ADA','L.QO',50,'I.P'),('LORG-006','Bomba de vac??o','Black Gold',NULL,'6420316','Se utiliza para hacer filtraciones al vac??o.',NULL,NULL,NULL,'L.QO',55,'I.P'),('LORG-007','Bomba de vac??o','SIEMENS','FG-15U0L','990992','Se utiliza para hacer filtraciones al vac??o.',NULL,NULL,NULL,'L.QO',40,'I.P'),('LORG-008','Bomba de vac??o','SIEMENS',NULL,'H00','Se utiliza para hacer filtraciones al vac??o.',NULL,NULL,NULL,'L.QO',40,'I.P'),('LORG-009','Medidor de punto de fusi??n','Fisher Jhons',NULL,NULL,'Calcula el punto de fusi??n de sustancias s??lidas.',NULL,NULL,NULL,'L.QO',40,'I.P'),('LORG-010','Parrilla de calentamiento','CIMAREC','HP 131535','1315040691466','Se utiliza para calentar',NULL,NULL,NULL,'L.QO',5,'I.P'),('LORG-011','Parrilla de calentamiento','CIMAREC','HP 131535','1315040691467','Se utiliza para calentar',NULL,NULL,NULL,'L.QO',5,'I.P'),('LORG-012','Parrilla de calentamiento','CIMAREC','SP 46925','1089971033559','Se utiliza para calentar',NULL,NULL,NULL,'L.QO',10,'I.P'),('LORG-013','Parrilla de calentamiento','CIMAREC','HP 46825','1070981154016','Se utiliza para calentar',NULL,NULL,'DA??ADA','L.QO',40,'I.P'),('LORG-014','Parrilla de calentamiento','CIMAREC','HP 46825','1070981153997','Se utiliza para calentar',NULL,NULL,'DA??ADA','L.QO',40,'I.P'),('LORG-015','Parrilla de calentamiento','SYBRON (Thermolyne)','HP-A1915B',NULL,'Se utiliza para calentar',NULL,NULL,'DA??ADA','L.QO',40,'I.P'),('LORG-016','Parrilla con agitaci??n','CORNING','PC 420 D','013506261169','Calentamiento y agitaci??n magnetica.',NULL,NULL,NULL,'L.QO',7,'I.P'),('LORG-017','Parrilla con agitaci??n','CORNING','PC 420 D','013506261187','Calentamiento y agitaci??n magnetica.',NULL,NULL,NULL,'L.QO',7,'I.P'),('LORG-018','Parrilla con agitaci??n','CORNING','PC 420 D','013506261194','Calentamiento y agitaci??n magnetica.',NULL,NULL,NULL,'L.QO',7,'I.P'),('LORG-019','Parrilla con agitaci??n','CORNING','PC 420 D','013506261186','Calentamiento y agitaci??n magnetica.',NULL,NULL,NULL,'L.QO',7,'I.P'),('LORG-020','Parrilla con agitaci??n','CORNING','PC 420 D','033507291103','Calentamiento y agitaci??n magnetica.',NULL,NULL,NULL,'L.QO',7,'I.P'),('LORG-021','Parrilla con agitaci??n','IKA','C-MAG HS7 S1','03.400374','Calentamiento y agitaci??n magnetica.',NULL,NULL,NULL,'L.QO',2,'I.P'),('LORG-022','Parrilla con agitaci??n','IKA','C-MAG HS7 S1','03.400353','Calentamiento y agitaci??n magnetica.',NULL,NULL,NULL,'L.QO',2,'I.P'),('LORG-023','Parrilla de calentamiento','LINDEBERG','59066','','Se utiliza para calentar',NULL,NULL,'DA??ADA','L.QO',40,'I.P'),('LORG-024','Estufa',NULL,NULL,NULL,'Es util para el secado de material y para llevar a cabo las reacciones que requieren de altas temperaturas',NULL,NULL,NULL,'L.QO',50,'I.P'),('LORG-025','Refrigerador','FRIGIDAIRE','FFTR2131QS0','4A54321675','Es utilizado para almacenar y mantener reactivos que requieren temperaturas bajas',NULL,NULL,NULL,'L.QO',2,'I.P'),('LPES-001','Torre de destilaci??n','Chemint',NULL,NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-002','Torre de absorc??n','Chemint',NULL,NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-003','Secador rotatorio','Chemint','ADF64/150',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-004','Reactor esmaltado','Pfavoler','UTL3023157',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-005','Reactor esmaltado','Pfavoler','UTL3023157',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-006','Reactor cristalizador','Chemint','CR25601',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-007','Evaporador doble efecto','Chemint','F2-F2B',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-008','Evaporador de pel??cula ascendente','Chemint','NVPE100',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-009','Reactor hidrogenado','Chemint','4567',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-010','Extractor s??lido-liquido','Chemint','207',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-011','Bomba centrifuga de vac??o','Marelli',NULL,NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-012','Bomba centrifuga de vac??o','Marelli',NULL,NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-013','Bomba centr??fuga','Marelli','NVPE90L4',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-014','Destilador de agua','Bamster',NULL,NULL,NULL,NULL,'','Fuera de operacion','L.PE',46,'I.P'),('LPES-015','Tanque de condensados',NULL,NULL,NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-016','Tanque de almacenamiento de acero inoxidable','Chemint','CR25601',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-017','Tanque de almacenamiento de acero inoxidable','Chemint','CR25601',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-018','Tanque de almacenamiento de acero inoxidable','Chemint','CR25601',NULL,NULL,NULL,'',NULL,'L.PE',46,'I.P'),('LPES-019','Filtro centr??fugo','Chemint','29 ','',NULL,NULL,NULL,NULL,'L.PE',46,'I.P');
/*!40000 ALTER TABLE `inventario_l_pesados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_reactivos`
--

DROP TABLE IF EXISTS `inventario_reactivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_reactivos` (
  `N_inventario` int NOT NULL,
  `reactivo` varchar(40) DEFAULT NULL,
  `grupo` int DEFAULT NULL,
  `formula` varchar(40) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `id_compra` int DEFAULT NULL,
  `cantidad_aprox` decimal(6,3) DEFAULT NULL,
  `medida` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`N_inventario`),
  KEY `fk_grupo_idx` (`grupo`),
  KEY `fk_tipinv_idx` (`tipo`),
  CONSTRAINT `fk_grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_tipinv` FOREIGN KEY (`tipo`) REFERENCES `inventario` (`tipo_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_reactivos`
--

LOCK TABLES `inventario_reactivos` WRITE;
/*!40000 ALTER TABLE `inventario_reactivos` DISABLE KEYS */;
INSERT INTO `inventario_reactivos` VALUES (1,'??cido clorhidr??co',1,'HCL','I.RA',1,0.800,'Litro'),(2,'??cido sulfurico 4N',2,'H2S04','I.RA',4,0.250,'Litro'),(3,'??cido sulfurico 10%',2,'H2S04','I.RA',1,0.200,'Litro'),(4,'??cido sulfurico 7%',2,'H2S04','I.RA',1,0.300,'Litro'),(5,'??cido sulfurico ',2,'H2S04','I.RA',4,0.600,'Litro'),(6,'??cido ac??tico neutro',3,'CH3COOH','I.RA',5,3.000,'Litro'),(7,'Anh??drido ac??tico',3,'(CH3CO)2O','I.RA',1,0.600,'Litro'),(8,'??cido ac??tico',3,'CH3COOH','I.RA',4,10.000,'Litro'),(9,'Acido ox??lico (FR)',3,'HOCOCOOH*,2H2O','I.RA',4,0.600,'Litro'),(10,'Acido tart??rico',3,'H2C4C6O6','I.RA',1,3.000,'Libra'),(11,'Metanol',4,'CH3OH','I.RA',1,0.500,'Litro'),(12,'Alcohol N-propilico',4,'CH3CH2CH2OH','I.RA',1,0.300,'Litro'),(13,'Alcohol N-amilico',4,'CH3(CH2)3CH2OH','I.RA',4,0.400,'Litro'),(14,'Glicerol',4,'CH3H5(OH)3','I.RA',1,0.350,'Litro'),(15,'Alcohol terbutilico',4,'[CH3]3COH','I.RA',4,0.100,'Litro'),(16,'Alcohol etilico',4,'CH3CH2OH','I.RA',1,10.000,'Litro'),(17,'Alcohol etilico(reciclado)',4,'CH3CH2OH','I.RA',1,2.000,'Litro'),(18,'Alcohol iso-am??lico',4,'(CH3)2CHCH2CH2OH','I.RA',1,2.000,'Litro'),(19,'1-propanol 99.7%',4,'C3H8O','I.RA',4,1.000,'Litro'),(20,'Formaldehido en soluci??n',5,'HCHO','I.RA',2,1.300,'Litro'),(21,'Tioacetamida',6,'CH3CSNH2','I.RA',5,0.800,'Gramo'),(22,'Anilina',7,'C6H3NH2','I.RA',2,0.300,'Litro'),(23,'o-tuluidina',8,'C14H16N2*2HCL','I.RA',5,2.000,'Gramo'),(24,'Hidr??xido de amonio (FR)',10,'NH4OH','I.RA',2,2.000,'Litro'),(25,'Amoniaco 2N (FR)',10,'NH3','I.RA',4,2.000,'Litro'),(26,'Sodio carbonatado anh??drico',10,'NA2CO3','I.RA',4,2.000,'Gramo'),(27,'??cido b??rico',1,'H3BO3','I.RA',2,400.000,'Gramo'),(28,'Hidr??xido de sodio (perlas)',10,'NAOH','I.RA',4,0.400,'Gramo'),(29,'Hidr??xido de sodio',10,'NAOH','I.RA',2,0.400,'Gramo'),(30,'??xido de calcio',10,'CAO','I.RA',2,0.500,'Gramo'),(31,'Acetato de etilo',13,'CH3COOC2H5','I.RA',4,0.500,'Litro'),(32,'Benzoato de metilo',13,'C8H8O2','I.RA',4,0.500,'Litro'),(33,'Benzoato de metilo 99%',13,'C8H8O2','I.RA',5,0.500,'Litro'),(34,'Clorhidrato de hidroxilamina',16,'NH2OH*HCL','I.RA',2,400.000,'Gramo'),(35,'Tetracloruro de carbono',17,'CCL4','I.RA',2,2.000,'Litro'),(36,'Clorobenceno',17,'C6H3CL','I.RA',2,2.000,'Litro'),(37,'Acetona',19,'(CH3)2C0','I.RA',4,2.000,'Litro'),(38,'Etil-metil-acetona',19,'CH3COCH2CH3','I.RA',2,2.000,'Litro'),(39,'Aluminio en polvo',22,NULL,'I.RA',2,300.000,'Gramo'),(40,'Acido sulfurico 4%',2,'H2S04','I.RA',5,0.500,'Litro'),(41,'Hojas de zinc-metal',23,'Zn','I.RA',5,300.000,'Gramo'),(42,'Cobre electrol??tico',23,'Cu','I.RA',2,600.000,'Gramo'),(43,'Cobre en lamina',23,'Cu','I.RA',4,300.000,'Gramo'),(44,'Cobre en virutas pesadas',23,'Cu','I.RA',2,400.000,'Gramo'),(45,'Balines de plomo',23,'pb','I.RA',3,600.000,'Gramo'),(46,'Bronce',23,NULL,'I.RA',2,300.000,'Gramo'),(47,'Cobre(alambres)',23,'Cu','I.RA',2,300.000,'Gramo'),(48,'Granalia de Zinc',23,'Zn','I.RA',3,600.000,'Gramo'),(49,'Aluminio',23,'Al','I.RA',5,600.000,'Gramo'),(50,'Cobre granular metal',23,'Cu','I.RA',4,100.000,'Gramo'),(51,'Sulfato c??prico',23,'CuSO4','I.RA',2,500.000,'Gramo'),(52,'Yoduro de potasio',23,'Kl','I.RA',3,400.000,'Gramo'),(53,'Sulfato de fierro heptahidratico',24,'FeSO4*7H20','I.RA',2,500.000,'Gramo'),(54,'Yodato de potasio',24,'KLO3','I.RA',2,200.000,'Gramo'),(55,'Cloruro de bario',24,'BACL2*2H2O','I.RA',3,0.400,'Litro'),(56,'Nitrato de bismuto ',24,'Bi(NO3)3*5H2O','I.RA',2,0.150,'Litro'),(57,'Nitrato de bario',24,'BA(NO3)2','I.RA',3,0.000,'Litro'),(58,'Cloruro de calcio',24,'CACL2*2H2O','I.RA',2,0.300,'Litro'),(59,'Esta??o en polvo',24,'Sn','I.RA',3,300.000,'Gramo'),(60,'Sulfato de hierro 2',24,'FESO4*7H2O','I.RA',2,300.000,'Gramo'),(61,'Sulfato f??rrico amoniacal',24,'FE(NH4)(SO4)2*12H2O','I.RA',2,400.000,'Gramo'),(62,'Cloruro f??rrico',24,'FECl3*6H2O','I.RA',2,200.000,'Gramo'),(63,'Yoduro de mercurio',24,NULL,'I.RA',3,200.000,'Gramo'),(64,'Cromato de potasio',24,'K2CrO4','I.RA',2,150.000,'Gramo'),(65,'Nitrato de plata',24,'AgNO3','I.RA',2,0.100,'Litro'),(66,'Yoduro de potasio',24,'Kl','I.RA',4,150.000,'Gramo'),(67,'Permanganato de potasio',24,'KMnO4','I.RA',2,0.300,'Litro'),(68,'Sulfato de zinc heptahidratado',24,'ZnSO4*H2O','I.RA',2,350.000,'Gramo'),(69,'Sulfato ferroso amoniacal',24,'FE(NH4)(SO4)2*6H2O','I.RA',3,500.000,'Gramo'),(70,'Sulfato de Niquel',24,'NiSO4*6H2O','I.RA',2,300.000,'Gramo'),(71,'Oxido de plomo',24,'Pb3O4','I.RA',2,500.000,'Gramo'),(72,'Oxido de merc??rico',24,'HgO','I.RA',5,400.000,'Gramo'),(73,'Sulfato de zinc',24,'ZnSO4','I.RA',2,200.000,'Gramo'),(74,'Cloruro c??prico',24,'CuCL2*2H2O','I.RA',2,200.000,'Gramo'),(75,'Oxido de cobre (hilos)',24,'CuCL2O-CuO','I.RA',5,NULL,'Gramo'),(76,'Nitrato de plata',24,'AgNO30.1M','I.RA',2,0.500,'Litro'),(77,'Persulfato de potasio',24,'K2S2O8','I.RA',3,0.300,'Litro'),(78,'Esta??o 20 mallas',24,NULL,'I.RA',3,450.000,'Gramo'),(79,'Mercurio',24,'Hg','I.RA',2,500.000,'Gramo'),(80,'Nitrobenceno',27,'C6H5NO2','I.RA',5,2.000,'Litro'),(81,'Per??xido de hidrogeno (30%)',30,'H2O2','I.RA',2,0.050,'Litro'),(82,'Sulfuro de hierro ',33,'FeS','I.RA',2,600.000,'Gramo'),(83,'Sulfato f??rrico',33,NULL,'I.RA',3,700.000,'Gramo'),(84,'Nitrato de amonio',102,'NH4NO3','I.RA',2,1.000,'Kilogramo'),(85,'Nitrato de bismuto',102,'BI(NO3)3 5H20','I.RA',2,600.000,'Gramo'),(86,'Tiocinato de amonio',102,'NH4SCN','I.RA',3,300.000,'Gramo'),(87,'Nitrato de potasio',102,'KNO3','I.RA',2,300.000,'Gramo'),(88,'Permanganato de potasio',104,'KMnO4 (5%)','I.RA',2,0.400,'Litro'),(89,'Cromato de potasio',104,'K2Cr2O4 (5%)','I.RA',2,0.200,'Litro'),(90,'Nitrato de plata',104,'PbO2','I.RA',4,0.250,'Litro'),(91,'Di??xido de plomo',104,'AgNO3','I.RA',2,200.000,'Gramo'),(92,'Nitrato de plata .5 M',104,'AgNO3','I.RA',5,0.200,'Litro'),(93,'Nitrato de cobalto',104,'Co(NO3)2 6H2O','I.RA',2,0.100,'Litro'),(94,'Nitrato de sodio',104,'NaNO3','I.RA',4,150.000,'Gramo'),(95,'Oxido de magnesio',104,'MgO','I.RA',3,0.000,'Gramo'),(105,'Acetato de sodio',105,'CH3COONa','I.RA',2,200.000,'Gramo'),(106,'Acetato de sodio tri-hidratado',105,'CH3COONa * 3H2O ','I.RA',2,250.000,'Gramo'),(107,'Acetato de sodio (anidro)',105,'CH3COONa','I.RA',4,100.000,'Gramo'),(108,'Sulfito de sodio',105,'Na2C2O4','I.RA',2,700.000,'Gramo'),(109,'Sodio',105,'Na','I.RA',5,400.000,'Gramo');
/*!40000 ALTER TABLE `inventario_reactivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_residuos`
--

DROP TABLE IF EXISTS `inventario_residuos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_residuos` (
  `nombre` varchar(200) NOT NULL,
  `cantidad` decimal(6,3) DEFAULT NULL,
  `contenedor` decimal(7,3) DEFAULT NULL,
  `fecha_de_generacion` date DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `medida` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  KEY `fk_tipo_idx` (`tipo`),
  KEY `fk_tipoinv_idx` (`tipo`),
  CONSTRAINT `fk_tipoinv` FOREIGN KEY (`tipo`) REFERENCES `inventario` (`tipo_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_residuos`
--

LOCK TABLES `inventario_residuos` WRITE;
/*!40000 ALTER TABLE `inventario_residuos` DISABLE KEYS */;
INSERT INTO `inventario_residuos` VALUES ('Aceite usado',2.000,8.000,'2021-09-18','I.R','Litro'),('Acetato de etilo- ??cido ac??tico',0.000,8.000,'2021-09-18','I.R','Litro'),('Acetato dietilo - aqua',1.200,8.000,'2021-09-18','I.R','Litro'),('Acido ac??lico - etanol',4.000,8.000,'2021-09-18','I.R','Litro'),('Acido acetice - agua',4.000,8.000,'2021-09-18','I.R','Litro'),('Acido acetico - agua ',0.800,8.000,'2021-09-18','I.R','Litro'),('Acido ac??tico fenolftaleina',1.000,300.000,'2021-09-18','I.R','Gramo'),('Acido clorh??drico + yodo',2.000,8.000,'2021-09-18','I.R','Litro'),('Acido clorh??drico-acetato de metilo',3.600,8.000,'2021-09-18','I.R','Litro'),('??cido clorh??drico-??cido de etilo',4.000,8.000,'2021-09-18','I.R','Litro'),('Acido clorhidrico-anaranjado de metilo',0.500,8.000,'2021-09-18','I.R','Litro'),('Butanol-agua',0.500,8.000,'2021-09-18','I.R','Litro'),('Carb??n activado + hidr??xido de sodio ',0.000,8.000,'2021-09-18','I.R','Litro'),('Cloruro de amonio',30.000,300.000,'2021-09-18','I.R','Gramo'),('Etanol-agua',2.000,8.000,'2021-09-18','I.R','Litro'),('Etilenglicol',3.200,8.000,'2021-09-18','I.R','Litro'),('Hidr??xido de sodio - alcohol etilico',0.050,8.000,'2021-09-18','I.R','Litro'),('Manganato de potasio',0.020,8.000,'2021-09-18','I.R','Litro'),('Metanol-agua',1.000,8.000,'2021-09-18','I.R','Litro'),('Mezcla ??cido ac??tico contaminado con oxido',2.000,8.000,'2021-09-18','I.R','Litro'),('Mezcla ??cido sulf??rico',7.800,8.000,'2021-09-18','I.R','Litro'),('Mezcla cr??mica-aqua',0.800,8.000,'2021-09-18','I.R','Litro'),('Mezcla de benceno-aqua',0.100,8.000,'2021-09-18','I.R','Litro'),('Mezcla de tiosulfato de sodio',0.000,8.000,'2021-09-18','I.R','Litro'),('Mezcla de yodo ??cido clorhidrico',4.000,8.000,'2021-09-18','I.R','Litro'),('Mezcla de yoduro de potasio',0.000,8.000,'2021-09-18','I.R','Litro'),('Mezcla etilenglicol-agua',1.000,8.000,'2021-07-18','I.R','Litro'),('Mezcla no identificada',1.500,8.000,'2021-09-18','I.R','Litro'),('Mezcla orfhotolidna',1.000,8.000,'2021-09-18','I.R','Litro'),('Mezclas de cloruro de sodio, sulfato de cobre, cloruro de potasio, oxido de magnesio, carbonato de calcio, nitrato de boro, cloruro de estroncio',100.000,300.000,'2021-09-18','I.R','Gramo'),('N-n dimetil acetamide con resina',1.000,300.000,'2021-09-18','I.R','Gramo'),('Residuo de hidr??xido de sodio .8N',1.000,8.000,'2021-09-18','I.R','Litro'),('Residuo de ??xido de plomo Residuo de yoduro de potasio + per??xido',0.250,8.000,'2021-09-18','I.R','Litro'),('Residuo de sulfato de cobre',1.000,8.000,'2021-09-18','I.R','Litro'),('Residuo de yoduro de potasio',0.250,8.000,'2021-09-18','I.R','Litro'),('Residuo etilenglicol- etanol-agua',0.050,8.000,'2021-09-18','I.R','Litro'),('Residuo inorg??nicos acetona',0.000,8.000,'2021-09-18','I.R','Litro'),('Residuos de cloro con reactivo ByC',0.140,8.000,'2021-09-18','I.R','Litro'),('Soluci??n de flem??n',1.000,300.000,'2021-09-18','I.R','Gramo'),('Tiosulfato de sodio - ??cido-sulf??nco agua',1.900,8.000,'2021-09-18','I.R','Litro');
/*!40000 ALTER TABLE `inventario_residuos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorio` (
  `id` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES ('L.AL','Laboratorio de alimentos'),('L.AM','Laboratorio de ambiental'),('L.AN','Laboratorio de analitica'),('L.FQ','Laboratorio de fisicoqu??mica'),('L.PE','Laboratorio de pesados'),('L.QI','Laboratorio de qu??mica inorg??nica'),('L.QO','Laboratorio de qu??mica organica');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practica`
--

DROP TABLE IF EXISTS `practica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practica` (
  `id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practica`
--

LOCK TABLES `practica` WRITE;
/*!40000 ALTER TABLE `practica` DISABLE KEYS */;
INSERT INTO `practica` VALUES (1,'Ley de la conservasion de la masa','1.1 Utilizar la balanza para determinar la masa (peso) de algunos objetos. 1.2 Comprobar experimentalmente la ley de la conservaci??n de la masa. 1.3 Comprobar experimentalmente algunas manifestaciones de la energ??a. 1.4. Conocer los m??todos de separaci??n de mezclas. '),(2,'Cambios de estado','1.1 Conocer y manejar algunas de las propiedades espec??ficas de las sustancias. 1.2 Observar algunos cambios de estado e interpretarlos, clasific??ndolos en f??sicos y qu??micos. '),(3,'Particulas subatomicas','1.1. Deducir de acuerdo a los experimentos algunas caracter??sticas del electr??n, part??cula fundamental del ??tomo. '),(4,'N??meros cu??nticos y distribucion electr??nica','1.1. Explicar el significado de los cuatro n??meros cu??nticos. 1.2. Deducir el posible n??mero de los electrones por nivel, por subnivel y por cada orbital. '),(5,'Estructura de la tabla y propiedades peri??dicas','1.1. Observar una serie de elementos y ordenarlos en la tabla peri??dica seg??n su caracter??stica de metales y no metales tanto como por su actividad qu??mica. 1.2. Ordenar una serie de elementos seg??n su electronegatividad, energ??a de ionizaci??n y afinidad electr??nica. '),(6,'Tipos de enlace qu??mico','1.1. Escribir la formula de Lewis (electr??nica) de compuestos binarios y ternarios. 1.2. Distinguir los diferentes tipos de enlace de las sustancias con base en la electronegatividad de sus elementos. '),(7,'Propiedades de las sustancias por su enlace qu??mico','1.1 Comprobaras algunas de las propiedades de las sustancias con base a su enlace. '),(8,'Identificacion y nomenclatura de funciones quimicas in??rganicas','1.1 Escribir??s la f??rmula qu??mica y el nombre de los compuesto inorg??nicos m??s comunes. '),(9,'Tipos de reacciones quimicas in??rganicas','1.1 Explicar el concepto y las caracter??sticas de una reacci??n qu??mica. 1.2 Explicar los diferentes tipos de reacciones qu??micas en los que se clasifican con base a la descomposici??n o la formaci??n de las sustancias que intervienen. '),(10,'Volumetr??a ??cido-base','1.  Aprender  a  realizar  una  volumetr??a  ??cido-base. 2.  Determinar  la  concentraci??n  de  una  disoluci??n  de  NaOH  de  concentraci??n desconocida  por  neutralizaci??n  con  una  disoluci??n de HCl  de  concentraci??n conocida. 3.  Determinar  la  acidez  del  vinagre  como  ??cido  Ac??tico. '),(11,'Reacciones exot??rmicas,endot??rmicas y de descomposici??n','1.  Conocer  e  identificar  distintos  tipos  de  reacciones  Qu??micas. 2.  Analizar  los  cambios  que  se  producen  al combinar  dos  sustancias  qu??micas. 3.  Conocer  las  reacciones  involucradas  en  la  reacci??n  qu??mica. '),(12,'Reacciones de oxido-reducci??n','1.  Conocer  e  identificar  una  reacci??n  de  sustituci??n  simple. 2.  Visualizar  los  cambios  que  ocurren  en las  sustancias  cuando  ocurre  una  reacci??n  de ??xido-reducci??n.');
/*!40000 ALTER TABLE `practica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactivo`
--

DROP TABLE IF EXISTS `reactivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactivo` (
  `N_inventario` int NOT NULL,
  `cantidad` decimal(6,3) NOT NULL,
  `medida` varchar(10) DEFAULT NULL,
  `practica` int NOT NULL,
  PRIMARY KEY (`N_inventario`,`practica`),
  KEY `fk_inv_idx` (`N_inventario`),
  KEY `fk_practica_idx` (`practica`),
  CONSTRAINT `fk_inv` FOREIGN KEY (`N_inventario`) REFERENCES `inventario_reactivos` (`N_inventario`),
  CONSTRAINT `fk_practica` FOREIGN KEY (`practica`) REFERENCES `practica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactivo`
--

LOCK TABLES `reactivo` WRITE;
/*!40000 ALTER TABLE `reactivo` DISABLE KEYS */;
INSERT INTO `reactivo` VALUES (1,0.200,'Litro',1),(1,0.600,'Litro',2),(2,0.200,'Litro',1),(3,0.100,'Litro',3),(4,0.250,'Litro',4),(5,0.500,'Litro',3),(6,2.000,'Litro',2),(7,0.500,'Litro',1),(8,0.100,'Litro',1),(8,0.600,'Litro',2),(8,1.000,'Galon',3),(8,1.000,'Litro',4),(9,0.250,'Litro',2),(9,0.350,'Litro',5),(10,2.000,'Libra',1),(11,0.400,'Litro',4),(12,0.250,'Litro',8),(13,0.300,'Litro',9),(14,0.400,'Litro',2),(14,0.300,'Litro',12),(15,0.050,'Litro',3),(16,2.000,'Galon',1),(16,0.700,'Litro',4),(17,1.000,'Litro',5),(18,1.000,'Litro',8),(19,0.900,'Litro',9),(20,1.200,'Litro',2),(21,0.500,'Gramo',3),(22,0.240,'Litro',4),(23,0.050,'Gramo',1),(23,0.085,'Gramo',5),(23,0.100,'Gramo',6),(23,0.400,'Gramo',7),(23,0.050,'Gramo',8),(23,0.025,'Gramo',9),(24,1.000,'Litro',5),(25,0.200,'Litro',4),(26,0.250,'Gramo',2),(26,0.450,'Gramo',3),(26,0.200,'Gramo',8),(27,500.000,'Gramo',6),(28,0.200,'Gramo',7),(29,0.320,'Gramo',6),(30,0.450,'Gramo',2),(31,0.200,'Litro',3),(32,0.400,'Litro',1),(33,0.200,'Litro',2),(34,100.000,'Gramo',1),(34,100.000,'Gramo',2),(34,20.000,'Gramo',3),(34,60.000,'Gramo',4),(35,1.000,'Litro',5),(36,1.000,'Litro',6),(37,1.000,'Litro',7),(38,1.000,'Litro',1),(38,0.800,'Litro',2),(39,200.000,'Gramo',3),(40,0.450,'Litro',7),(41,250.000,'Gramo',1),(42,500.000,'Gramo',2),(43,200.000,'Gramo',1),(44,250.000,'Gramo',5),(45,500.000,'Gramo',3),(46,200.000,'Gramo',2),(47,100.000,'Gramo',1),(48,500.000,'Gramo',2),(49,500.000,'Gramo',5),(50,15.000,'Gramo',1),(51,400.000,'Gramo',4),(52,300.000,'Gramo',6),(53,0.400,'Litro',1),(56,0.150,'Litro',3),(58,0.300,'Litro',1),(58,0.300,'Litro',3),(59,300.000,'Gramo',7),(60,300.000,'Gramo',1),(61,400.000,'Gramo',2),(61,400.000,'Gramo',4),(61,400.000,'Gramo',5),(61,400.000,'Gramo',7),(62,200.000,'Gramo',2),(63,200.000,'Gramo',1),(64,150.000,'Gramo',6),(65,0.100,'Litro',7),(66,150.000,'Gramo',3),(66,150.000,'Gramo',6),(67,0.500,'Litro',3),(67,0.200,'Litro',5),(68,350.000,'Gramo',2),(69,400.000,'Gramo',1),(69,250.000,'Gramo',7),(70,250.000,'Gramo',2),(71,400.000,'Gramo',3),(72,300.000,'Gramo',6),(73,100.000,'Gramo',7),(74,100.000,'Gramo',3),(76,0.500,'Litro',1),(77,0.200,'Litro',1),(77,0.300,'Litro',3),(77,0.300,'Litro',4),(78,450.000,'Gramo',5),(79,500.000,'Gramo',2),(80,1.000,'Litro',1),(81,0.050,'Litro',3),(82,500.000,'Gramo',5),(83,600.000,'Gramo',6),(84,1.000,'Kilogramo',2),(85,100.000,'Gramo',5),(85,500.000,'Gramo',7),(86,300.000,'Gramo',1),(87,250.000,'Gramo',5),(88,0.400,'Litro',2),(89,0.100,'Litro',1),(90,0.250,'Litro',3),(91,150.000,'Gramo',4),(92,0.200,'Litro',6),(93,0.100,'Litro',6),(94,150.000,'Gramo',1),(105,150.000,'Gramo',1),(106,250.000,'Gramo',2),(107,100.000,'Gramo',4),(108,350.000,'Gramo',5),(108,350.000,'Gramo',6),(109,400.000,'Gramo',5);
/*!40000 ALTER TABLE `reactivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Jefe de departamento'),(3,'Asistente ');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_inv`
--

DROP TABLE IF EXISTS `rol_inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_inv` (
  `rol` int NOT NULL,
  `tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`rol`,`tipo`),
  KEY `fk_rol_inv_idx` (`tipo`),
  CONSTRAINT `fk_rols` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`),
  CONSTRAINT `fk_tip_inv` FOREIGN KEY (`tipo`) REFERENCES `inventario` (`tipo_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_inv`
--

LOCK TABLES `rol_inv` WRITE;
/*!40000 ALTER TABLE `rol_inv` DISABLE KEYS */;
INSERT INTO `rol_inv` VALUES (1,'I.P'),(2,'I.P'),(3,'I.P'),(1,'I.R'),(2,'I.R'),(3,'I.R'),(1,'I.RA'),(2,'I.RA'),(3,'I.RA');
/*!40000 ALTER TABLE `rol_inv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `contrase??a` varchar(45) DEFAULT NULL,
  `rol` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_usuario_rol_idx` (`rol`),
  CONSTRAINT `pk_usuario_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'inventarios'
--
/*!50003 DROP PROCEDURE IF EXISTS `Laboratorios_FisicoQuimica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Laboratorios_FisicoQuimica`(IN tipo varchar(10))
BEGIN
SELECT * FROM inventario_l_pesados WHERE laboratorio = tipo ;
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

-- Dump completed on 2022-01-01 19:10:54
