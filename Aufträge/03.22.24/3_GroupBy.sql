--@block
USE uebungSchule;

--@block
/* Geben Sie die Anzahl aller Schüler aus, gruppiert nach Nationalität (Spalten: "Anzahl", "Nationalität"). */
SELECT
    COUNT(*) AS Anzahl,
    nationalitaet
FROM
    schueler
GROUP BY
    nationalitaet;

--@block
/* Wie viele Schüler wohnen in den einzelnen Orten? Ausgabe: "Ort", "Anzahl der Schüler" (bitte genauso), sortiert nach Anzahl der Schüler absteigend */
SELECT
    o.`name` AS `Ort`,
    COUNT(s.id) AS `Anzahl der Schüler`
FROM
    orte as o
    JOIN schueler AS s ON o.id = s.idOrte
GROUP BY
    o.`name`
ORDER BY
    COUNT(s.id) DESC;

--@block
/* Erstellen Sie eine Liste, aus der ersichtlich wird, wie viele Lehrer die einzelnen Fächer unterrichten, sortiert nach Anzahl absteigend. Ausgabe: Fachbezeichnung, Anzahl */
SELECT
    fachbezeichnung,
    COUNT(l.idFaecher) AS Anzahl
FROM
    faecher AS f
    JOIN lehrer_hat_faecher AS l ON f.id = l.idFaecher
GROUP BY
    fachbezeichnung
ORDER BY
    COUNT(l.idFaecher) DESC;

--@block
/* Erstellen Sie eine Liste, aus der ersichtlich wird, welche Lehrer die jeweiligen Fächer unterrichten, sortiert nach Anzahl der Lehrer absteigend. Pro Fach bitte nur eine Zeile! Ausgabe: Fachbezeichnung, Lehrerliste (bitte KEINE Spalte, in der die Anzahl der Lehrer steht). */
SELECT
    f.fachbezeichnung,
    GROUP_CONCAT (DISTINCT c.name SEPARATOR ', ') as Lehrerliste
FROM
    faecher AS f
    JOIN lehrer_hat_faecher AS l ON f.id = l.idFaecher
    JOIN lehrer AS c ON l.idLehrer = c.id
GROUP BY
    f.fachbezeichnung
ORDER BY
    COUNT(DISTINCT l.idLehrer) DESC;

--@block
/* Wir brauchen eine Liste, die die Schülernamen auflistet und die Fächer, in denen diese Schüler unterrichtet werden. Ausgabe: "Schülername", "Lehrer", "Fächer" */
SELECT
    s.name AS Schülernamem,
    GROUP_CONCAT (DISTINCT l.name SEPARATOR ', ') AS Lehrer,
    GROUP_CONCAT (DISTINCT f.fachbezeichnung SEPARATOR ', ') AS Fächer
FROM
    schueler AS s
    JOIN lehrer_hat_schueler AS ls on s.id = ls.idSchueler
    JOIn lehrer as l on ls.idLehrer = l.id
    JOIN lehrer_hat_faecher as lf on l.id = lf.idLehrer
    join faecher as f on lf.idFaecher = f.id
GROUP BY
    s.name;