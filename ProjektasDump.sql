-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: semestro_projektas
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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('Alytus'),('Birštonas'),('Druskininkai'),('Kaunas'),('Kėdainiai'),('Klaipėda'),('Palanga'),('Panevėžys'),('Šiauliai'),('Vilnius');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `fk_event_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(5) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `duration` int NOT NULL,
  `fk_city` varchar(40) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `fk_place` int NOT NULL,
  `phone_number` varchar(12) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT '',
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `tickets` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `fk_photo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_type` (`fk_event_type`),
  KEY `event_city_name` (`fk_city`),
  KEY `place_id_idx` (`fk_place`),
  KEY `creator_id_idx` (`fk_user_id`),
  KEY `photo_id_idx` (`fk_photo`),
  CONSTRAINT `creator_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user_account` (`id`),
  CONSTRAINT `event_city_name` FOREIGN KEY (`fk_city`) REFERENCES `city` (`name`),
  CONSTRAINT `event_type` FOREIGN KEY (`fk_event_type`) REFERENCES `event_type` (`name`),
  CONSTRAINT `photo_id` FOREIGN KEY (`fk_photo`) REFERENCES `photos` (`id`),
  CONSTRAINT `place_id` FOREIGN KEY (`fk_place`) REFERENCES `place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,1,'Whitesnake & Europe - Kaunas','Koncertai','2020-05-21','20:00',3,'Kaunas',1,'',NULL,'https://www.facebook.com/events/526721851386840/ ','Metų roko šou: grupės „Whitesnake“ ir „Europe“ koncertas!','https://www.bilietai.lt/lit/renginiai/koncertai/atsauktas-whitesnake-ir-europe-304575/?fbclid=IwAR0wOFaYU54Ymbeg-i5WfjB8Z57xf_sAPqsHBQgJ97yj3jOYvSWIXUQWvtM',1),(2,1,'Miuziklas „Adamsų šeimynėlė“','Spektakliai','2020-05-28','18:00',3,'Kaunas',2,'+37037787744','http://www.muzikinisteatras.lt/ ','https://www.facebook.com/Muzikinis.teatras/','Miuziklas apie antgamtiškai paslaptingą ir švelniai šėtonišką Adamsų šeimą sukurtas pagal Marshall Brickman ir Rick Elice knygą „Adamsų šeimynėlė“. Muziką ir eilių tekstus jam parašė Amerikos teatro Drama Desk apdovanojimo laureatas Andrew Lippa. Miuziklo veikėjų charakteristikos perimtos iš Charles Addams nupieštų amerikiečių šeimos personažų suteikus jiems gausybę vampyriškai makabriškų elgsenos ir išvaizdos detalių. ','www.muzikinisteatras.lt/#/Adamsu-seimynele.html',5),(3,1,'Johann\'o Strauss\'o operetė ŠIKŠNOSPARNIS','Spektakliai','2020-05-24','18:00',3,'Kaunas',2,'+37037200933','http://www.muzikinisteatras.lt ','https://www.facebook.com/Muzikinis.teatras/','Populiariausios valsų kompozitoriaus J.Strausso operetės „Šikšnosparnis“ pagrindinis herojus Aizenšteinas savo žmoną pavadina miela, bet jau perskaityta knyga. Tačiau jo sutuoktinė Rozalinda, pasitelkusi gudrumą ir moterišką žavesį, įrodo lengvabūdžiui vyrui, kad šis knygą skaitė labai paviršutiniškai, o gal net praleido įdomiausius puslapius.','www.muzikinisteatras.lt/#/Siksnosparnis.html?repert=2908',7),(4,1,'Foals - Vilnius','Koncertai','2020-09-02','20:00',3,'Vilnius',19,'',NULL,'https://www.facebook.com/events/889240128160523/ ','Britų roko pirmūnai Foals grįžta į Lietuvą.Taip, tai tiesa! Jie grįžta. Skelbiam dar vieną klasišką koncertą su gitaromis. „Foals“ vėl drebins Vilnių. Šis modernaus roko koncertas sostinėje suplanuotas rugsėjo 2 d. koncertų salėje „Compensa“.Pasirodymas Vilniuje - didelio koncertų turo „Everything Not Saved Will Be Lost“ dalis. ','https://www.bilietai.lt/lit/renginiai/koncertai/foals-vilnius-308216/?fbclid=IwAR3zSeHvrAFB3dT__eztMcGaGSPHe2YYIF_bbcxKLDCbruQguE9qE75rwYM',8),(8,1,'Original Enigma Voices','Koncertai','2020-11-17','20:00',2,'Vilnius',19,'','https://kakava.lt/renginys/original-enigma-voices/1031',NULL,'Kultinio muzikinio projekto „Enigma“ nariai, susibūrę į projektą „Original Enigma Voices“, grįžta į Lietuvą su nauja programa. Rudenį atlikėjai su grupe ir styginių orkestru surengs tris koncertus: lapkričio 17 d. Vilniuje, lapkričio 18 d. Kaune ir lapkričio 19 d. Palangoje. „Original Enigma Voices“ – tai trys nepakartojami Andru Donalds, Angel X ir Fox Lima balsai, skambėję tokiose grupės „Enigma“ dainose  kaip „Return to Innocence“, „Seven Lives“ ar „MMX Social Song“. Šias ir kitas geriausias projekto „Enigma“ dainas žiūrovai išgirs ir koncertuose mūsų šalyje. „Original Enigma Voices“ nariai žada, kad tai bus nepamirštama kelionė į užburiančių garsų bei vaizdų pasaulį.','https://kakava.lt/renginys/original-enigma-voices/1031',11),(9,1,'Didžioji kalėdinė Kauno mugė','Iniciatyvos','2020-12-12','10:00',5,'Kaunas',1,'+37067042441','https://festivus.lt/renginiai/muges/didzioji-kaledine-kauno-muge','','Kalėdų karavanas gruodį prasuks pro Kauną ir nudžiugins didžiausia šventine muge mieste!','',12),(10,1,'Lenny Kravitz','Koncertai','2020-06-04','20:00',2,'Kaunas',1,'','https://kakava.lt/renginys/lenny-kravitz/1212/2903 ','https://www.facebook.com/events/1368859573293094/ ','Kitų metų birželio 4 d. į Kauno „Žalgirio“ areną atvyksta dainininkas, prodiuseris, dainų autorius, multiinstrumentalistas Lenny Kravitz. Koncertas Lietuvoje įtrauktas į atlikėjo dviejų metų turą „Here to Love“. Keturių „Grammy“ apdovanojimų laimėtojas Lenny Kravitz, derindamas rokenrolą, fanką, bliuzą ir soulą, dar 1989 m. sukūrė savitą muzikinį stilių, kurį išpuoselėjo pernai išleistame jau vienuoliktame studijiniame albume „Raise Vibration“. Jaunatviško polėkio ir trijų dešimtmečių patirtimi praturtintas albumas tarsi atspindi kūrybinį atgimimą – tai drąsus, ryškus ir genialus darbas, atitinkantis atlikėjo beribę dvasią. ',NULL,10),(15,1,'Original Enigma Voices','Koncertai','2020-11-18','20:00',2,'Kaunas',1,'','https://kakava.lt/renginys/original-enigma-voices/1031',NULL,'Kultinio muzikinio projekto „Enigma“ nariai, susibūrę į projektą „Original Enigma Voices“, grįžta į Lietuvą su nauja programa. Rudenį atlikėjai su grupe ir styginių orkestru surengs tris koncertus: lapkričio 17 d. Vilniuje, lapkričio 18 d. Kaune ir lapkričio 19 d. Palangoje. „Original Enigma Voices“ – tai trys nepakartojami Andru Donalds, Angel X ir Fox Lima balsai, skambėję tokiose grupės „Enigma“ dainose  kaip „Return to Innocence“, „Seven Lives“ ar „MMX Social Song“. Šias ir kitas geriausias projekto „Enigma“ dainas žiūrovai išgirs ir koncertuose mūsų šalyje. „Original Enigma Voices“ nariai žada, kad tai bus nepamirštama kelionė į užburiančių garsų bei vaizdų pasaulį.','https://kakava.lt/renginys/original-enigma-voices/1031',11),(24,1,'Woodkid - Vilnius','Koncertai','2020-05-20','20:00',3,'Vilnius',19,'+37068517086',NULL,'https://www.facebook.com/events/686703041859560/','Pagaliau turim retą progą pamatyti Woodkid.Grafikos dizaineris, režisierius, meno vadovas ir dainų kūrėjas viename. Iki šiol Lietuvos taip ir neaplankęs, bet senokai lauktas. Woodkid į Lietuvą atsiveš visą koncertą, naujos muzikos, vizualizacijas ir pribloškiantį šou. Pasirodymas Vilniuje – Woodkid turo dalis. Geros pažinties, tobulo koncerto.','https://www.bilietai.lt/lit/renginiai/koncertai/perkeltas-woodkid-vilnius-303765/?fbclid=IwAR26e8XOkIW_BxPHo-VeFMM82ssjPI2sHCNr3ulQREsi42-0SiyvnzdxJYk',4),(25,1,'Borisas Grebenščikovas ir Аkvarium su nauja programa','Koncertai','2020-05-26','19:00',3,'Vilnius',19,'',NULL,'https://www.facebook.com/events/435894490432329/ ','Gegužės 26-ąją Vilniuje su nauja programa koncertuos Borisas Grebenščikovas ir legendinis „Аkvarium“! Borisas Grebenščikovas – „neritmiškosios šalies rokenrolo pasiuntinys“ (taip kukliai jis pats save apibūdina), pasirodys Lietuvoje! Vienintelis koncertas įvyks gegužės 26-ąją 19 val. Vilniaus „Compensa“ salėje! BG ir pačios publikos pageidavimu, šį kartą parteryje bus stovimos vietos, o sėdimos vietos bus tik balkone! Tik šiame koncerte BG ir jo grupė atliks ypatingą programą, kurioje skambės ir „auksiniai hitai“ ir intriguojančios naujos dainos!','https://www.bilietai.lt/lit/renginiai/koncertai/perkeltas-borisas-grebenscikovas-ir-legendinis-akvarium-302972/?fbclid=IwAR2DJbhaW1ntNjMg1wQ66sd3By9w0DKsmUIENt03r7NRpynpzqE75NsdaEI',9);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_type` (
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES ('Ekskursijos'),('Festivaliai'),('Iniciatyvos'),('Kinas'),('Koncertai'),('Minėjimai'),('Mokymai'),('Parodos'),('Premjeros'),('Seminarai'),('Spektakliai'),('Sportas'),('Užsakomi'),('Vaikams'),('Vakarėliai');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (26);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'event_photos/1.jpg'),(2,'place_photos/2.jpg'),(3,'place_photos/3.jpg'),(4,'event_photos/4.jpg'),(5,'event_photos/5.jpg'),(6,'place_photos/6.jpg'),(7,'event_photos/7.jpg'),(8,'event_photos/8.jpg'),(9,'event_photos/9.jpg'),(10,'event_photos/10.jpg'),(11,'event_photos/11.jpg'),(12,'event_photos/12.jpg');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `fk_city` varchar(40) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `phone_number` varchar(12) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `fk_place_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT '',
  `facebook` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `working_hours` varchar(40) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT '',
  `fk_photo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `place_city_name` (`fk_city`),
  KEY `place_type` (`fk_place_type`),
  KEY `fk_photo_id_idx` (`fk_photo`),
  KEY `user_id_idx` (`fk_user_id`),
  CONSTRAINT `fk_photo_id` FOREIGN KEY (`fk_photo`) REFERENCES `photos` (`id`),
  CONSTRAINT `place_city_name` FOREIGN KEY (`fk_city`) REFERENCES `city` (`name`),
  CONSTRAINT `place_type` FOREIGN KEY (`fk_place_type`) REFERENCES `place_type` (`name`),
  CONSTRAINT `user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,1,'Žalgirio arena','Kaunas','Karaliaus Mindaugo prospektas 50','+37061598636','Sporto arenos','http://www.zalgirioarena.lt/','	https://www.facebook.com/Zalgirioarena','Kauno „Žalgirio“ arena – viena didžiausių arenų Baltijos šalyse. 2008 m. Nemuno saloje iškilmingai įkasta kapsulė, kuri simbolizavo  Kauno sporto arenos statybų pradžią. \"Žalgirio\" arenos projektą parengė architektas Eugenijus Miliūnas.','08:00-18:00',2),(2,1,'Kauno valstybinis muzikinis teatras','Kaunas','Laisvės alėja 91','+37037200633','Teatrai','http://www.muzikinisteatras.lt/','https://www.facebook.com/Muzikinis.teatras/','Kauno valstybinis muzikinis teatras vienas didžiausių Lietuvoje. Jis įsikūręs pagal architekto Ustino Golinevičiaus 1891 m. statytame  pastate . Čia  gimė profesionalus  lietuvių teatras. Jau daugelį metų  Muzikinio teatro kolektyvas ištikimai laikosi tradicijų ir kuria visus muzikinės scenos kūrinius.','09:00-17:00',6),(19,1,'„Compensa“ koncertų salė','Vilnius','Adresas: Kernavės g. 84, Vilnius','+37065376746','Koncertų salės','http://www.compensakoncertusale.lt','https://www.facebook.com/compensakoncertusale/','„Compensa“ koncertų salė - tai nauja kultūros ir pramogų vieta sostinėje.','',3);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_type`
--

DROP TABLE IF EXISTS `place_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_type` (
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_type`
--

LOCK TABLES `place_type` WRITE;
/*!40000 ALTER TABLE `place_type` DISABLE KEYS */;
INSERT INTO `place_type` VALUES ('Barai'),('Bibliotekos'),('Boulingas'),('Istoriniai objektai'),('Kavinės'),('Kinas'),('Kino teatrai'),('Koncertų salės'),('Konferencijų salės'),('Lankytinos vietos'),('Lauko erdvės'),('Medicinos įstaigos'),('Meno erdvės'),('Mokslo įstaigos'),('Muziejai'),('Naktiniai barai'),('Naktiniai klubai'),('Pramogų parkai'),('Prekybos vietos'),('Religinės įstaigos'),('Restoranai'),('Saviugdos centrai'),('Spa centrai'),('Sporto arenos'),('Sporto centrai'),('Šokių studijos'),('Teatrai'),('Valstybinės įstaigos'),('Viešbučiai'),('Vietovės');
/*!40000 ALTER TABLE `place_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `password_salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1,'admin','admin@eventsearch.com','admin',NULL,'ADMIN'),(6,'Robertas','robertas@pastas.lt','123456',NULL,'USER'),(12,'Domantas','Domantas@pastas.lt','123456',NULL,'USER'),(13,'Domantas2','Domantas@pastas.lt','123456',NULL,'USER'),(15,'dasda54','admin@eventsearch.com','dasdasd',NULL,'USER');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bio`
--

DROP TABLE IF EXISTS `user_bio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bio` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `surname` varchar(50) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `phone_number` varchar(12) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci DEFAULT '',
  `subscription` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bio`
--

LOCK TABLES `user_bio` WRITE;
/*!40000 ALTER TABLE `user_bio` DISABLE KEYS */;
INSERT INTO `user_bio` VALUES (1,'Admin','Vartotojas','',0);
/*!40000 ALTER TABLE `user_bio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-19 18:55:07
