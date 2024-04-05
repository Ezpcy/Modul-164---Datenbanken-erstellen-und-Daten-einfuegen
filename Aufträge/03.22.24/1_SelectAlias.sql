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