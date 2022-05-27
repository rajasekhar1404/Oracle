- WHERE
```
1. WHERE
SELECT * FROM Customers WHERE City = 'Berlin';
2. WHERE NOT
SELECT * FROM Customers WHERE NOT City = 'Berlin';
3. WHERE =
SELECT * FROM Customers WHERE CustomerID = 32;
4. WHERE AND
SELECT * FROM Customers WHERE City = 'Berlin' AND PostalCode = 12209;
5. WHERE OR
SELECT * FROM Customers WHERE City = 'Berlin' OR City = 'London';
6. WHERE AND OR
SELECT * FROM Customers WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Munchen')
7. WHERE AND NOT
SELECT * FROM Customers WHERE NOT Country = 'Germany' AND NOT Country = 'USA';
```
