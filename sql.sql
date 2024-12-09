CREATE TABLE IF NOT EXISTS `saved_locations` (
  `locationid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) DEFAULT NULL,
  `locationdata` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`locationid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
