DROP DATABASE IF EXISTS dolphin_crm;
CREATE DATABASE dolphin_crm;
USE dolphin_crm;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `id` INT(11) NOT NULL auto_increment,
  `firstname` VARCHAR(50) NOT NULL default '',
  `lastname` VARCHAR(50) NOT NULL default '',
  `password` VARCHAR(50) NOT NULL default '',
  `email` VARCHAR(50) NOT NULL default '',
  `role` VARCHAR(50) NOT NULL default '',
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Users` WRITE;
INSERT INTO `Users` VALUES (1, 'Pierre', 'Mannix', 'password123', 'admin@project2.com', 'Admin', '2022-11-26 21:40:00');
INSERT INTO `Users` VALUES (2, 'Jonathan', 'Astwood', 'MadSick20', 'admin2@project2.com', 'Admin', '2022-12-01 21:40:00');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Contacts`;
CREATE TABLE `Contacts` (
  `id` INT(11) NOT NULL auto_increment,
  `title` VARCHAR(50) NOT NULL default '',
  `firstname` VARCHAR(50) NOT NULL default '',
  `lastname` VARCHAR(50) NOT NULL default '',
  `email` VARCHAR(50) NOT NULL default '',
  `telephone` VARCHAR(50) NOT NULL default '',
  `company` VARCHAR(50) NOT NULL default '',
  `contact_type` VARCHAR(50) NOT NULL default '',
  `assigned_to` INT NOT NULL,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (`assigned_to`) REFERENCES `Users`(`id`),
  FOREIGN KEY (`created_by`) REFERENCES `Users`(`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Contacts` WRITE;
INSERT INTO `Contacts` VALUES(1, 'Mr.', 'Goofy', 'Lookin', 'goofylookin@project2.com', '722-1234','Uwi Patty Co.', 'SALES LEAD', 2,2, '2022-12-03 14:13:00','2022-12-03 14:13:00');
INSERT INTO `Contacts` VALUES(2, 'Dr.', 'Bob', 'Farley', 'jahbob@project2.com', '722-4321','The Lord Inc.', 'SALES LEAD', 2,2, '2022-12-03 14:13:00','2022-12-03 14:13:00');
INSERT INTO `Contacts` VALUES(3, 'Ms.', 'Justine', 'Beaver', 'b4justine@project2.com', '1-800-1234','Uwi Patty Co.', 'SALES LEAD', 2,2, '2022-12-03 14:13:00','2022-12-03 14:13:00');
INSERT INTO `Contacts` VALUES(4, 'Prof.', 'Krah', 'Khead', 'seekhelp@project2.com', '1-800-4321','Uwi Patty Co.', 'SALES LEAD', 2,2, '2022-12-03 14:13:00','2022-12-03 14:13:00');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Notes`;
CREATE TABLE `Notes` (
  `id` INT(11) NOT NULL auto_increment,
  `contact_id` INT NOT NULL,
  `note_comment` TEXT NOT NULL,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (`contact_id`) REFERENCES `Contacts`(`id`),
  FOREIGN KEY (`created_by`) REFERENCES `Users`(`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

GRANT ALL PRIVILEGES ON dolphin_crm.* TO 'project2_user'@'localhost' IDENTIFIED BY 'password123';