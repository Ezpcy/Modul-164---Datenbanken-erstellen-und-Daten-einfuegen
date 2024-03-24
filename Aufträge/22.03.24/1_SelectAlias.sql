--@block
DROP DATABASE IF EXISTS `kunden`;

CREATE DATABASE IF NOT EXISTS `kunden`;

USE `kunden`;

-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: kunden
-- ------------------------------------------------------
-- Server version    5.5.38
--
-- Table structure for table `orte`
--
DROP TABLE IF EXISTS `orte`;

CREATE TABLE
    `orte` (
        `id_postleitzahl` varchar(5) NOT NULL,
        `name` varchar(255) NOT NULL,
        `einwohnerzahl` int (11) DEFAULT NULL,
        PRIMARY KEY (`id_postleitzahl`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Table structure for table `kunden`
--
DROP TABLE IF EXISTS `kunden`;

CREATE TABLE
    `kunden` (
        `kunde_id` int (11) NOT NULL AUTO_INCREMENT,
        `name` varchar(200) NOT NULL,
        `fk_ort_postleitzahl` varchar(5) NOT NULL,
        PRIMARY KEY (`kunde_id`),
        KEY (`fk_ort_postleitzahl`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = latin1;

--
-- Dumping data for table `orte`
--
INSERT INTO
    `orte`
VALUES
    ('80995', 'München', 1000000),
    ('79312', 'Emmendingen', 40000),
    ('79111', 'Freiburg', 280000),
    ('20095', 'Hamburg', 2000000);

--
-- Dumping data for table `kunden`
--
INSERT INTO
    `kunden`
VALUES
    (1, 'John', '79111'),
    (2, 'Herbert', '79312'),
    (3, 'Sabina', '79312'),
    (4, 'Mary', '79111'),
    (5, 'Heinrich', '79111'),
    (6, 'Usal', '80995'),
    (7, 'Johannes', '80995'),
    (8, 'Carla', '79312'),
    (9, 'Ludowika', '79111'),
    (10, 'Niemand', '99999');

--@block
use kunden;

--@block
SELECT
    kundenliste.kunde_id,
    kundenliste.name,
    kundenliste.fk_ort_postleitzahl
FROM
    kunden AS kundenliste
WHERE
    kundenliste.fk_ort_postleitzahl > 80000;

--@block
SELECT
    k.name,
    o.name
FROM
    orte AS o
    INNER JOIN kunden AS k ON o.id_postleitzahl = k.fk_ort_postleitzahl
WHERE
    o.name LIKE '%n';

--@block
SELECT
    hrgs.kunde_id,
    hrgs.name,
    prfz.name
FROM
    kunden AS hrgs
    INNER JOIN orte AS prfz ON prfz.id_postleitzahl = hrgs.fk_ort_postleitzahl
ORDER BY
    hrgs.kunde_id;

--@block
SELECT
    k.name,
    o.id_postleitzahl,
    o.name
FROM
    kunden AS k
    INNER JOIN orte AS o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE
    k.name LIKE '%a%'
    AND o.name LIKE '%u%';