-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: semestro_projektas
-- ------------------------------------------------------
-- Server version	8.0.19

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
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,1,'Whitesnake & Europe - Kaunas','Koncertai','2020-05-21','20:00',3,'Kaunas',1,'+37065667674',NULL,'https://www.facebook.com/events/526721851386840/ ','Metų roko šou: grupės „Whitesnake“ ir „Europe“ koncertas!','https://www.bilietai.lt/lit/renginiai/koncertai/atsauktas-whitesnake-ir-europe-304575/?fbclid=IwAR0wOFaYU54Ymbeg-i5WfjB8Z57xf_sAPqsHBQgJ97yj3jOYvSWIXUQWvtM',1),(2,1,'Miuziklas „Adamsų šeimynėlė“','Spektakliai','2020-05-28','18:00',3,'Kaunas',2,'+37037787744','http://www.muzikinisteatras.lt/ ','https://www.facebook.com/Muzikinis.teatras/','Miuziklas apie antgamtiškai paslaptingą ir švelniai šėtonišką Adamsų šeimą sukurtas pagal Marshall Brickman ir Rick Elice knygą „Adamsų šeimynėlė“. Muziką ir eilių tekstus jam parašė Amerikos teatro Drama Desk apdovanojimo laureatas Andrew Lippa. Miuziklo veikėjų charakteristikos perimtos iš Charles Addams nupieštų amerikiečių šeimos personažų suteikus jiems gausybę vampyriškai makabriškų elgsenos ir išvaizdos detalių. ','www.muzikinisteatras.lt/#/Adamsu-seimynele.html',5),(3,1,'Johann\'o Strauss\'o operetė ŠIKŠNOSPARNIS','Spektakliai','2020-05-24','18:00',3,'Kaunas',2,'+37037200933','http://www.muzikinisteatras.lt ','https://www.facebook.com/Muzikinis.teatras/','Populiariausios valsų kompozitoriaus J.Strausso operetės „Šikšnosparnis“ pagrindinis herojus Aizenšteinas savo žmoną pavadina miela, bet jau perskaityta knyga. Tačiau jo sutuoktinė Rozalinda, pasitelkusi gudrumą ir moterišką žavesį, įrodo lengvabūdžiui vyrui, kad šis knygą skaitė labai paviršutiniškai, o gal net praleido įdomiausius puslapius.','www.muzikinisteatras.lt/#/Siksnosparnis.html?repert=2908',7),(4,1,'Foals - Vilnius','Koncertai','2020-09-02','20:00',3,'Vilnius',19,'',NULL,'https://www.facebook.com/events/889240128160523/ ','Britų roko pirmūnai Foals grįžta į Lietuvą.Taip, tai tiesa! Jie grįžta. Skelbiam dar vieną klasišką koncertą su gitaromis. „Foals“ vėl drebins Vilnių. Šis modernaus roko koncertas sostinėje suplanuotas rugsėjo 2 d. koncertų salėje „Compensa“.Pasirodymas Vilniuje - didelio koncertų turo „Everything Not Saved Will Be Lost“ dalis. ','https://www.bilietai.lt/lit/renginiai/koncertai/foals-vilnius-308216/?fbclid=IwAR3zSeHvrAFB3dT__eztMcGaGSPHe2YYIF_bbcxKLDCbruQguE9qE75rwYM',8),(8,1,'Original Enigma Voices','Koncertai','2020-11-17','20:00',2,'Vilnius',19,'','https://kakava.lt/renginys/original-enigma-voices/1031',NULL,'Kultinio muzikinio projekto „Enigma“ nariai, susibūrę į projektą „Original Enigma Voices“, grįžta į Lietuvą su nauja programa. Rudenį atlikėjai su grupe ir styginių orkestru surengs tris koncertus: lapkričio 17 d. Vilniuje, lapkričio 18 d. Kaune ir lapkričio 19 d. Palangoje. „Original Enigma Voices“ – tai trys nepakartojami Andru Donalds, Angel X ir Fox Lima balsai, skambėję tokiose grupės „Enigma“ dainose  kaip „Return to Innocence“, „Seven Lives“ ar „MMX Social Song“. Šias ir kitas geriausias projekto „Enigma“ dainas žiūrovai išgirs ir koncertuose mūsų šalyje. „Original Enigma Voices“ nariai žada, kad tai bus nepamirštama kelionė į užburiančių garsų bei vaizdų pasaulį.','https://kakava.lt/renginys/original-enigma-voices/1031',11),(9,1,'Didžioji kalėdinė Kauno mugė','Iniciatyvos','2020-12-12','10:00',5,'Kaunas',1,'+37067042441','https://festivus.lt/renginiai/muges/didzioji-kaledine-kauno-muge','','Kalėdų karavanas gruodį prasuks pro Kauną ir nudžiugins didžiausia šventine muge mieste!','',12),(10,1,'Lenny Kravitz','Koncertai','2020-06-04','20:00',2,'Kaunas',1,'','https://kakava.lt/renginys/lenny-kravitz/1212/2903 ','https://www.facebook.com/events/1368859573293094/ ','Kitų metų birželio 4 d. į Kauno „Žalgirio“ areną atvyksta dainininkas, prodiuseris, dainų autorius, multiinstrumentalistas Lenny Kravitz. Koncertas Lietuvoje įtrauktas į atlikėjo dviejų metų turą „Here to Love“. Keturių „Grammy“ apdovanojimų laimėtojas Lenny Kravitz, derindamas rokenrolą, fanką, bliuzą ir soulą, dar 1989 m. sukūrė savitą muzikinį stilių, kurį išpuoselėjo pernai išleistame jau vienuoliktame studijiniame albume „Raise Vibration“. Jaunatviško polėkio ir trijų dešimtmečių patirtimi praturtintas albumas tarsi atspindi kūrybinį atgimimą – tai drąsus, ryškus ir genialus darbas, atitinkantis atlikėjo beribę dvasią. ',NULL,10),(15,1,'Original Enigma Voices','Koncertai','2020-11-18','20:00',2,'Kaunas',1,'','https://kakava.lt/renginys/original-enigma-voices/1031',NULL,'Kultinio muzikinio projekto „Enigma“ nariai, susibūrę į projektą „Original Enigma Voices“, grįžta į Lietuvą su nauja programa. Rudenį atlikėjai su grupe ir styginių orkestru surengs tris koncertus: lapkričio 17 d. Vilniuje, lapkričio 18 d. Kaune ir lapkričio 19 d. Palangoje. „Original Enigma Voices“ – tai trys nepakartojami Andru Donalds, Angel X ir Fox Lima balsai, skambėję tokiose grupės „Enigma“ dainose  kaip „Return to Innocence“, „Seven Lives“ ar „MMX Social Song“. Šias ir kitas geriausias projekto „Enigma“ dainas žiūrovai išgirs ir koncertuose mūsų šalyje. „Original Enigma Voices“ nariai žada, kad tai bus nepamirštama kelionė į užburiančių garsų bei vaizdų pasaulį.','https://kakava.lt/renginys/original-enigma-voices/1031',11),(24,1,'Woodkid - Vilnius','Koncertai','2020-05-20','20:00',3,'Vilnius',19,'+37068517086',NULL,'https://www.facebook.com/events/686703041859560/','Pagaliau turim retą progą pamatyti Woodkid.Grafikos dizaineris, režisierius, meno vadovas ir dainų kūrėjas viename. Iki šiol Lietuvos taip ir neaplankęs, bet senokai lauktas. Woodkid į Lietuvą atsiveš visą koncertą, naujos muzikos, vizualizacijas ir pribloškiantį šou. Pasirodymas Vilniuje – Woodkid turo dalis. Geros pažinties, tobulo koncerto.','https://www.bilietai.lt/lit/renginiai/koncertai/perkeltas-woodkid-vilnius-303765/?fbclid=IwAR26e8XOkIW_BxPHo-VeFMM82ssjPI2sHCNr3ulQREsi42-0SiyvnzdxJYk',4),(25,1,'Borisas Grebenščikovas ir Аkvarium su nauja programa','Koncertai','2020-05-26','19:00',3,'Vilnius',19,'',NULL,'https://www.facebook.com/events/435894490432329/ ','Gegužės 26-ąją Vilniuje su nauja programa koncertuos Borisas Grebenščikovas ir legendinis „Аkvarium“! Borisas Grebenščikovas – „neritmiškosios šalies rokenrolo pasiuntinys“ (taip kukliai jis pats save apibūdina), pasirodys Lietuvoje! Vienintelis koncertas įvyks gegužės 26-ąją 19 val. Vilniaus „Compensa“ salėje! BG ir pačios publikos pageidavimu, šį kartą parteryje bus stovimos vietos, o sėdimos vietos bus tik balkone! Tik šiame koncerte BG ir jo grupė atliks ypatingą programą, kurioje skambės ir „auksiniai hitai“ ir intriguojančios naujos dainos!','https://www.bilietai.lt/lit/renginiai/koncertai/perkeltas-borisas-grebenscikovas-ir-legendinis-akvarium-302972/?fbclid=IwAR2DJbhaW1ntNjMg1wQ66sd3By9w0DKsmUIENt03r7NRpynpzqE75NsdaEI',9);
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
INSERT INTO `hibernate_sequence` VALUES (189);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (0,'notFound.jpg'),(1,'event_photos/1.jpg'),(2,'place_photos/2.jpg'),(3,'place_photos/3.jpg'),(4,'event_photos/4.jpg'),(5,'event_photos/5.jpg'),(6,'place_photos/6.jpg'),(7,'event_photos/7.jpg'),(8,'event_photos/8.jpg'),(9,'event_photos/9.jpg'),(10,'event_photos/10.jpg'),(11,'event_photos/11.jpg'),(12,'event_photos/12.jpg'),(208,'place_photos/208.jpg'),(209,'place_photos/209.jpg'),(210,'place_photos/210.jpg'),(211,'place_photos/211.jpg'),(212,'place_photos/212.jpg'),(213,'place_photos/213.jpg'),(214,'place_photos/214.jpg'),(215,'place_photos/215.jpg'),(216,'place_photos/216.jpg'),(217,'place_photos/217.jpg'),(218,'place_photos/218.jpg'),(219,'place_photos/219.jpg'),(220,'place_photos/220.jpg'),(221,'place_photos/221.jpg'),(222,'place_photos/222.jpg');
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
  KEY `fk_photo_id_idx` (`fk_photo`),
  KEY `user_id_idx` (`fk_user_id`),
  KEY `place_type_idx` (`fk_place_type`),
  CONSTRAINT `fk_photo_id` FOREIGN KEY (`fk_photo`) REFERENCES `photos` (`id`),
  CONSTRAINT `place_city_name` FOREIGN KEY (`fk_city`) REFERENCES `city` (`name`),
  CONSTRAINT `place_type` FOREIGN KEY (`fk_place_type`) REFERENCES `place_type` (`singular`),
  CONSTRAINT `user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,1,'Žalgirio arena','Kaunas','Karaliaus Mindaugo prospektas 50','+37061598636','Sporto arena','http://www.zalgirioarena.lt/','	https://www.facebook.com/Zalgirioarena','Kauno „Žalgirio“ arena – viena didžiausių arenų Baltijos šalyse. 2008 m. Nemuno saloje iškilmingai įkasta kapsulė, kuri simbolizavo  Kauno sporto arenos statybų pradžią. \"Žalgirio\" arenos projektą parengė architektas Eugenijus Miliūnas.','08:00-18:00',2),(2,1,'Kauno valstybinis muzikinis teatras','Kaunas','Laisvės alėja 91','+37037200633','Teatras','http://www.muzikinisteatras.lt/','https://www.facebook.com/Muzikinis.teatras/','Kauno valstybinis muzikinis teatras vienas didžiausių Lietuvoje. Jis įsikūręs pagal architekto Ustino Golinevičiaus 1891 m. statytame  pastate . Čia  gimė profesionalus  lietuvių teatras. Jau daugelį metų  Muzikinio teatro kolektyvas ištikimai laikosi tradicijų ir kuria visus muzikinės scenos kūrinius.','09:00-17:00',6),(19,1,'„Compensa“ koncertų salė','Vilnius','Adresas: Kernavės g. 84, Vilnius','+37065376746','Koncertų salė','http://www.compensakoncertusale.lt','https://www.facebook.com/compensakoncertusale/','„Compensa“ koncertų salė - tai nauja kultūros ir pramogų vieta sostinėje.','',3),(203,1,'Renginių Oazė','Kaunas','Baltų pr. 16, Kaunas','860966699','Koncertų salė','http://renginiuoaze.lt','https://www.facebook.com/renginiuoaze','Naujasis renginių, koncertų, teatrų centras „Renginių Oazė“ įsikūręs didžiausiame Kauno mikrorajone Šilainiuose, Baltų prospekte esančiame laisvalaikio centre. Naujoji renginių vieta pasižymės ne tik puikia lokacija – į „Renginių Oazės“ salę patogu patekti ne tik kauniečiams – į jį lengvai kelią ras ir aplinkinių miestų, bei Vilniaus gyventojai. Galinga garso ir apšvietimo aparatūra pasižyminti, lengvai transformuojama salė galės vienu metu priimti iki 800 lankytojų. Norintys patogiai stebėti spektaklius ar koncertus galės patogiai įsitaisyti jaukiuose minkštasuoliuose ar prie staliukų parteryje. Iš viso salė turės net 400 sėdimų vietų, ir iš visų jų atsivers puikus matomumas į sceną. Norintys atšvęsti asmenines šventes ar stebėti renginius labiau privačioje erdvėje galės įsikurti 4-iuose VIP apartamentuose, turinčiuose atskiras pobūvių sales su balkonais, iš kurių atsiveria nepakartojamas visos salės vaizdas. Erdvi automobilių parkavimo aikštelė, jaukus boulingo klubas, sporto klubas ir vandens pramogų centras, esantys tame pačiame pastate, netoliese esantys didieji prekybos centrai – visa tai tik papildys tas laisvalaikio valandas, kurias kauniečiai ir miesto svečiai patikės „Renginių Oazei“. „Renginių Oazė“ pasiūlys ne tik populiariausius lietuviškus spektaklius, miuziklus, garsiausius mūsų šalies atlikėjus, bet taip pat sulauks nemažo būrio užsienio žvaigždžių, bei lauks visų įmonių, norinčių sukurti nepamirštamas šventes savo darbuotojams. „Renginių Oazės“ vadyba užsiims, ko gero, seniausiai Lietuvoje veikianti renginių agentūra „Tigris“, jau lygiai du dešimtmečius organizuojanti pačius įsimintiniausius ir populiariausius renginius visoje Lietuvoje ir šiemet švenčianti savo 20 metų jubiliejų. Visa informacija apie naująją renginių salę Kaune – telefonu 8 601 00007 arba 860966699',NULL,208),(204,1,'Vilniaus Kongresų rūmai','Vilnius','Vilniaus g. 6, Vilnius, Vilnius','852618828','Koncertų salė','www.lvso.lt','','Vilniaus Kongresų rūmai - tai Lietuvos valstybinio simfoninio orkestro, kuriam diriguoja Gintaras Rinkevičius, namai. Koncertinėje salėje telpa tūkstantis žiūrovų. Čia nuolat vyksta simfoninės, kamerinės muzikos koncertai, operos spektakliai, pasirodo žymiausi Lietuvos ir pasaulio atlikėjai.',NULL,209),(205,1,'Švyturio arena','Klaipėda','Dubysos g. 10, Klaipėda, Klaipėda','864023858','Sporto arena','www.svyturioarena.lt','https://www.facebook.com/Svyturioarena','Švyturio arena pritaikyta įvairiems koncertams ir renginiams, bei sporto varžyboms. Priklausomai nuo renginio tipo talpina nuo 1800 žmonių iki 7000. Šioje arenoje vyko 2011m. Europos krepšinio čempionatas.',NULL,210),(206,1,'Šv. Kotrynos bažnyčia','Vilnius','Vilniaus g. 30, Vilnius','+37052620421','Istorinis objektas','http://www.kultura.lt/lt/pages/sv_kotrynos_baznycia','https://www.facebook.com/pages/Šv-Kotrynos-bažnyčia/633775869972821','Šv. Kotrynos bažnyčia pastatyta 1625-1743m. Antrojo pasaulinio karo metu bažnyčia stipriai nukentėjo, pavogta daug meno kūrinių. Sovietmečiu bažnyčią valdė Vilniaus dailės muziejus, čia buvo įrengtas sandėlys. 1994 m. pradėti vykdyti bažnyčios atstatymo darbai. 2006 m. bažnyčia po rekonstrukcijos atvėrė duris lankytojams, o pagrindinė erdvė buvo pritaikyta koncertams. Šiuo metu bažnyčioje vyksta įvairūs kultūriniai renginiai, vyksta klasikinės muzikos festivaliai.',NULL,211),(207,1,'Panevėžio bendruomenių rūmai','Panevėžys','Kranto g. 28, LT-35172 Panevėžys, Panevėžys','845581373','Koncertų salė','http://www.pankultura.lt/','https://www.facebook.com/bendruomeniurumai','Kultūros centras Panevėžio bendruomenių rūmai – vienas didžiausių daugiafunkcių kultūros centrų Lietuvoje. Visa Rūmų veikla orientuota į miesto gyventojų kultūrinių poreikių tenkinimą. Čia organizuojami renginiai jaunimui ir senjorams, šeimoms ir kolektyvams.',NULL,212),(208,1,'Kauno sporto halė','Kaunas','Perkūno alėja 5, Kaunas','+37037200514','Sporto arena','http://www.sportohale.lt/','','Kauno sporto halė pastatyta 1939 m. Šiam projektui įgyvendinti prireikė vos pusmečio – tiek laiko realiai užtruko statybos. Kauno sporto halė buvo pirmoji arena Europoje, skirta specialiai krepšiniui. Vėliau joje pradėtos rengti ir vyksta iki šiol įvairių sporto šakų - krepšinio, tinklinio, rankinio, bokso varžybos. Čia rengiamos ir tarptautinės sportinių šokių varžybos „Gintarinė pora“, muzikiniai koncertai, moksleivių varžybos, parodos, cirko pasirodymai, susitikimai su garsiais žmonėmis, bei įvairių organizacijų susibūrimai, suvažiavimai. Kasmet sporto halėje vyksta apie 100 įvairaus pobūdžio renginių. Kiekviename iš jų apsilanko per 3000 žiūrovų. Čia yra įrengta apie 3,5 tūkst. Sėdimų vietų. 2007 m. Kauno sporto halė įrašyta į LR Nekilnojamųjų kultūros vertybių registrą.',NULL,213),(209,1,'Vingio parkas','Vilnius','M. K. Čiurlionio g. 100, Vilnius, Vilnius','852611037','Lauko erdvė','http://www.vilniausparkai.lt/','https://www.facebook.com/Vingio.parkas','Neries vingyje esantis „Vingio parkas“ jau seniai traukia įvairius renginius. Čia esanti estrada yra mačiusi tiek pasaulinio garso, tiek Lietuvos atlikėjus. Parke gamtos apsuptyje malonu atsipalaiduoti ir pasinerti į muziką arba pasilinksminti su draugais. Dienos metu čia dažnai renkasi tiek jauni, tiek vyresni tiesiog pailsėti ir pasėdėti ant žolės.',NULL,214),(210,1,'VDU didžioji salė','Kaunas','Daukanto g. 28, Kaunas','861615786','Koncertų salė','http://www.vdu.lt/lt/laisvalaikis/meno-erdves-ir-muziejai/vdu-didzioji-sale/','','Vytauto Didžiojo universiteto didžioji salė itin svarbi Kauno kultūrinė erdvė. Joje vyksta didžiausi miesto renginiai – festivalis „Kaunas jazz“ , Modernaus šokio festivalis, rengiami koncertai, spektakliai, susitikimai su garsiais žmonėmis, ir žinoma, svarbiausios akademinės bendruomenės šventės- mokslo metų pradžia ar diplomų įteikimas. Pačiame miesto centre, Laisvės alėjos pašonėje esanti Vytauto didžiojo universiteto didžioji salė talpina apie 700 žiūrovų. Skaičiuojama, kad kasmet šioje vietoje įvyksta daugiau kaip šimtas įvairių renginių. 2013 m. salė rekonstruota.  ',NULL,215),(211,1,'Girstučio rūmai','Kaunas','Kovo 11-osios g. 26, Kaunas','837454480','Teatras','http://girstutis.lt/','','„Girstučio“ rūmai - tai profesionaliajam teatrui suprojektuotas statinys: 569 vietų žiūrovų salė, 500 kv.m. scena, grimų patalpos, moderni garso ir apšvietimo įranga. Rūmuose veikia viešoji įstaiga „Girstučio“ kultūros ir sporto centras.',NULL,216),(212,1,'Siemens arena','Vilnius','Ozo g. 14, Vilnius','852477576','Sporto arena','http://www.siemens-arena.com/lt','','Siemens arena per krepšinio rungtynes talpina iki 10 tūkst. žiūrovų, į koncertą telpa 12500. Arena duris atvėrė 2004m. spalio 30d.',NULL,217),(213,1,'GARGARAS - naktinis klubas','Kaunas','Raudondvario plentas 101, Kaunas','+37065200370','Naktinis klubas','https://www.facebook.com/GargarasLoft/','','Industrinėse \"Vilko\" fabriko erdvėse loftu virtęs \"Gargaras\" - tai vieta koncertams, DJ pasirodymams, kultūrai, menui, kitiems nevienalyčiams įvykiams bei kažko daugiau šiandienos skaitmeninėje visuomenėje ieškantiems žmonėms.  Klube vyksta įvairūs kultūriniais ir klubinės muzikos renginiai.  ',NULL,218),(214,1,'Vasaros terasa','Vilnius','Vilniaus g. 39, Vilnius, Vilnius','+37062085690','Restoranas','http://www.vasarosterasa.lt/','https://www.facebook.com/v.terasa','„Vasaros terasa“ tai vieta, kurioje susitinka draugai ir gerai leidžia laiką smagioje kompanijoje po atviru dangumi. Nors ji dirba tik vasarą, kaip sufleruoja pavadinimas, tačiau tada veiksmo čia tikrai netrūksta. Jau aštuntąjį sezoną atidariusi, „Vasaros terasa“ ir toliau neleidžia nurimti, tiek atlikėjai tiek lankytojai apie šią vietą atsiliepia šiltai ir sako norintys dar kartą čia sugrįžti. Tad nelaukite ir keliaukite į Vilniaus centrą su draugais, terasa laukia Jūsų.',NULL,219),(215,1,'Raudondvario dvaras','Kaunas','Pilies takas 1, Raudondvaris, Kauno rajonas, Kaunas','837548254','Istorinis objektas','www.raudondvariodvaras.lt','www.facebook.com/Raudondvario-Dvaras-406356872722520/','Kauno rajone įsikūręs, dar XVI a. pab. menantis Raudondvario dvaro architektūrinis ansamblis – vienas įspūdingiausių atgimusių renesanso architektūros paminklų Lietuvoje. Kadaise iškilių Lietuvos didikų Radvilų, Zabielų ir Tiškevičių valdytame dvare šiandien ir vėl pulsuoja gyvybė. Nevėžio dešiniojo kranto aukštutinėje terasoje stūksantis Raudondvario dvaras svečius pasitinka atsinaujinusiais, turizmo ir visuomenės poreikiams kompleksiškai pritaikytais pastatais, sutvarkytu parku, įspūdingais renginiais. Pagrindinė dvaro komplekso puošmena – XVII a. antroje pusėje iškilusi pilis su bokštu. Ji kartu su kitais XIX a. pastatais – dviem oficinomis, oranžerija, arklidėmis ir ledaine, išsidėsčiusiais 3,8 ha ploto teritorijoje – sudaro vertingą ir originalų Raudondvario dvaro architektūrinį ansamblį. Valdant grafams Tiškevičiams aukštosios kultūros ir meno centru tapusiame dvare ir šiandien puoselėjama kultūra. Pilyje įsikūręs Kauno rajono muziejus, rengiamos pripažintų menininkų parodos, edukacijos. Buvusiame dvaro žirgyne veikia moderni kūrybinė erdvė – Menų inkubatorius, kuriame įrengta mobili teatro ir koncertų salė, meno ir fotografijos galerija, jaunųjų menininkų rezidencijos. Dvaro ledainėje lankytojus pasitinka Kauno rajono turizmo ir verslo informacijos centras, o oranžerijoje pasimėgauti rafinuota aplinka kviečia restoranas. Pastaraisiais metais Raudondvario dvaro ansamblis tapo tikru kultūrinio turizmo traukos centru. Dvarą pamėgo vietos ir užsienio turistai, čia vyksta iškilmingi diplomatų ir užsienio delegacijų priėmimai, santuokų ceremonijos, menininkų plenerai, parodos, koncertai, bendruomenę buriančios šventės. Raudondvario dvare kasmet įspūdingai minima Valstybės diena, rengiamas tarptautinis žemės meno festivalis „Land Art“, kiekvieną rudenį šurmuliuoja derliaus šventė „Rudens sambariai“, o žiemos švenčių metu spindi pagrindinė Kauno rajono Kalėdų eglė. Atgimęs Raudondvario dvaro architektūrinis ansamblis – vieta, kurioje turtinga istorija persipina su dabartimi, kviesdama lankytojus pasinerti į įspūdžių ir naujų patyrimų kupiną kultūrinę kelionę laiku.',NULL,220),(216,1,'VDU Botanikos sodas','Kaunas','Ž. E. Žilibero g. 6, Kaunas','+37037390033','Lauko erdvė','www.botanika.vdu.lt','www.facebook.com/VDUBotanikosSodasKaune/','Aleksoto žalumoje paskendęs VDU Botanikos sodas jau daugiau kaip 90 metų kviečia į gausias augalų kolekcijas, didžiausią Lietuvoje oranžeriją ir rožyną, į tradicines šventes, parodas, muges, spektaklius ir koncertus. 1923 m. įkurtam Botanikos sodui ypatingą aurą suteikia legendomis apipinto dvarininko Jozefo Godlevskio Aukštosios Fredos dvaras ir tarpukario Lietuvą menanti oranžerija. Joje auga Oginskių dvarą puošęs daugiau kaip 120 metų amžiaus valgomasis kiaušvis, noksta papajos ir bananai, su istorija ir simbolika supažindina bibliniai augalai. Parko rožyne – daugiau kaip 1 000 veislių, tarp kurių ypač vertinamos senosios, dvarų kultūrą atspindinčios rožės. Lankytojus vilioja atstatyta romantiškoji medinė pergolė. Augalų ekspozicijos ir brandus parkas su įdomia, pagal buvusio dvaro šeimininko inicialus J ir G suformuota tvenkinių sistema, skleidžiasi ne tik kaip vieta moksliniams tyrimams. Tai tapo unikalia erdve edukacinėms, kultūrinėms veikloms: nuo spalvingo „Augalų žavadienio“, paslaptingos „Kvapų nakties“ iki „Moliūgų šventės“ ir tropinių drugelių parodos. ',NULL,221),(217,1,'Klaipėdos koncertų salė','Klaipėda','Šaulių g. 36, Klaipėda, Klaipėda','846410566','Koncertų salė','http://www.koncertusale.lt','https://www.facebook.com/pages/Koncertų-salė/110267739002318','Įvairūs koncertai, spektakliai ar vaidinimai pradžiugina daugelio širdis, kurie ieško tokio tipo laisvalaikio praleidimo. Nuolatos atnaujinamas repertuaras leis surasti kiekvieno norima vaidinimą ar koncertą. Koncertų salėje įrengta 600 invidualių sėdimų vietų žiūrovams. Pastato bendras plotas apie 3000kv./m. , todėl pastate įrengta speciali akustinė sistema, garso ir šviesų technika, kuri skirta pirmiausia klasikinės muzikos koncertams.',NULL,222);
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
  `singular` varchar(45) COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`singular`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_type`
--

LOCK TABLES `place_type` WRITE;
/*!40000 ALTER TABLE `place_type` DISABLE KEYS */;
INSERT INTO `place_type` VALUES ('Barai','Baras'),('Bibliotekos','Biblioteka'),('Boulingas','Boulingas'),('Istoriniai objektai','Istorinis objektas'),('Kavinės','Kavinė'),('Kinas','Kinas'),('Kino teatrai','Kino teatras'),('Koncertų salės','Koncertų salė'),('Konferencijų salės','Konferencijų salė'),('Lankytinos vietos','Lankytina vieta'),('Lauko erdvės','Lauko erdvė'),('Medicinos įstaigos','Medicinos įstaiga'),('Meno erdvės','Meno erdvė'),('Mokslo įstaigos','Mokslo įstaiga'),('Muziejai','Muziejus'),('Naktiniai barai','Naktinis baras'),('Naktiniai klubai','Naktinis klubas'),('Pramogų parkai','Pramogų parkas'),('Prekybos vietos','Prekybos vieta'),('Religinės įstaigos','Religinės įstaiga'),('Restoranai','Restoranas'),('Saviugdos centrai','Saviugdos centras'),('Spa centrai','Spa centras'),('Sporto arenos','Sporto arena'),('Sporto centrai','Sporto centras'),('Šokių studijos','Šokių studija'),('Teatrai','Teatras'),('Valstybinės įstaigos','Valstybinė įstaiga'),('Viešbučiai','Viešbutis'),('Vietovės','Vietovė');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;
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

-- Dump completed on 2020-05-22 19:05:01
