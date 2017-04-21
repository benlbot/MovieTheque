-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: seminaireweb
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `idmovies` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `abstract` longtext,
  `country` varchar(100) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `filmRuntime` double DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `producedBy` varchar(100) DEFAULT NULL,
  `starring` varchar(100) DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `idAllocine` int(6) DEFAULT NULL,
  `sortie` int(4) DEFAULT NULL,
  `idVoAllocine` int(8) DEFAULT NULL,
  PRIMARY KEY (`idmovies`),
  UNIQUE KEY `idmovies_UNIQUE` (`idmovies`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (6,'Iron Man 3','Iron Man 3 est un film de super-héros américano-chinois coécrit et réalisé par Shane Black, sorti en 2013.','Chine, États-Unis','Shane_Black',7800,'Film_de_super-héros','DMG_Entertainment, Marvel_Studios','Ben_Kingsley, Don_Cheadle, Guy_Pearce, Gwyneth_Paltrow, Robert_Downey_Jr.','http://commons.wikimedia.org/wiki/Special:FilePath/Iron_Man_3_logo.jpg?width=300',139589,2013,19484270),(8,'Braquage à l\'italienne','Braquage à l\'italienne ou Un boulot à l\'italienne au Québec (The Italian Job) est un film américain de F. Gary Gray sorti en 2003.Ce film est un remake assez libre de L\'or se barre (The Italian Job) de Peter Collinson sorti en 1969.',NULL,'F._Gary_Gray',6660,'Film_d\'action, Thriller_(genre)','Paramount_Pictures','Charlize_Theron, Donald_Sutherland, Franky_G., Jason_Statham, Mark_Wahlberg','http://fr.web.img6.acsta.net/c_215_290/medias/nmedia/18/35/10/32/affiche2.jpg',45049,2003,18354191),(9,'Les Gardiens de la Galaxie','Les Gardiens de la galaxie (Guardians of the Galaxy) est un film de super-héros américain réalisé par James Gunn, sorti en 2014. Ce film, adapté de la série de comic books du même nom, est la dixième étape de l\'univers cinématographique Marvel inauguré en 2008 avec Iron Man de Jon Favreau. Il s\'agit aussi du premier film de cet univers qui ne soit pas centré sur un membre des Avengers.',NULL,'James_Gunn',7260,'Film_de_super-héros','Marvel_Studios','Bradley_Cooper, Chris_Pratt, Dave_Bautista, Vin_Diesel, Zoe_Saldana','/public/images/pic1.jpg',196604,2014,19546177),(10,'Avengers','Avengers ou Les Avengers: Le film au Québec et au Nouveau-Brunswick (Marvel\'s The Avengers) est un film de super-héros américain réalisé par Joss Whedon, sorti en 2012. Il se base sur l\'équipe de super-héros du même nom (Les Vengeurs en français) apparaissant dans le comic book publié par Marvel Comics et constitue le sixième film de l\'univers cinématographique Marvel. Il possède une distribution incluant Robert Downey Jr., Chris Evans, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Mark Ruffalo, Tom Hiddleston, Clark Gregg, Cobie Smulders, Stellan Skarsgård et Samuel L. Jackson. Dans Avengers, Nick Fury, le directeur du SHIELD, une organisation chargée de maintenir la paix dans le monde, recrute Iron Man, Captain America, Hulk, Œil-de-faucon, la Veuve noire et Thor afin de former une équipe devant empêcher le frère adoptif de Thor, Loki, d\'envahir la Terre.Le film reçoit des critiques positives de la plupart des critiques de cinéma et établit plusieurs records au box-office américain, parmi lesquels le meilleur premier weekend d\'exploitation en Amérique du Nord. Le film est également le plus rapide à atteindre la somme de 1 milliard de dollars et constitue aujourd\'hui le troisième film ayant réalisé le plus de recettes. Le film sort en Blu-ray, Blu-ray 3D et en DVD le 29 août en France et le 25 septembre aux États-Unis.Sa suite, Avengers : L\'Ère d\'Ultron, sortira en 2015, toujours réalisée par Joss Whedon. Ce second film sera ensuite suivi par deux autres, intitulées Avengers: Infinity War - Part 1 et Avengers: Infinity War - Part 2, et prévues pour le 4 mai 2018 et le 3 mai 2019. Anthony et Joe Russo, réalisateurs de Captain America : Le Soldat de l\'hiver et Captain America: Civil War, succèderont à Joss Whedon à la mise en scène.',NULL,'Joss_Whedon',8520,'Film_de_super-héros','Marvel_Studios','Chris_Evans, Chris_Hemsworth, Jeremy_Renner, Mark_Ruffalo, Robert_Downey_Jr., Scarlett_Johansson','http://commons.wikimedia.org/wiki/Special:FilePath/Marvel\'s_The_Avengers_logo.svg?width=300',130440,2012,19314006),(11,'Ant-Man','Ant-Man est un film de super-héros américain réalisé par Peyton Reed, dont la sortie est prévue en 2015. Produit par Marvel Studios et distribué par Walt Disney Studios Distribution, il est basé sur le héros, ami des fourmis, Ant-Man. C\'est le douzième film de l\'univers cinématographique Marvel.',NULL,'Peyton_Reed',8520,'Film_de_super-héros','Marvel_Studios','Corey_Stoll, Evangeline_Lilly, Michael_Douglas, Paul_Rudd','https://upload.wikimedia.org/wikipedia/fr/f/f0/Ant-Man_logo.jpg',130438,2015,19552728);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-23 16:02:26
