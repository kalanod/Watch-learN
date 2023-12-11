CREATE USER IF NOT EXISTS 'dbcontroller'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'dbcontroller'@'localhost' WITH GRANT OPTION;

DROP DATABASE IF EXISTS `watchlearn`;

CREATE DATABASE `watchlearn`;
USE watchlearn;

CREATE TABLE `users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `isAuthorized` bit(1) NOT NULL DEFAULT 0,
    `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    PRIMARY KEY (`id`)
    );

CREATE TABLE `films` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `icnSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `genre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `season` int(11) NOT NULL,
    `episode` int(11) NOT NULL,
    PRIMARY KEY (`id`)
    );