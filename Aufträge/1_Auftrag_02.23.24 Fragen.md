# Fragen und Antworten zu Auftrag 02.23.24

**Wie werden Netzwerk-Beziehungen im logischen Modell abgebildet?**
Netzwerk-Beziehungen werden im logischen Modell durch die Verknüpfung von Tabellen abgebildet. Dabei wird eine Tabelle mit einer anderen Tabelle verknüpft, indem die Primärschlüssel der einen Tabelle in der anderen Tabelle als Fremdschlüssel gespeichert werden.

**Was sind Anomalien in einer Datenbasis? Welche Arten gibt es?**
Anomalien bezeichnen in der Datenbanktheorie Fehler, die durch die Strukturierung der Daten entstehen. Es gibt drei Arten von Anomalien:

- Einfügeanomalie: Ein neuer Datensatz kann nicht eingefügt werden, weil dazu ein weiterer Datensatz benötigt wird.
- Löschanomalie: Beim Löschen eines Datensatzes gehen auch andere Daten verloren.
- Änderungsanomalie: Änderungen an einem Datensatz müssen an mehreren Stellen vorgenommen werden.

**Gibt es redundante "Daten"? Warum?**
Auf der Ebene von Daten lassen sich Redundanzen nicht definieren. Redundanzen gibt es nur auf der Ebene von Informationen.

**Datenstrukturierung: Welche zwei Aspekte können strukturiert werden? Welche Kategorien (Abstufungen) gibt es bei der Strukturierung? Und wie müssen die Daten in einer DB strukturiert sein?**
Bei der Datenstrukturierung können zwei Aspekte strukturiert werden: die Daten selbst und die Beziehungen zwischen den Daten. Die drei Katgorien der Strukturierung sind:

1. Unstrukturierte Daten
2. Strukturierte Daten
3. Semi-strukturierte Daten

In einer Datenbank müssen Daten so strukturiert sein, so dass sie dem Datenbankmodell entsprechen und die Beziehungen zwischen den Daten korrekt abgebildet sind.

**Beschreiben das Bild mit den richtigen Fachbegriffen**

![alt text](../x_ressources/image.png)

1. **Name der Tabelle**
2. **Primärschlüssel**
3. **Name der Tabellenreihe**
4. **Tabellenzeile**

> **Quellen**: https://de.wikipedia.org/wiki/Anomalie_(Informatik)
