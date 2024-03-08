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

--@block
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
SELECT
    *
FROM
    dvd_sammlung;

--@block
USE filmeDatenbank;

--@block
/* Beim Regisseur «Cohen» fehlt der Vorname. Vervollständigen sie den Regisseur Namen mit dem Vornamen «Etan». */
UPDATE dvd_sammlung
SET
    regisseur = 'Etan Cohen'
WHERE
    regisseur = 'Cohen';

--@block
/* Der Film «Angst» dauert nicht 92 Minuten, sondern 120 Minuten. Korrigieren Sie. */
UPDATE dvd_sammlung
SET
    laenge_minuten = 120
WHERE
    film = 'Angst';

--@block
/* DVD gibt es nicht mehr. Das Sortiment wurde durch «Bluray» Medien ersetzt. Nennen Sie die Tabelle um nach «bluray_sammlung». */
RENAME TABLE dvd_sammlung TO bluray_sammlung;

--@block
/* Eine neue Spalte «Preis» soll hinzugefügt werden. */
ALTER TABLE bluray_sammlung
ADD COLUMN preis float;

--@block
/* Der Film «Angriff auf Rom» von Steven Burghofer wurde aus dem Sortiment entfernt. Bereinigen Sie die Tabelle. */
DELETE FROM bluray_sammlung
WHERE
    film = 'Angriff auf Rom';

--@block
/* Die Spalte «filme» soll nach «kinofilme» umbenannt werden. */
ALTER TABLE bluray_sammlung CHANGE COLUMN film kinofilme varchar(255);

--@block
/* Die Spalte Nummer wird nicht mehr benötigt. Löschen Sie sie. */
ALTER TABLE bluray_sammlung
DROP COLUMN nummer;

--@block
/* Der Filmverleih rentiert nicht mehr. Die Firma wurde geschlossen und folglich werden alle Daten eliminiert. Löschen Sie die Tabelle. */
DROP TABLE bluray_sammlung;