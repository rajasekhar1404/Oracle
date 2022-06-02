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
- ORDER BY
```
1. ORDER BY
SELECT * FROM Customers ORDER BY Country;
2. ORDER BY DESC
SELECT * FROM Customers ORDER BY Country DESC;
3. ORDER BY Several Columns EX1
SELECT * FROM Customers ORDER BY Country, CustomerName;
4. ORDER BY Several Columns EX2
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;
```
- INSERT INTO
```
1. INSERT INTO
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
2. Insert Data Only in Specified Columns
INSERT INTO Customers (CustomerName, City, Country) VALUES ('Cardinal', 'Stavanger', 'Norway');
```
- NULL
```
1. IS NULL
SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NULL;
2. IS NOT NULL
SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NOT NULL;
```
- UPDATE
```
1. UPDATE
UPDATE Customers SET CustomerName = 'Alfred Schmidt', City = 'Frankfurt' WHERE CustomerID = 1;
```
- DELETE
```
1. DELETE
DELETE FROM Customers WHERE CustomerName = 'Alfreds Futterkiste';
2. DELETE Whole data except table
DELETE FROM Customers;
```
- SELECT TOP
```
1. SELECT TOP
SELECT TOP 3 * FROM Customers;
2. SELECT TOP PERCENT
SELECT TOP 10 PERCENT * FROM Customers;
3. SELECT TOP WHERE
SELECT TOP 3 * FROM Customers WHERE Country = 'Germany';
```
- MIN and MAX
```
1. MIN AS
SELECT MIN(Price) AS SmallestPrice FROM Products;
2. MAX AS
SELECT MAX(Price) AS HighestPrice FROM Products;
```
- COUNT, AVG, SUM
```
1. COUNT
SELECT COUNT(ProductID) FROM Products;
2. AVG
SELECT AVG(Price) FROM Products;
3. SUM
SELECT SUM(Quantity) FROM OrderDetails;
```
- LIKE
```
1. LIKE starting with a
SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
2. LIKE ending with a
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
3. LIKE anywhere in the word
SELECT * FROM Customers WHERE CustomerName LIKE '%or%;
4. LIKE r in the second position
SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
5. LIKE starts with a and has min lenth of 3 char
SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';
6. LIKE starts with a ends with o
SELECT * FROM Customers WHERE CustomerName LIKE 'a%o';
7. NOT LIKE
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'a%';
```
- WILDCARD
```
1. LIKE starting with ber
SELECT * FROM Customer WHERE CustomerName LIKE 'ber%';
2. LIKE contaning es
SELECT * FROM Customers WHERE CustomerName LIKE '%es%';
3. LIKE _
SELECT * FROM Customers WHERE CustomerName LIKE '_ondon';
4. LIKE [bsp]%
SELECT * FROM Customers WHERE CustomerName
LIKE '[bsp]%';
5. LIKE [a-c]%
SELECT * FROM Customers WHERE CustomerName LIKE '[a-c]%';
6. LIKE NOT
SELECT * FROM Customers WHERE CustomerName LIKE '[!bsp]%';
or
SELECT * FROM Customers WHERE CustomerName NOT LIKE '[bsp]%';
```
- IN
```
1. IN with WHERE
SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');
2. NOT IN with WHERE
SELECT * FROM Customers WHERE Country NOT IN ('Germany', 'France', 'UK');
3. IN with SELECT 
SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers);
```
- BETWEEN
```
1. NOT BETWEEN
SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;
2. BETWEEN with IN
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20 AND CategoryID NOT IN (1,2,3);
3. BETWEEN With text values
SELECT * FROM Products WHERE ProductName BETWEEN 'Carnavon Trigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName;
4. NOT BETWEEN with text values
SELECT * FROM Products WHERE ProductName NOT BETWEEN 'Carnavon Trigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName;
5. BETWEEN Dates
SELECT * FROM Orders WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#; or
SELECT * FROM Orders WHERE OrderDate BETWEEN '07/01/1996' AND '07/31/1996';
```
- ALIASES (AS)
```
1. AS with Column
SELECT CustomerName AS Customer, ContactName AS [Contact Person] FROM Customers;
2. AS with Concatenation
SELECT CustomerName, (Adress || ', ' || PostalCode || ' ' || City || ', '||Country) AS Address FROM Customers;
3. AS with Table name
SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;
```
- JOIN
```
1. INNER JOIN 
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
2. INNER JOIN with 3 tables
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName FROM ((Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);
```