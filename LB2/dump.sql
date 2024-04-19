SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

DROP DATABASE IF EXISTS freifaecher;

CREATE DATABASE freifaecher;

use freifaecher;

DROP TABLE IF EXISTS `tbl_freifach`;

CREATE TABLE `tbl_freifach` (
    `ID_Freifach` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Freifach` varchar(30) DEFAULT NULL,
    `FK_FF_LehrerIn` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_general_ci;

INSERT INTO
    `tbl_freifach`
VALUES
    (1, 'Tanz', 6),
    (2, 'Chor', 4),
    (3, 'Elektronik', 2),
    (4, 'Mathe', 1),
    (5, 'Politik', 5),
    (6, 'Rhythmik', 8);

DROP TABLE IF EXISTS `tbl_klasse`;

CREATE TABLE `tbl_klasse` (
    `ID_Klasse` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Klasse` varchar(30) NOT NULL,
    `FK_KlassenLehrerIn` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_general_ci;

INSERT INTO
    `tbl_klasse`
VALUES
    (1, '11a', 1),
    (2, '12a', 2),
    (3, '11b', 4),
    (4, '12c', 5),
    (5, '13a', 6),
    (7, '11c', 8),
    (8, '13b', 9),
    (9, '13c', 11),
    (10, '10a', 12),
    (11, '10b', 13),
    (12, '10c', 14);

DROP TABLE IF EXISTS `tbl_lehrerin`;

CREATE TABLE `tbl_lehrerin` (
    `ID_LehrerIn` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Vorname` varchar(30) DEFAULT NULL,
    `Nachname` varchar(30) DEFAULT NULL,
    `Pensum` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_general_ci;

INSERT INTO
    `tbl_lehrerin`
VALUES
    (1, 'Theo', 'Lempel', 100),
    (2, 'Guido', 'Breier', 80),
    (4, 'Inge', 'Sommer', 75),
    (5, 'Franz', 'Klausen', 100),
    (6, 'Horst', 'Klee', 100),
    (7, 'Donald', 'Trampel', 80),
    (8, 'Sonja', 'Rohner', 80),
    (9, 'Roderich', 'Dierolf', 40),
    (10, 'Catherina', 'Göbbels', 100),
    (11, 'Sylvius', 'Hendel', 100),
    (12, 'Bernhild', 'Limbach', 60),
    (13, 'Ingowart', 'Sörensen', 80),
    (14, 'Matti', 'Schmalenbach', 100),
    (15, 'Arwed', 'Rathje', 75),
    (16, 'Rütger', 'Brendel', 10),
    (17, 'Sighelm', 'Heindl', 80),
    (18, 'Theophil', 'Faber', 100),
    (19, 'Iris', 'Liesenfeld', 100),
    (20, 'Iselore', 'Busch', 80),
    (21, 'Rezzo', 'Hübener', 75),
    (22, 'Wilfried', 'Wilmes', 100),
    (23, 'Brunhild', 'Pelzer', 80),
    (24, 'Bardo', 'Settele', 100),
    (25, 'Tassilo', 'Wohlfarth', 100),
    (26, 'Eugen', 'Herrera', 80),
    (27, 'Rilana', 'Quiring', 75),
    (28, 'Anton', 'Serjie', 50);

DROP TABLE IF EXISTS `tbl_schülerin`;

CREATE TABLE `tbl_schülerin` (
    `ID_SchülerIn` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Vorname` varchar(30) DEFAULT NULL,
    `Nachname` varchar(30) DEFAULT NULL,
    `FK_Klasse` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_general_ci;

INSERT INTO
    `tbl_schülerin`
VALUES
    (1, 'Ulla', 'Jürgens', 1),
    (2, 'Harry', 'Schmidt', 2),
    (3, 'Sepp', 'Jäger', 1),
    (4, 'Evan', 'Olsen', 3),
    (5, 'Tom', 'Jürgens', 2),
    (6, 'Justus', 'Hasler', 3),
    (7, 'Igor', 'Kustov', 4),
    (9, 'Jochen', 'Brunke', 9),
    (10, 'Jason', 'Moldenhauer', 9),
    (11, 'Manfred', 'Wallace', 5),
    (12, 'Ishild', 'Prüfer', 5),
    (13, 'Adelheid', 'Kämpfe', 11),
    (14, 'Doris', 'Heidmann', 10),
    (15, 'Evi', 'Ambros', 11),
    (16, 'Wieland', 'Kemper', 11),
    (17, 'Bernhart', 'Starck', 5),
    (18, 'Annetraude', 'Kunisch', 9),
    (19, 'Borromäus', 'McCarthy', 2),
    (20, 'Erfried', 'Zimpel', 3),
    (21, 'Wieland', 'Leukel', 1),
    (22, 'Denise', 'Bludau', 2),
    (23, 'Marcel', 'Sämann', 3),
    (24, 'Gerold', 'Eckerle', 2),
    (25, 'Bartold', 'Winkels', 8),
    (26, 'Valentina', 'Garbers', 4),
    (27, 'Nicola', 'Stamer', 7),
    (28, 'Sigbert', 'Völler', 4),
    (29, 'Neidhardt', 'Hegele', 11),
    (30, 'Lisanne', 'Hohenberger', 3),
    (31, 'Gottwalt', 'Katzer', 7),
    (32, 'Tillmann', 'Seifert', 7),
    (33, 'Elsgard', 'Radermacher', 11),
    (34, 'Jana', 'Knopp', 2),
    (35, 'Wladislaus', 'Henzler', 3),
    (36, 'Trauhard', 'Beer', 12),
    (37, 'Ulfrida', 'Oberhauser', 11),
    (38, 'Otthein', 'Kolle', 7),
    (39, 'Notker', 'Klüber', 11),
    (41, 'Joachim', 'Tölke', 7),
    (42, 'Stephanie', 'Hentrich', 9),
    (43, 'Augusta', 'Gerstner', 12),
    (44, 'Nic', 'Schrödter', 2),
    (46, 'Ingelene', 'Schwarzer', 8),
    (47, 'Claudia', 'Weigel', 8),
    (49, 'Kira', 'Störmer', 10),
    (50, 'Nathalie', 'Schneller', 9),
    (51, 'Urta', 'Rippel', 4),
    (52, 'Karlgünter', 'Münz', 7),
    (53, 'Rüdiger', 'Stoffers', 8),
    (54, 'Töns', 'Rother', 8),
    (55, 'Herwig', 'Nürnberg', 12),
    (56, 'Bärbl', 'Zielonka', 8),
    (57, 'Walburg', 'Knabe', 10),
    (58, 'Maike', 'Friedlein', 4),
    (59, 'Dietmund', 'Löhner', 9),
    (60, 'Wichard', 'Paschek', 12),
    (61, 'Fee', 'Pischel', 7),
    (62, 'Liselore', 'Dörfel', 12),
    (63, 'Beat', 'Steinhagen', 11),
    (64, 'Aloysia', 'Kaatz', 11),
    (65, 'Humbert', 'Münnich', 10),
    (66, 'Hardy', 'Brüstle', 11),
    (67, 'Elgine', 'Ulferts', 10),
    (68, 'Gottfriede', 'Dangel', 2),
    (69, 'Bodmar', 'Brosig', 2),
    (70, 'Annekatrin', 'Strobl', 2),
    (71, 'Ernst', 'Saalfeld', 8),
    (72, 'Bernulf', 'Dorn', 4),
    (73, 'Madita', 'Heindl', 12),
    (74, 'Friedmuth', 'Goldstein', 3),
    (75, 'Hilgrun', 'Isenberg', 5),
    (76, 'Trautlind', 'Farr', 12),
    (77, 'Wolf', 'Haug', 4),
    (79, 'Annegreth', 'Petry', 1),
    (80, 'Erika', 'Holl', 8),
    (81, 'Tilmann', 'Zucker', 3),
    (82, 'Tell', 'Ehm', 12),
    (83, 'Herold', 'Pfahl', 9),
    (84, 'Rita', 'Stahl', 12),
    (85, 'Werngard', 'Bill', 12),
    (86, 'Torge', 'Staack', 7),
    (87, 'Barbi', 'Heiss', 9),
    (89, 'Albin', 'Lust', 5),
    (90, 'Käthi', 'Wehrle', 4),
    (92, 'Alina', 'Kuchler', 11),
    (94, 'Sandra', 'Vargas', 7),
    (95, 'Katarina', 'Horbach', 12),
    (96, 'Edda', 'Gade', 12),
    (97, 'Camilla', 'Seck', 5),
    (98, 'Liebhard', 'Lipke', 1),
    (99, 'Vreneli', 'Böge', 8),
    (100, 'Julia', 'Stauder', 12);

DROP TABLE IF EXISTS `tt_teilnahme`;

CREATE TABLE `tt_teilnahme` (
    `ID_Teilnahme` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Tag` varchar(2) DEFAULT NULL,
    `Zimmer` varchar(10) DEFAULT NULL,
    `FK_Freifach` int(11) NOT NULL,
    `FK_SchülerIn` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_general_ci;

INSERT INTO
    `tt_teilnahme`
VALUES
    (1, 'Mo', '112', 1, 1),
    (2, 'Mi', 'Aula', 2, 2),
    (3, 'Di', '110', 3, 3),
    (4, 'Mo', '112', 1, 3),
    (5, 'Mi', 'Aula', 2, 3),
    (6, 'Mo', '112', 1, 4),
    (7, 'Di', '110', 3, 5),
    (8, 'Mi', 'Aula', 2, 6),
    (9, 'Do', '119', 4, 6),
    (10, 'Di', '110', 3, 7),
    (11, 'Do', '119', 4, 7),
    (12, 'Mo', '112', 1, 33),
    (13, 'Mi', 'Aula', 2, 22),
    (14, 'Di', '110', 3, 34),
    (15, 'Mo', '112', 1, 34),
    (16, 'Mi', 'Aula', 2, 34),
    (17, 'Mo', '112', 1, 41),
    (18, 'Di', '110', 3, 41),
    (19, 'Mi', 'Aula', 2, 16),
    (20, 'Do', '119', 4, 16),
    (21, 'Di', '110', 3, 17),
    (22, 'Do', '119', 4, 17),
    (23, 'Mo', '112', 1, 12),
    (24, 'Mi', 'Aula', 2, 23),
    (25, 'Di', '110', 3, 12),
    (27, 'Mi', 'Aula', 2, 32),
    (28, 'Mo', '112', 1, 11),
    (29, 'Di', '110', 3, 22),
    (30, 'Mi', 'Aula', 2, 14),
    (31, 'Do', '119', 4, 15),
    (32, 'Di', '110', 3, 16),
    (33, 'Do', '119', 4, 18),
    (34, 'Mo', '112', 1, 19),
    (35, 'Mi', 'Aula', 2, 21),
    (36, 'Di', '110', 3, 21),
    (37, 'Mo', '112', 1, 24),
    (38, 'Mi', 'Aula', 2, 25),
    (39, 'Mo', '112', 1, 26),
    (40, 'Di', '110', 3, 27),
    (41, 'Mi', 'Aula', 2, 29),
    (42, 'Do', '119', 4, 34),
    (43, 'Di', '110', 3, 23),
    (44, 'Do', '119', 4, 24);

ALTER TABLE
    `tbl_freifach`
ADD
    UNIQUE KEY `FK_FF_LehrerIn_UNIQUE` (`FK_FF_LehrerIn`),
ADD
    KEY `fk_tbl_Freifach1_idx` (`FK_FF_LehrerIn`);

ALTER TABLE
    `tbl_klasse`
ADD
    KEY `fk_tbl_Klasse1_idx` (`FK_KlassenLehrerIn`);

ALTER TABLE
    `tbl_schülerin`
ADD
    KEY `fk_tbl_SchülerIn1_idx` (`FK_Klasse`);

ALTER TABLE
    `tt_teilnahme`
ADD
    KEY `fk_tt_Teilnahme1_idx` (`FK_Freifach`),
ADD
    KEY `fk_tt_Teilnahme2_idx` (`FK_SchülerIn`);

ALTER TABLE
    `tbl_freifach`
ADD
    CONSTRAINT `fk_tbl_Freifach1` FOREIGN KEY (`FK_FF_LehrerIn`) REFERENCES `tbl_lehrerin` (`ID_LehrerIn`);

ALTER TABLE
    `tbl_klasse`
ADD
    CONSTRAINT `fk_tbl_Klasse1` FOREIGN KEY (`FK_KlassenLehrerIn`) REFERENCES `tbl_lehrerin` (`ID_LehrerIn`);

ALTER TABLE
    `tbl_schülerin`
ADD
    CONSTRAINT `fk_tbl_SchülerIn1` FOREIGN KEY (`FK_Klasse`) REFERENCES `tbl_klasse` (`ID_Klasse`);

ALTER TABLE
    `tt_teilnahme`
ADD
    CONSTRAINT `fk_tt_Teilnahme1` FOREIGN KEY (`FK_Freifach`) REFERENCES `tbl_freifach` (`ID_Freifach`),
ADD
    CONSTRAINT `fk_tt_Teilnahme2` FOREIGN KEY (`FK_SchülerIn`) REFERENCES `tbl_schülerin` (`ID_SchülerIn`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;