CREATE DATABASE  IF NOT EXISTS liangma;/*判断并创建数据库*/
USE liangma;/*使用数据库*/
set FOREIGN_KEY_CHECKS = 0; 
DROP TABLE IF EXISTS `vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birth` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `createTime` varchar(30) NOT NULL,
  `updateTime` varchar(30) NOT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumeTime` varchar(10) NOT NULL,
  `consumerNum` int(11) NOT NULL,
  `dinnerType` int(1) NOT NULL,
  `createTime` varchar(30) NOT NULL,
  `updateTime` varchar(30) NOT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  `vipId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_account_vip` (`vipId`),
  CONSTRAINT `FK_account_role` FOREIGN KEY (`vipId`) REFERENCES `vip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
set FOREIGN_KEY_CHECKS = 1; 