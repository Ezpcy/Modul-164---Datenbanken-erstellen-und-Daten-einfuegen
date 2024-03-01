# Alter Table

## Aufgabenstellung

Gegeben ist eine Tabelle mit dem Namen "employees", die folgende Spalten enthält:

- id (INTEGER, AUTO_INCREMENT, PRIMARY KEY)
- first_name (VARCHAR(50))
- last_name (VARCHAR(50))
- email (VARCHAR(100))
- hire_date (DATE)
- salary (DECIMAL(10,2))

**Auftrag**:

Erstellen Sie zuerst diese Tabelle in einer Datenbank company

Führen Sie die folgenden Änderungen an der Tabelle durch:

1. Fügen Sie eine neue Spalte "department" hinzu, die VARCHAR(50) als Datentyp hat.
2. Ändern Sie den Datentyp der Spalte "salary" in FLOAT(10,2).
3. Ändern Sie den Namen und Datentyp der Spalte departement in department_id und INT.
4. Entfernen Sie die Spalte "email" aus der Tabelle.

## Lösung

```sql
create database if not exists company;
use company;

Create table employees (
		id INTEGER PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email varchar(50),
        hire_date date,
        salary decimal(10,2)
        );

alter table employees add department varchar(50);

alter table employees modify salary float(10,2);

alter table employees change id department_id INT;

alter table employees drop email;
```
