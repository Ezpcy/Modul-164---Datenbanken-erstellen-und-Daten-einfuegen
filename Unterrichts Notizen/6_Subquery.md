# DQL (Data Query Language)

## Subquery

A Subquery is a query within another query. It is used to filter the results of the outer query. The subquery is executed first and the result is passed to the outer query. Here is an example:

```sql
use subselect;
SELECT name, age, country
FROM users
WHERE country IN (SELECT name FROM country WHERE region = 'Europa');
```

In this example, we query the users and filter them by the country. The subquery selects the countries from the country table where the region is 'Europa'. The result of the subquery is passed to the outer query to filter the users by the country.

## Subquery with JOIN

A subquery can also be used with a JOIN. Here is an example:

```sql
use northwind;
SELECT customers.ContactName, orders.orderdate
FROM customers
INNER JOIN orders
ON customers.customerid = orders.customerid
WHERE orders.orderdate IN (
  SELECT MAX(orderdate)
  FROM orders
  GROUP BY customerid);
```

In this example, we query the customers and orders. We join the customers and orders tables on the customerid. The subquery selects the maximum orderdate from the orders table and groups it by the customerid. The result of the subquery is passed to the outer query to filter the orders by the orderdate.
