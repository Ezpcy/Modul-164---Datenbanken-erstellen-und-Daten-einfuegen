--@block
--
-- Tabellenstruktur für Tabelle dvd_sammlung
--
DROP SCHEMA IF EXISTS filmeDatenbank;

CREATE SCHEMA filmeDatenbank;

USE filmeDatenbank;

CREATE TABLE
    dvd_sammlung (
        id int (11) NOT NULL auto_increment,
        film varchar(255) NOT NULL,
        nummer int (11) NOT NULL,
        laenge_minuten int (11) NOT NULL,
        regisseur varchar(255) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY nummer (nummer)
    );

--
-- Daten für Tabelle dvd_sammlung
--
INSERT INTO
    dvd_sammlung
VALUES
    (
        1,
        'Meine Großmutter lacht nie',
        1,
        119,
        'Quentin Tarantino'
    );

INSERT INTO
    dvd_sammlung
VALUES
    (2, 'Angst', 2, 92, 'Steven Spielberg');

INSERT INTO
    dvd_sammlung
VALUES
    (
        3,
        'Wenn ich nur könnte',
        3,
        89,
        'Quentin Tarantino'
    );

INSERT INTO
    dvd_sammlung
VALUES
    (4, 'Men and Mice', 4, 88, 'Cohen');

INSERT INTO
    dvd_sammlung
VALUES
    (
        6,
        'Grün ist die Farbe der Liebe',
        5,
        201,
        'Quentin Tarantino'
    );

INSERT INTO
    dvd_sammlung
VALUES
    (
        7,
        'Frühstück in Sibirien',
        6,
        72,
        'Steven Spielberg'
    );

INSERT INTO
    dvd_sammlung
VALUES
    (8, 'Das große Rennen', 8, 83, 'Cohen');

INSERT INTO
    dvd_sammlung
VALUES
    (9, 'Das große Rennen, Teil 2', 9, 85, 'Cohen');

INSERT INTO
    dvd_sammlung
VALUES
    (10, 'Adlatus', 7, 131, 'Quentin Tarantino');

INSERT INTO
    dvd_sammlung
VALUES
    (
        11,
        'Angriff auf Rom',
        10,
        138,
        'Steven Burghofer'
    );

--@block
/* Lassen Sie sich mit SELECT alle Datensätze Ihrer DVD-Sammlung ausgeben. */
SELECT
    *
FROM
    dvd_sammlung;

--@block
/* 	Erstellen Sie eine Anweisung, die alle Filmtitel und die jeweils zugehörige Nummer ausgibt. */
SELECT
    film,
    id
FROM
    dvd_sammlung;

--@block
/* 	Erstellen Sie eine Liste mit allen Filmen von Quentin Tarantino. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur = "Quentin Tarantino";

--@block
/* Erstellen Sie eine Liste mit allen Filmen von Steven Spielberg. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur = "Steven Spielberg";

--@block
/* Erstellen Sie eine Liste aller Filme, in denen der Regisseur den Vornamen "Steven" hat. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur LIKE "Steven%";

--@block
/* Erstellen Sie eine Liste mit allen Filmen, die länger als 2 Stunden sind. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    laenge_minuten > 120;

--@block
/* Erstellen Sie eine Liste mit allen Filmen, die von Tarantino oder von Spielberg gedreht wurden. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur = "Steven Spielberg"
    OR regisseur = "Quentin Tarantino";

--@block
/* Suchen Sie alle Filme heraus, die von Tarantino gedreht wurden und kürzer als 90 Minuten sind. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur = "Quentin Tarantino"
    AND laenge_minuten < 90;

--@block
/* Sie erinnern sich an einen Film, in dessen Titel "Sibirien" vorkam. Suchen Sie ihn. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    film LIKE "%Sibirien%";

--@block
/* 	Lassen Sie sich alle Teile von "Das große Rennen" ausgeben. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    film LIKE "Das große Rennen%";

--@block
/* 	Lassen Sie sich eine Liste aller Filme ausgeben, sortiert nach Regisseur. */
SELECT
    film
FROM
    dvd_sammlung
ORDER BY
    regisseur;

--@block
/* 	Lassen Sie sich eine Liste aller Filme ausgeben, sortiert nach Regisseur, dann nach Filmtitel. */
SELECT
    film
FROM
    dvd_sammlung
ORDER BY
    regisseur,
    film;

--@block
/* Lassen Sie sich eine Liste aller Filme von Tarantino ausgeben, die längsten zuerst. */
SELECT
    film
FROM
    dvd_sammlung
WHERE
    regisseur = "Quentin Tarantino"
ORDER BY
    laenge_minuten DESC;