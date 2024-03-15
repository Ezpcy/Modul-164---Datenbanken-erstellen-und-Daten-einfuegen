# LB1 Spick

## DQL (Data Query Language Query) SELECT

```sql
/* Erstellen Sie eine Liste aller Filme, in denen der Regisseur den Vornamen "Steven" hat. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur LIKE "Steven%";

    /* Erstellen Sie eine Liste mit allen Filmen, die länger als 2 Stunden sind. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    laenge_minuten > 120;

/* 	Lassen Sie sich eine Liste aller Filme ausgeben, sortiert nach Regisseur, dann nach Filmtitel. */
SELECT
    film
FROM
    dvd_sammlung
ORDER BY
    regisseur,
    film;

/* Lassen Sie sich eine Liste aller Filme von Tarantino ausgeben, die längsten zuerst. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur = "Quentin Tarantino"
ORDER BY
    laenge_minuten DESC;
```

## DML (Data Manipulation Language) Insert Update Delete

```sql
/* Beim Regisseur «Cohen» fehlt der Vorname. Vervollständigen sie den Regisseur Namen mit dem Vornamen «Etan». */
UPDATE dvd_sammlung
SET
    regisseur = 'Etan Cohen'
WHERE
    regisseur = 'Cohen';

/* Der Film «Angst» dauert nicht 92 Minuten, sondern 120 Minuten. Korrigieren Sie. */
UPDATE dvd_sammlung
SET
    laenge_minuten = 120
WHERE
    film = 'Angst';

/* DVD gibt es nicht mehr. Das Sortiment wurde durch «Bluray» Medien ersetzt. Nennen Sie die Tabelle um nach «bluray_sammlung». */
RENAME TABLE dvd_sammlung TO bluray_sammlung;

/* DELETE */
DELETE FROM bluray_sammlung
WHERE
    film = 'Angst';

/* ## Kurzform eines INSERT INTO */
insert into schuhe values (NULL, 'Nike Air Max', '42', 150, 'schwarz');
/* ## Langform eines INSERT INTO */
insert into schuhe (name, groesse, preis, farbe) values ('Nike Air Max', '42', 150, 'schwarz');
```

# DDL (Data Definition Language) Create Alter Drop

```sql
/* Erstellen Sie eine Tabelle «dvd_sammlung» mit den Spalten «nummer», «film», «regisseur» und «laenge_minuten». */
CREATE TABLE `dvd_sammlung`(
    `nummer` int not null AUTO_INCREMENT PRIMARY KEY,
    `film` varchar(45) not null,
    `regisseur` varchar(45) not null,
    `laenge_minuten` int not null
);

/* Erstellen Sie eine Tabelle «schuhe» mit den Spalten «id», «name», «groesse», «preis» und «farbe». */
create table `schuhe`(
    `id` int not null AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(45) not null,
    `groesse` varchar(4),
    `preis` float not null,
    `farbe` varchar(45)
);

/* Erstellen Sie eine Tabelle «kunden» mit den Spalten «id», «vorname», «nachname», «geburtsdatum» und «email». */
create table `kunden`(
    `id` int not null AUTO_INCREMENT PRIMARY KEY,
    `vorname` varchar(45) not null,
    `nachname` varchar(45) not null,
    `geburtsdatum` date not null,
    `email` varchar(45) not null
);

ALTER TABLE bluray_sammlung
ADD COLUMN preis float;

/* Die Spalte Nummer wird nicht mehr benötigt. Löschen Sie sie. */
ALTER TABLE bluray_sammlung
DROP COLUMN nummer;

/* Löschen Sie die Tabelle. */
DROP TABLE bluray_sammlung;
```

## DQL
Consists of the following commands:
- SELECT
- FROM
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- LIMIT

Examples:
```sql
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur LIKE "Steven%";

SELECT
    film
FROM
    dvd_sammlung
WHERE
    laenge_minuten > 120;
```

## DML
Consists of the following commands:
- INSERT
- UPDATE
- DELETE

Examples:
```sql
UPDATE dvd_sammlung
SET
    regisseur = 'Etan Cohen'
WHERE
    regisseur = 'Cohen';

DELETE FROM bluray_sammlung
WHERE
    film = 'Angst';

insert into schuhe (name, groesse, preis, farbe) values ('Nike Air Max', '42', 150, 'schwarz');
```

## DDL
Consists of the following commands:
- CREATE
- ALTER
- DROP
- TRUNCATE
- RENAME

Examples:
```sql
CREATE TABLE `dvd_sammlung`(
    `nummer` int not null AUTO_INCREMENT PRIMARY KEY,
    `film` varchar(45) not null,
    `regisseur` varchar(45) not null,
    `laenge_minuten` int not null
);

create table `schuhe`(
    `id` int not null AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(45) not null,
    `groesse` varchar(4),
    `preis` float not null,
    `farbe` varchar(45)
);
```
