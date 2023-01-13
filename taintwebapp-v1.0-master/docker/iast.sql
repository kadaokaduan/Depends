/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : paydemo

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

*/

# Host: localhost  (Version: 5.7.26)
# Date: 2021-10-13 16:38:54
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "account"
#

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "account"
#

INSERT INTO `account` VALUES (1,NULL,'-10000.0','200.0');

#
# Structure for table "ay_user"
#

DROP TABLE IF EXISTS `ay_user`;
CREATE TABLE `ay_user` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT 'sysname',
  `password` varchar(40) NOT NULL DEFAULT 'abd@123',
  `rank` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "ay_user"
#

/*!40000 ALTER TABLE `ay_user` DISABLE KEYS */;
INSERT INTO `ay_user` VALUES (1,'amdin','abd@123',0,0),(2,'Iron Man','123456',2,4),(3,'captial','123qwe',1,2),(4,'eagle eye','1qaz2wsx',1,3);
/*!40000 ALTER TABLE `ay_user` ENABLE KEYS */;

#
# Structure for table "gdpr"
#

DROP TABLE IF EXISTS `gdpr`;
CREATE TABLE `gdpr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idcard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bankcard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "gdpr"
#

INSERT INTO `gdpr` VALUES (1,'chen','621225198610062040',NULL,NULL);

#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "student"
#

INSERT INTO `student` VALUES (1,'chen',15,0,10086),(2,'zhang',19,1,1001234),(3,'apple',16,1,1111),(4,'1231',1,1,97645),(5,'more',20,1,198765);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT 'Lihua',
  `age` int(2) NOT NULL DEFAULT '18',
  `sex` char(4) NOT NULL DEFAULT '女',
  `love` varchar(255) NOT NULL DEFAULT 'food',
  `skill` varchar(255) NOT NULL DEFAULT 'food',
  `major` varchar(255) NOT NULL DEFAULT 'food',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Lihua',18,'女','food','food','food'),(2,'daming',18,'男','eat','tell a joke','english'),(3,'xiaohong',20,'女','football','read','math'),(4,'wangwei',24,'男','basketball','game','computer');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

