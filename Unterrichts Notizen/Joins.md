# Joins

`Joins` werden verwendet um 2 oder mehr Tabellen zu verknüpfen. Es gibt verschiedene Arten von Joins:

- **Inner Join**: Gibt nur die Datensätze zurück, die in beiden Tabellen vorhanden sind.

- **Left Join**: Gibt alle Datensätze aus der linken Tabelle und die übereinstimmenden Datensätze aus der rechten Tabelle zurück.

- **Right Join**: Gibt alle Datensätze aus der rechten Tabelle und die übereinstimmenden Datensätze aus der linken Tabelle zurück.

- **Full Join**: Gibt alle Datensätze aus beiden Tabellen zurück.

Die Syntax für einen Join ist wie folgt strukturiert:

```sql
SELECT column_name(s)
FROM table1
JOIN table2
ON table1.column_name = table2.column_name;
```

**Beispiel**:

```sql
SELECT customers.name, orders.order_id
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;
```

Man wählt die Tabellen `customers` und `orders` aus und durch `JOIN` werden die Datensätze verknüpft, die in beiden Tabellen vorhanden sind. `ON` definiert die Bedingung, die erfüllt sein muss, damit die Datensätze verknüpft werden.
Hier nimmt man die von der ersten Tabelle eine Spalte (meistens den Primärschlüssel) und vergleicht sie mit der Spalte der zweiten Tabelle (meistens der Fremdschlüssel).

```sql
SELECT ErsteTabelle.Spalte1, ErsteTabelle.Spalte2, ZweiteTabelle.Spalte1, ZweiteTabelle.Spalte2
FROM ErsteTabelle
JOIN ZweiteTabelle
ON ErsteTabelle.Spalte1 = ZweiteTabelle.Spalte1;
```
