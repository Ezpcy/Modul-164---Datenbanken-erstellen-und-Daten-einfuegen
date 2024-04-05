# Datensicherung von Datenbanken

## Möglichkeiten zur Sicherung von Datenbanken

Um einen Datenverlust zu vermeiden, sollte man regelmäßig eine Datensicherung durchführen. Es gibt verschiedene Möglichkeiten. Zunächst wird zwischen Online- und Offline-Sicherung unterschieden:

- **Online-Sicherung**: Die Datenbank wird während des laufenden Betriebs gesichert und muss nicht angehalten werden.
  **Vorteile**:
  - Die Datenbank kann weiterhin genutzt werden.
  - Die Sicherung kann automatisiert werden.
    **Nachteile**:
  - Die Sicherung kann zu einer erhöhten Belastung des Systems führen.
- **Offline-Sicherung**: Die Datenbank wird vor der Sicherung angehalten.
  **Vorteile**:
  - Die Sicherung ist schneller.
    **Nachteile**:
  - Die Datenbank ist während der Sicherung nicht verfügbar.

## Arten der Datensicherung

Nebe der Unterscheidung zwischen Online- und Offline-Sicherung gibt es verschiedene Arten der Datensicherung:

- **Vollständige Sicherung/Voll-Backup**: Alle Daten werden gesichert. Dies ist die einfachste Form der Sicherung. Sie hat den Vorteil, dass die Wiederherstellung einfach ist. Allerdings ist der Speicherbedarf hoch.
- **Differentielle Sicherung**: Es werden nur die Daten gesichert, die sich seit der letzten vollständigen Sicherung geändert haben. Die Wiederherstellung ist einfacher als bei einer inkrementellen Sicherung, da nur zwei Sicherungen benötigt werden. Allerdings werden geänderte Daten und neue Dateien - bis zum nächsten Voll-Backup - bei jedem differentiellen Backup erneut gesichert. Die Wiederherstellung erfolgt gelingt nur dann, wenn die letzte vollständige Sicherung und das letzte differentielle Backup vorhanden sind.
- **Inkrementelle Sicherung**: Es werden nur die Daten gesichert, die sich seit der letzten Sicherung geändert haben. Die Wiederherstellung ist aufwendiger als bei einer differentiellen Sicherung, da alle inkrementellen Sicherungen seit der letzten vollständigen Sicherung benötigt werden. Allerdings ist der Speicherbedarf geringer als bei einer differentiellen Sicherung.

## Automatisierung der Datensicherung

Die Datensicherung kann automatisiert werden. Dazu gibt es verschiedene Möglichkeiten:

- **Backup-Programme**: Es gibt spezielle Backup-Programme, die die Datensicherung automatisieren. Sie bieten verschiedene Sicherungsmöglichkeiten und können auch die Wiederherstellung automatisieren.
- **Skripte**: Die Datensicherung kann auch mit Skripten automatisiert werden. Dazu gibt es verschiedene Möglichkeiten, z.B. mit PowerShell oder Bash.

Ein Beispiel für eine Backup-Skript in bash:

    ```bash
    #!/bin/bash
    # Backup-Skript für MySQL-Datenbanken
    # Datenbank-Parameter
    DB_USER="root"
    DB_PASS="password"
    DB_NAME="database"
    # Backup-Verzeichnis
    BACKUP_DIR="/var/backups/mysql"
    # Backup-Datei
    BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y-%m-%d_%H-%M-%S).sql"
    # Backup erstellen
    mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE
    ```

## Backups erzeugen

Um ein Backup zu erstellen gibt es verschiedene Möglichkeiten. Hier ein paar Beispiele:

- **MySQLDump**: Mit dem Tool `mysqldump` können MySQL-Datenbanken gesichert werden.
- **PHPMyAdmin**: Mit dem Web-Tool `PHPMyAdmin` können MySQL-Datenbanken gesichert werden.
- **BigDump**: Mit dem Tool `BigDump` können große MySQL-Datenbanken gesichert werden.
- **HeidiSQL**: Mit dem Tool `HeidiSQL` können MySQL-Datenbanken gesichert werden die sich auf Windows-System befinden.


