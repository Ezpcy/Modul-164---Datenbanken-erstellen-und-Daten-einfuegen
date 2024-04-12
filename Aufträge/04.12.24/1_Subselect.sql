--@block
use buchladen;

--@block
/* Welches ist das teuerste Buch in der Datenbank? */
SELECT
    titel,
    verkaufspreis
FROM
    buecher
WHERE
    verkaufspreis = (
        SELECT
            MAX(verkaufspreis)
        FROM
            buecher
    );

--@block
/* Welches ist das billigste Buch in der Datenbank */
SELECT
    titel,
    verkaufspreis
FROM
    buecher
WHERE
    verkaufspreis = (
        SELECT
            MIN(verkaufspreis)
        FROM
            buecher
    );

--@block
/* Lassen Sie sich alle Bücher ausgeben, deren Einkaufspreis über dem durchschnittlichen Einkaufspreis aller Bücher in der Datenbank liegt */
SELECT
    titel,
    einkaufspreis
FROM
    buecher
WHERE
    einkaufspreis > (
        SELECT
            AVG(einkaufspreis)
        FROM
            buecher
    );

--@block
/* Lassen Sie sich alle Bücher ausgeben, deren Einkaufspreis über dem durchschnittlichen Einkaufspreis der Thriller liegt. */
SELECT
    titel,
    einkaufspreis
FROM
    buecher
WHERE
    einkaufspreis > (
        SELECT
            AVG(einkaufspreis)
        FROM
            buecher
        WHERE
            buecher_id IN (
                SELECT
                    buecher_buecher_id
                FROM
                    buecher_has_sparten
                WHERE
                    sparten_sparten_id = 3
            )
    );

--@block
/* Lassen Sie sich alle Thriller ausgeben, deren Einkaufspreis über dem durchschnittlichen Einkaufspreis der Thriller liegt. */
SELECT
    titel,
    einkaufspreis
FROM
    buecher
WHERE
    buecher_id IN (
        SELECT
            buecher_buecher_id
        FROM
            buecher_has_sparten
        WHERE
            sparten_sparten_id = 3
    )
    AND einkaufspreis > (
        SELECT
            AVG(einkaufspreis)
        FROM
            buecher
        WHERE
            buecher_id IN (
                SELECT
                    buecher_buecher_id
                FROM
                    buecher_has_sparten
                WHERE
                    sparten_sparten_id = 3
            )
    );

--@block
/* Lassen Sie sich alle Bücher ausgeben, bei denen der Gewinn überdurchschnittlich ist; bei der Berechnung des Gewinndurchschnitts berücksichtigen Sie NICHT das Buch mit der id 22. */
SELECT
    titel,
    einkaufspreis,
    verkaufspreis,
    verkaufspreis - einkaufspreis AS gewinn
FROM
    buecher
WHERE
    buecher_id != 22
    AND verkaufspreis - einkaufspreis > (
        SELECT
            AVG(verkaufspreis - einkaufspreis)
        FROM
            buecher
        WHERE
            buecher_id != 22
    );

--@block
/* 
Wir brauchen die Summe der durchschnittlichen Einkaufspreise der einzelnen Sparten. Allerdings wollen wir dabei nicht die Sparte Humor berücksichtigen, ebenso wenig die Sparten, in denen der durchschnittliche Einkaufspreis 10 Euro oder weniger beträgt. 
Tipp: Erstellen Sie ein Subselect, dessen Ergebnis eine Tabelle ist, in der die gewünschten Sparten und ihre durchschnittlichen Einkaufspreise ausgegeben werden.
Von dieser Tabelle fragen Sie anschließend die Summe ab.
 */
SELECT
    SUM(durchschnitt)
FROM
    (
        SELECT
            sparten_sparten_id,
            AVG(einkaufspreis) AS durchschnitt
        FROM
            buecher_has_sparten
            JOIN buecher ON buecher_id = buecher_buecher_id
        WHERE
            sparten_sparten_id != 2
        GROUP BY
            sparten_sparten_id
        HAVING
            AVG(einkaufspreis) > 10
    ) AS durchschnitt;

--@block
/* "Bekannte Autoren" definieren wir als Autoren, die mehr als 4 Bücher veröffentlicht haben. Wie viele solcher Autor/innen haben wir in der Datenbank?
Tipp: Erstellen Sie ein Subselect, das Ihnen die bekannten Autoren ausgibt. Um zu sehen, ob Ihr Ergebnis plausibel wirkt, lassen Sie sich ausgeben: Vorname, Nachname, Anzahl veröffentlichter Büche.
Über dieses Subselect machen Sie eine einfach COUNT-Abfrage. */
SELECT
    COUNT(*)
FROM
    (
        SELECT
            autoren.autoren_id,
            COUNT(autoren_has_buecher.autoren_autoren_id) AS anzahl
        FROM
            autoren
            JOIN autoren_has_buecher ON autoren.autoren_id = autoren_has_buecher.autoren_autoren_id
        GROUP BY
            autoren.autoren_id
        HAVING
            COUNT(autoren_has_buecher.autoren_autoren_id) > 4
    ) AS bekannte_autoren;

--@block
/* Ihr Chef sagt zu Ihnen: "Schauen Sie sich mal alle Verlage an, die im Durchschnitt weniger als 10 Euro Gewinn pro Buch machen. Ich glaube, die verdienen im Schnitt höchstens 7 Euro pro Buch."
Tipp: Erstellen Sie für den ersten Satz des Chefs ein Subselect, das Sie für die Überprüfung des zweiten Satzes verwenden (Ausgabe: 'durchschnittlicher Gewinn pro Buch der Verlage, die weniger als 10 Euro pro Buch verdienen') */
SELECT
    verlage.name,
    AVG(buecher.verkaufspreis - buecher.einkaufspreis) AS durchschnitt
FROM
    verlage
    JOIN buecher ON verlage.verlage_id = buecher.verlage_verlage_id
GROUP BY
    verlage.verlage_id
HAVING
    AVG(buecher.verkaufspreis - buecher.einkaufspreis) < 10;