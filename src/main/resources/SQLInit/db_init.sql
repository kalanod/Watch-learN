CREATE USER IF NOT EXISTS 'dbcontroller'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'dbcontroller'@'localhost' WITH GRANT OPTION;

DROP DATABASE IF EXISTS `watchlearn`;

CREATE DATABASE `watchlearn`;
USE watchlearn;

CREATE TABLE `users`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `isAuthorized` bit(1)  NOT NULL DEFAULT 0,
    `name`         varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `email`        varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `password`     varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `completed`     varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    PRIMARY KEY (`id`)
);

CREATE TABLE `films`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `title`        varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `icnSrc`       varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `genre`        varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `season`       int(11) NOT NULL,
    `episode`      int(11) NOT NULL,
    `episodeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `isWatched`    int(11) NOT NULL DEFAULT 0,
    `filmUrl`      varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    PRIMARY KEY (`id`)
);

CREATE TABLE `tasks`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `title`   varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `answers` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `correct` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
    `film_id` int(11) NOT NULL,
    `start_pos` int(11) NOT NULL,
    PRIMARY KEY (`id`)
);

insert into films (title, icnSrc, genre, season, episode, episodeTitle, isWatched, filmUrl)
values ('BokuNoPico', 'https://cdn.myanimelist.net/images/anime/12/39497.jpg', 'what', 1, 1, 'ohaio', 0, 'a_film_1_1_aaaaa.mp4');
insert into films (title, icnSrc, genre, season, episode, episodeTitle, isWatched, filmUrl)
values ('BokuNoPico', 'https://cdn.myanimelist.net/images/anime/12/39497.jpg', 'what', 1, 2, 'nigga', 0, 'a_film_1_1_aaaaa.mp4');
insert into films (title, icnSrc, genre, season, episode, episodeTitle, isWatched, filmUrl)
values ('BokuNoPico', 'https://cdn.myanimelist.net/images/anime/12/39497.jpg', 'what', 1, 3, 'End of Evangelion', 0,
        'penta.webm');

SELECT *
FROM films
WHERE id = 2;