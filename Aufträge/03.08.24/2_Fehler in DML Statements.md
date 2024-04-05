# Die folgenden Anweisungen enthalten Fehler. Finden und korrigieren Sie die Fehler. Probieren Sie die Funktionsfähigkeit der Befehle an der obigen Tabelle aus.

1.

```sql
INSERT INTO (nachname, wohnort, land_id) VALUES ('Fesenkampp', 'Duis-burg', 3);
```

- Der Tabellenname fehlt.

```sql
INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Fesenkampp', 'Duis-burg', 3);
```

2.

```sql
INSERT INTO kunden ('vorname') VALUES ('Herbert');
```

- Die Spaltenbezeichnung darf nicht in Anführungszeichen stehen.

```sql
INSERT INTO kunden (vorname) VALUES ('Herbert');
```

3.

```sql
INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 'Deutschland');
```

- Der Wert für die Spalte `land_id` ist ein String, es muss eine Zahl sein.

```sql
INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 3);
```

4.

```sql
INSERT INTO kunden ('', 'Brunhild', 'Sulcher', 1, 'Süderstade');
```

- Nach dem `INSERT INTO kunden` fehlt `VALUES` und die Spalte `kunde_id` muss eine Zahl oder `NULL`.

```sql
INSERT INTO kunden VALUES (NULL, 'Brunhild', 'Sulcher', 1, 'Süderstade');
```

5.

```sql
INSERT INTO kunden VALUES ('Jochen', 'Schmied', 2, 'Solingen');
```

- Bei einer Kurzform eines `INSERT INTO` müssen alle Spaltenwerte angegeben werden und `kunde_id` muss eine Zahl sein.

```sql
INSERT INTO kunden VALUES (NULL, 'Jochen', 'Schmied', 2, 'Solingen');
```

6.

```sql
INSERT INTO kunden VALUES ('', 'Doppelbrecher', 2, '');
```

- Bei einer Kurzform eines `INSERT INTO` müssen alle Spaltenwerte angegeben werden.

```sql
INSERT INTO kunden VALUES (NULL, '', 'Doppelbrecher', 2, NULL);
```

7.

```sql
INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Christoph', 'Fesenkampp', 'Duisburg', 3);
```

- Es sind 3 Spalten angegeben, aber es werden 4 Werte übergeben.

```sql
INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Christoph', 'Fesenkampp', 3);
```

8.

```sql
INSERT INTO kunden (vorname) VALUES ('Herbert');
```

- Dieses Statement funktioniert.

9.

```sql
INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES (Schulter, Albert, Duisburg, 1);
```

- Die Werte müssen in Anführungszeichen stehen.

```sql
INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 1);
```

10.

```sql
INSERT INTO kunden VALUE ('', "Brunhild", "Sulcher", 1, "Süderstade");
```

- `VALUE` muss `VALUES` sein und die Spalte `kunde_id` muss eine Zahl oder `NULL`.

```sql
INSERT INTO kunden VALUES (NULL, 'Brunhild', 'Sulcher', 1, 'Süderstade');
```

11.

```sql
INSERT INTO kunden VALUE ('', 'Jochen', 'Schmied', 2, Solingen);
```

- `VALUE` muss `VALUES` sein und die Spalte `kunde_id` muss eine Zahl oder `NULL`.

```sql
INSERT INTO kunden VALUES (NULL, 'Jochen', 'Schmied', 2, 'Solingen');
```
