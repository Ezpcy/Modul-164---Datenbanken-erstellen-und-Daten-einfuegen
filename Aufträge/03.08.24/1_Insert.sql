--@block
use learn;

CREATE TABLE
    kunden (
        kunde_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        vorname VARCHAR(255),
        nachname VARCHAR(255),
        land_id INT,
        wohnort VARCHAR(255)
    );

--@block
/* a.	Legen Sie mit der Kurzform einen Kunden mit folgenden Daten an: Heinrich Schmitt aus Zürich, Schweiz (Schweiz hat die land_id 2). */
INSERT INTO
    kunden
VALUES
    (NULL, 'Heinrich', 'Schmitt', 2, 'Zürich');

--@block
/* b.	Legen Sie mit der Kurzform eine Kundin mit folgenden Daten an: Sabine Müller aus Bern, Schweiz (Schweiz hat die land_id 2). */
INSERT INTO
    kunden
VALUES
    (NULL, 'Sabine', 'Müller', 2, 'Bern');

--@block
/* c.	Legen Sie mit der Kurzform einen Kunden mit folgenden Daten an: Markus Mustermann aus Wien, Österreich (Österreich hat die land_id 1). */
INSERT INTO
    kunden
VALUES
    (NULL, 'Markus', 'Mustermann', 1, 'Wien');

--@block
/*d. Legen Sie mit der Langform einen Kunden mit folgenden Daten an: Herr Maier. */
INSERT INTO
    kunden (vorname, nachname)
VALUES
    ('', 'Herr Maier');

--@block
/*e.  Legen Sie mit der Langform einen Kunden mit folgenden Daten an: Herr Bulgur aus Sirnach. */
INSERT INTO
    kunden (vorname, nachname, wohnort)
VALUES
    ('', 'Herr Bulgur', 'Sirnach');

--@block
/* f.	Legen Sie mit der Langform einen Kunden mit folgenden Daten an: Maria Manta. */
INSERT INTO
    kunden (vorname, nachname)
VALUES
    ('Maria', 'Manta');

--@block
SELECT
    *
FROM
    kunden;