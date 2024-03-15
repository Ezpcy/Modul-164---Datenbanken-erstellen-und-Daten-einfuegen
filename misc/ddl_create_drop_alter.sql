SELECT
    *
FROM
    dvd_sammlung;

USE filmeDatenbank;

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

/* Eine neue Spalte «Preis» soll hinzugefügt werden. */
ALTER TABLE bluray_sammlung
ADD COLUMN preis float;

/* Der Film «Angriff auf Rom» von Steven Burghofer wurde aus dem Sortiment entfernt. Bereinigen Sie die Tabelle. */
DELETE FROM bluray_sammlung
WHERE
    film = 'Angriff auf Rom';

/* Die Spalte «filme» soll nach «kinofilme» umbenannt werden. */
ALTER TABLE bluray_sammlung
RENAME COLUMN film TO kinofilme;

/* Die Spalte Nummer wird nicht mehr benötigt. Löschen Sie sie. */
ALTER TABLE bluray_sammlung
DROP COLUMN nummer;

/* Der Filmverleih rentiert nicht mehr. Die Firma wurde geschlossen und folglich werden alle Daten eliminiert. Löschen Sie die Tabelle. */
DROP TABLE bluray_sammlung;