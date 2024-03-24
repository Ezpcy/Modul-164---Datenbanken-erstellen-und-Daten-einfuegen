# Datenkonsistenz

## Inkonsistenz

Mit Inkonsistenz in einer Datenbank, ist gemeint, dass die Daten in der Datenbank nicht einheitlich sind. Das bedeutet, dass die Daten in der Datenbank nicht den Regeln entsprechen, die für die Datenbank definiert wurden.

Beispiel:

| Id  | Name             | PLZ    | ortName |
| --- | ---------------- | ------ | ------- |
| 1   | Max Mustermann   | 12345  | Berlin  |
| 2   | Erika Musterfrau | 123335 | berlin  |

In diesem Beispiel ist die PLZ von Erika Musterfrau falsch geschrieben und die Groß- und Kleinschreibung von Berlin ist unterschiedlich. Das sind zwei Beispiele für Inkonsistenz in einer Datenbank.

## Integritätsregeln

Integritätsregeln sind Regeln, die in einer Datenbank definiert werden, um die Datenkonsistenz zu gewährleisten. Es gibt verschiedene Arten von Integritätsregeln:

- **Entity Integrity**: Jede Zeile in einer Tabelle muss eindeutig identifizierbar sein. Das bedeutet, dass jede Zeile in einer Tabelle einen Primärschlüssel haben muss, der eindeutig ist.
- **Referential Integrity**: Wenn eine Tabelle eine Fremdschlüsselbeziehung zu einer anderen Tabelle hat, muss der Wert des Fremdschlüssels in der anderen Tabelle existieren.
- **Domain Integrity**: Die Werte in einer Spalte müssen den definierten Datentypen entsprechen.
- **User-defined Integrity**: Benutzerdefinierte Integritätsregeln, die von den Benutzern definiert werden können.

## On Delete und On Update

In einer Datenbank können Sie auch festlegen, was passieren soll, wenn ein Datensatz gelöscht oder aktualisiert wird. Es gibt zwei Optionen:

- **On Delete**: Wenn ein Datensatz gelöscht wird, können Sie festlegen, was mit den Datensätzen passieren soll, die auf den gelöschten Datensatz verweisen. Es gibt verschiedene Optionen, wie z.B. `CASCADE`, `SET NULL`, `SET DEFAULT` oder `RESTRICT`.
- **On Update**: Wenn ein Datensatz aktualisiert wird, können Sie festlegen, was mit den Datensätzen passieren soll, die auf den aktualisierten Datensatz verweisen. Es gibt verschiedene Optionen, wie z.B. `CASCADE`, `SET NULL`, `SET DEFAULT` oder `RESTRICT`.

**Optionen**:

- **CASCADE**: Wenn ein Datensatz gelöscht oder aktualisiert wird, werden die Datensätze, die auf den gelöschten oder aktualisierten Datensatz verweisen, ebenfalls gelöscht oder aktualisiert.
- **SET NULL**: Wenn ein Datensatz gelöscht oder aktualisiert wird, wird der Wert des Fremdschlüssels in den Datensätzen, die auf den gelöschten oder aktualisierten Datensatz verweisen, auf `NULL` gesetzt.
- **SET DEFAULT**: Wenn ein Datensatz gelöscht oder aktualisiert wird, wird der Wert des Fremdschlüssels in den Datensätzen, die auf den gelöschten oder aktualisierten Datensatz verweisen, auf den Standardwert gesetzt.
- **RESTRICT**: Wenn ein Datensatz gelöscht oder aktualisiert wird, wird die Aktion abgebrochen und ein Fehler wird zurückgegeben.

**Beispiel**:

```sql
CREATE TABLE table1 (
    id INT PRIMARY KEY
);

CREATE TABLE table2 (
    id INT PRIMARY KEY,
    table1_id INT,
    FOREIGN KEY (table1_id) REFERENCES table1(id) ON DELETE CASCADE ON UPDATE SET NULL
);
```

In diesem Beispiel wird festgelegt, dass wenn ein Datensatz in `table1` gelöscht wird, werden die Datensätze in `table2`, die auf den gelöschten Datensatz verweisen, ebenfalls gelöscht. Wenn ein Datensatz in `table1` aktualisiert wird, wird der Wert des Fremdschlüssels in den Datensätzen in `table2`, die auf den aktualisierten Datensatz verweisen, auf `NULL` gesetzt.

**Wie es aussieht**:

| table1 | table2 |
| ------ | ------ |
| 1      | 1      |
| 2      | 2      |
| 3      | 3      |

Wenn der Datensatz mit `id=1` in `table1` gelöscht wird, wird der Datensatz in `table2` mit `table1_id=1` ebenfalls gelöscht.

| table1 | table2 |
| ------ | ------ |
| 2      | 2      |
| 3      | 3      |
