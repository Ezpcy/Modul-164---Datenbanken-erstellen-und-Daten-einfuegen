/* 
 2.
 */
INSERT INTO
    `tbl_schülerin` (`Vorname`, `Nachname`, `FK_Klasse`)
VALUES
    ('Batuhan', 'Seker', 10);

/* 
 3.
 */
INSERT INTO
    tt_teilnahme (Tag, Zimmer, FK_Freifach, FK_SchülerIn)
VALUES
    ('Fr', '118', 6, 101);

/* 
 4.
 */
SELECT
    s.Nachname AS SchülerNachname,
    s.Vorname AS SchülerVorname,
    k.Klasse,
    l.Nachname AS LehrerNachname,
    l.Vorname AS LehrerVorname,
    f.Freifach,
    t.Tag,
    t.Zimmer
FROM
    tbl_schülerin s
    JOIN tbl_klasse k ON s.FK_Klasse = k.ID_Klasse
    JOIN tt_teilnahme t ON s.ID_SchülerIn = t.FK_SchülerIn
    JOIN tbl_freifach f ON t.FK_Freifach = f.ID_Freifach
    JOIN tbl_lehrerin l ON f.FK_FF_LehrerIn = l.ID_LehrerIn;

/* 
 5. Es nehnmen 12 SchülerInnen am Freifach von Frau Sommer teil.
 */
SELECT
    COUNT(*)
FROM
    tt_teilnahme
    JOIN tbl_freifach ON tt_teilnahme.FK_Freifach = tbl_freifach.ID_Freifach
    JOIN tbl_lehrerin ON tbl_freifach.FK_FF_LehrerIn = tbl_lehrerin.ID_LehrerIn
WHERE
    tbl_lehrerin.Nachname = 'Sommer'
    AND tbl_lehrerin.Vorname = 'Inge';

/* 
 6.
 */
SELECT
    k.Klasse,
    COUNT(t.FK_SchülerIn) AS Anzahl_der_Schüler_im_Freifach
FROM
    tbl_klasse k
    LEFT JOIN tbl_schülerin s ON k.ID_Klasse = s.FK_Klasse
    LEFT JOIN tt_teilnahme t ON s.ID_SchülerIn = t.FK_SchülerIn
GROUP BY
    k.Klasse
ORDER BY
    k.Klasse;

/* 
 7.
 */
SELECT
    k.Klasse,
    f.Freifach,
    COUNT(t.FK_SchülerIn) AS Anzahl_SchuelerInnen
FROM
    tbl_klasse k
    JOIN tbl_schülerin s ON k.ID_Klasse = s.FK_Klasse
    JOIN tt_teilnahme t ON s.ID_SchülerIn = t.FK_SchülerIn
    JOIN tbl_freifach f ON t.FK_Freifach = f.ID_Freifach
GROUP BY
    k.klasse,
    f.Freifach
ORDER BY
    f.Freifach,
    k.Klasse;

/* 
 8.
 */
SELECT
    s.Vorname,
    s.Nachname,
    f.Freifach
FROM
    tbl_schülerin s
    JOIN tt_teilnahme t ON s.ID_SchülerIn = t.FK_SchülerIn
    JOIN tbl_freifach f ON t.FK_Freifach = f.ID_Freifach
WHERE
    f.Freifach = 'Mathe'
    OR f.Freifach = 'Tanz'
ORDER BY
    f.freifach,
    s.Nachname;