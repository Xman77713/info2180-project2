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