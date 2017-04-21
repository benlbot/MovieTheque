/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 5.7.17-log : Database - movietheque
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movietheque` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `movietheque`;

/*Table structure for table `movies` */

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `idmovies` int(10) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `abstract` longtext,
  `country` varchar(100) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `filmRuntime` varchar(10) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `producedBy` varchar(100) DEFAULT NULL,
  `starring` varchar(100) DEFAULT NULL,
  `thumbnail` longtext,
  `idAllocine` varchar(10) DEFAULT NULL,
  `sortie` varchar(20) DEFAULT NULL,
  `idVoAllocine` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idmovies`),
  UNIQUE KEY `idmovies_UNIQUE` (`idmovies`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
