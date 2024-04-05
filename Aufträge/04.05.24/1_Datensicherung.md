# Logische und physische Datensicherung

Logische Backups bestehen aus den SQL-Anweisungen, die zur Wiederherstellung der Daten erforderlich sind, wie CREATE DATABASE, CREATE TABLE und INSERT.
Physische Backups werden durch Kopieren der einzelnen Datendateien oder Verzeichnisse durchgeführt.

Die Hauptunterschiede sind wie folgt

- Logische Backups sind flexibler, da die Daten auf anderen Hardwarekonfigurationen, MariaDB-Versionen oder sogar auf einem anderen DBMS wiederhergestellt werden können, während physische Backups nicht auf einer deutlich anderen Hardware, einem anderen DBMS oder möglicherweise sogar einer anderen MariaDB-Version eingespielt werden können. (Migration)
- Logische Backups können auf der Ebene von Datenbanken und Tabellen durchgeführt werden, während physische Datenbanken auf der Ebene von Verzeichnissen und Dateien liegen. In den MyISAM- und InnoDB-Speicher-Engines hat jede Tabelle einen entsprechenden Satz von Dateien.
- Logische Sicherungen sind größer als die entsprechende physische Sicherung.
- Logische Sicherungen benötigen mehr Zeit für die Sicherung und Wiederherstellung als die entsprechende physische Sicherung.

## Aufgabe 1: Logisches Backup erstellen

Ein Tutorial findet man hier [Gitlab-164](https://gitlab.com/ch-tbz-it/Stud/m164/-/blob/main/10_Auftraege_und_Uebungen/18_Datensicherung/Readme.md?plain=0)

So sieht mein bash script aus für MariaDB der Datenbank `Tourenplaner`:

```bash
#!/bin/bash
# Backup-Skript für MariaDB-Datenbanken
# Datenbank
DB_USER="root"
DB_PASS="password"
DB_NAME="Tourenplaner"
# Backup-Verzeichnis
BACKUP_DIR="/var/backups/mysql"
# Backup-Datei
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y-%m-%d_%H-%M-%S).sql"
# Backup erstellen
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE
```

## Aufgabe 2: Backup-File analysieren und verifizieren

```sql
-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Tourenplaner
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_disponent`
--

DROP TABLE IF EXISTS `tb_disponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_disponent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(45) DEFAULT NULL,
  `nachname` varchar(45) DEFAULT NULL,
  `telefon_nummer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disponent`
--

LOCK TABLES `tb_disponent` WRITE;
/*!40000 ALTER TABLE `tb_disponent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_disponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fahrer`
--

DROP TABLE IF EXISTS `tb_fahrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fahrer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(45) DEFAULT NULL,
  `nachname` varchar(45) DEFAULT NULL,
  `telefon_nummer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fahrer`
--

LOCK TABLES `tb_fahrer` WRITE;
/*!40000 ALTER TABLE `tb_fahrer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fahrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fahrt`
--

DROP TABLE IF EXISTS `tb_fahrt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fahrt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tb_disponent_id` int(11) NOT NULL,
  `tb_fahrzeug_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`tb_disponent_id`,`tb_fahrzeug_id`),
  KEY `fk_tb_fahrt_tb_disponent_idx` (`tb_disponent_id`),
  KEY `fk_tb_fahrt_tb_fahrzeug1_idx` (`tb_fahrzeug_id`),
  CONSTRAINT `fk_tb_fahrt_tb_disponent` FOREIGN KEY (`tb_disponent_id`) REFERENCES `tb_disponent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_fahrt_tb_fahrzeug1` FOREIGN KEY (`tb_fahrzeug_id`) REFERENCES `tb_fahrzeug` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fahrt`
--

LOCK TABLES `tb_fahrt` WRITE;
/*!40000 ALTER TABLE `tb_fahrt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fahrt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fahrzeug`
--

DROP TABLE IF EXISTS `tb_fahrzeug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fahrzeug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fahrzeug_kennzeichen` varchar(45) NOT NULL,
  `sitz_plätze` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fahrzeug`
--

LOCK TABLES `tb_fahrzeug` WRITE;
/*!40000 ALTER TABLE `tb_fahrzeug` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_fahrzeug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stationen`
--

DROP TABLE IF EXISTS `tb_stationen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stationen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `ankunft` datetime DEFAULT NULL,
  `abfahrt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stationen`
--

LOCK TABLES `tb_stationen` WRITE;
/*!40000 ALTER TABLE `tb_stationen` DISABLE KEYS */;
INSERT INTO `tb_stationen` VALUES (1,'6340 Baar',NULL,'2021-08-01 10:00:00');
/*!40000 ALTER TABLE `tb_stationen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stationen_has_tb_fahrt`
--

DROP TABLE IF EXISTS `tb_stationen_has_tb_fahrt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stationen_has_tb_fahrt` (
  `tb_stationen_id` int(11) NOT NULL,
  `tb_fahrt_id` int(11) NOT NULL,
  `tb_fahrt_tb_disponent_id` int(11) NOT NULL,
  `tb_fahrt_tb_fahrzeug_id` int(11) NOT NULL,
  `tb_fahrer_id` int(11) NOT NULL,
  PRIMARY KEY (`tb_stationen_id`,`tb_fahrt_id`,`tb_fahrt_tb_disponent_id`,`tb_fahrt_tb_fahrzeug_id`,`tb_fahrer_id`),
  KEY `fk_tb_stationen_has_tb_fahrt_tb_fahrt1_idx` (`tb_fahrt_id`,`tb_fahrt_tb_disponent_id`,`tb_fahrt_tb_fahrzeug_id`),
  KEY `fk_tb_stationen_has_tb_fahrt_tb_stationen1_idx` (`tb_stationen_id`),
  KEY `fk_tb_stationen_has_tb_fahrt_tb_fahrer1_idx` (`tb_fahrer_id`),
  CONSTRAINT `fk_tb_stationen_has_tb_fahrt_tb_fahrer1` FOREIGN KEY (`tb_fahrer_id`) REFERENCES `tb_fahrer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_stationen_has_tb_fahrt_tb_fahrt1` FOREIGN KEY (`tb_fahrt_id`, `tb_fahrt_tb_disponent_id`, `tb_fahrt_tb_fahrzeug_id`) REFERENCES `tb_fahrt` (`id`, `tb_disponent_id`, `tb_fahrzeug_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_stationen_has_tb_fahrt_tb_stationen1` FOREIGN KEY (`tb_stationen_id`) REFERENCES `tb_stationen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stationen_has_tb_fahrt`
--

LOCK TABLES `tb_stationen_has_tb_fahrt` WRITE;
/*!40000 ALTER TABLE `tb_stationen_has_tb_fahrt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_stationen_has_tb_fahrt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-05  9:20:11
```

1. Datenbank löschen:

```sql
DROP DATABASE IF EXISTS Tourenplaner;
```

2. Backup einspielen

```bash
mysql> CREATE DATABASE Tourenplaner;
mysql> USE Tourenplaner;
mysql> source /var/backups/mysql/backup_2024-04-05_09-20-11.sql
```

## Aufgabe 3: Backup Strategien

1. Welche Art von Backup wurde in der Aufgabe 1 erstellt? (Vollständig, Differentiell, Inkrementell)

   - Vollständig

2. Was ist der Unterschied zwischen online- und offline-Backup?

   - Online-Sicherung: Die Datenbank wird während des laufenden Betriebs gesichert und muss nicht angehalten werden.

   - Offline-Sicherung: Die Datenbank wird vor der Sicherung angehalten.

3. Was ist ein "snapshot Backup"?

   - Ein Snapshot-Backup ist eine Momentaufnahme des Systems zu einem bestimmten Zeitpunkt. Es wird verwendet, um den Zustand des Systems zu einem bestimmten Zeitpunkt wiederherzustellen.

## Aufgabe 4: Physisches Backup für MariaDB

Mit mariabackup kann ein physisches Backup von MariaDB-Datenbanken erstellt werden. Es ist ein Open-Source-Tool, das von MariaDB entwickelt wurde und die InnoDB-Speicher-Engine unterstützt.

Auf Linux lässt sich mariabackup mit dem folgenden Befehl installieren:

```bash
sudo apt-get install mariadb-backup
```

Das Tool lässt sich wie folgt verwenden:

```bash
sudo mariabackup --backup --target-dir=/var/backups/mariadb
```

Weitere Optionen sind:

- `--backup`: Erstellt ein Backup der Datenbank.
- `--target-dir`: Gibt das Verzeichnis an, in dem das Backup gespeichert werden soll.
- `--user`: Gibt den Benutzernamen an, mit dem auf die Datenbank zugegriffen werden soll.
- `--password`: Gibt das Passwort an, mit dem auf die Datenbank zugegriffen werden soll.

So sieht mein Befehl aus:

```bash
sudo mariabackup --backup --user root --password password --target-dir=/var/backups/mariadb
```
