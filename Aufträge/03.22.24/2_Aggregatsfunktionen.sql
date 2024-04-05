--@block
/* 	Welches ist das niedrigste/höchste Gehalt eines Lehrers? */
SELECT
    MAX(gehalt) AS `Höchster Gehalt`,
    MIN(gehalt) AS `Niedrigster Gehalt`
FROM
    lehrer;

--@block
/* 	Was ist das niedrigste Gehalt, das einer unserer Mathelehrer bekommt? */
SELECT
    MIN(gehalt)
from
    lehrer;

--@block
/* Was ist der beste Notendurchschnitt der Noten Deutsch/Mathe? */
SELECT
    MAX(noteMathe),
    MAX(noteDeutsch)
from
    schueler;

--@block
/* .	Wie viel Einwohner hat der größte Ort, wie viel der Kleinste? Ausgabe "Höchste Einwohnerzahl", "Niedrigste Einwohnerzahl" */
Select
    MAX(einwohnerzahl) as `Höchste Einwohnerzahl`,
    MIN(einwohnerzahl) AS `Niedrigste Einwohnerzahl`
FROM
    orte;

--@block
/* 	Wie groß ist die Differenz zwischen dem Ort mit den meisten und dem mit den wenigsten Einwohnern (z.B.: kleinster Ort hat 1000 Einwohner, größter Ort hat 3000 - Differenz ist 2000). Ausgabe einer Spalte "Differenz". */
SELECT
    MAX(einwohnerzahl) as `Höchste Einwohnerzahl`,
    MIN(einwohnerzahl) AS `Niedrigste Einwohnerzahl`,
    MAX(einwohnerzahl) - MIN(einwohnerzahl) AS `Differenz`
FROM
    orte;

--@block
/* Wie viele Schüler haben wir in der Datenbank? */
SELECT
    COUNT(*)
FROM
    schueler;

--@block
/* Wie viele Schüler haben ein Smartphone? */
SELECT
    COUNT(*)
FROM
    schueler
WHERE
    idSmartphones IS NOT NULL;

--@block
/* Wie viele Schüler haben ein Smartphone der Firma Samsung oder der Firma HTC? */
SELECT
    COUNT(*)
FROM
    schueler
WHERE
    idSmartphones IN (
        SELECT
            id
        FROM
            smartphones
        WHERE
            marke IN ('Samsung', 'HTC')
    );

--@block
/* Wie viele Schüler wohnen in Waldkirch? */
SELECT
    COUNT(*)
FROM
    schueler
WHERE
    idOrte IN (
        SELECT
            id
        FROM
            orte
        WHERE
            name = 'Waldkirch'
    );

--@block
/* Wie viele Schüler, die bei Herrn Bohnert Unterricht haben, wohnen in Emmendingen? */
SELECT
    COUNT(*)
FROM
    lehrer_hat_schueler
WHERE
    idLehrer IN (
        SELECT
            id
        FROM
            lehrer
        WHERE
            name = 'Bohnert'
    )
    AND idSchueler IN (
        SELECT
            id
        FROM
            schueler
        WHERE
            idOrte IN (
                SELECT
                    id
                FROM
                    orte
                WHERE
                    name = 'Emmendingen'
            )
    );

--@block
/* Wie viele Schüler unterrichtet Frau Zelawat? */
SELECT
    COUNT(*)
FROM
    lehrer_hat_schueler
WHERE
    idLehrer In (
        SELECT
            id
        FROM
            lehrer
        WHERE
            name = 'Zelawat'
    );

--@block
/* Wie viele Schüler russischer Nationalität unterrichtet Frau Zelawat? */
SELECT
    COUNT(*)
FROM
    lehrer_hat_schueler
WHERE
    idLehrer IN (
        SELECT
            id
        FROM
            lehrer
        WHERE
            name = 'Zelawat'
    )
    AND idSchueler IN (
        SELECT
            id
        FROM
            schueler
        WHERE
            nationalitaet = 'RU'
    );

--@block
/* 	Welcher Lehrer verdient am meisten?  */
SELECT
    `name`
FROM
    lehrer
WHERE
    gehalt = (
        SELECT
            MAX(gehalt)
        FROM
            lehrer
    );