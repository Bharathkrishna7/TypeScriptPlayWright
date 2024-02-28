/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 5.5.29 : Database - cloud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cloud` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cloud`;

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cloud` */

insert  into `cloud`(`username`,`password`) values 
('cloud','cloud');

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mob` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert  into `owner`(`name`,`username`,`password`,`mob`) values 
('Krishna','hk.1000projects@gmail.com','1234','7978418005');

/*Table structure for table `tpa` */

DROP TABLE IF EXISTS `tpa`;

CREATE TABLE `tpa` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tpa` */

insert  into `tpa`(`username`,`password`) values 
('tpa','tpa');

/*Table structure for table `upload` */

DROP TABLE IF EXISTS `upload`;

CREATE TABLE `upload` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `ownername` varchar(100) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filedata` text,
  `hkey` int(100) DEFAULT NULL,
  `skey` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `upload` */

insert  into `upload`(`id`,`ownername`,`owner`,`filename`,`filedata`,`hkey`,`skey`,`status`) values 
(10,'hk.1000projects@gmail.com','Krishna','a','IOELDPqqs6hgTsPHM1DuoQ==',992152649,'/CAdWzkkOS8bo6/ZKMwfmQ==','Verified');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mob` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`name`,`username`,`password`,`mob`) values 
('Shiva','shiva.1000projects@gmail.com','1234','8541236541');

/*Table structure for table `userrequests` */

DROP TABLE IF EXISTS `userrequests`;

CREATE TABLE `userrequests` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `owner` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `requestby` varchar(100) DEFAULT NULL,
  `skey` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `userrequests` */

insert  into `userrequests`(`id`,`owner`,`filename`,`requestby`,`skey`,`status`) values 
(10,'Krishna','a','shiva.1000projects@gmail.com','/CAdWzkkOS8bo6/ZKMwfmQ==','Key_Sent');

/*Table structure for table `verify` */

DROP TABLE IF EXISTS `verify`;

CREATE TABLE `verify` (
  `id` varchar(100) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `filedata` text,
  `hkey` int(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `verify` */

insert  into `verify`(`id`,`owner`,`filename`,`filedata`,`hkey`,`status`) values 
('10','hk.1000projects@gmail.com','a','IOELDPqqs6hgTsPHM1DuoQ==',992152649,'Verified');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
