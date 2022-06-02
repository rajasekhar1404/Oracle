# SQL Keywords
ADD: Adds a column in an existing table

ADD CONSTRAINT:	Adds a constraint after a table is already created

ALL: Returns true if all of the subquery values meet the condition

ALTER:	Adds, deletes, or modifies columns in a table, or changes the data type of a column in a table

ALTER COLUMN:	Changes the data type of a column in a table
ALTER TABLE:	Adds, deletes, or modifies columns in a table
AND:	Only includes rows where both conditions is true
ANY:	Returns true if any of the subquery values meet the condition
AS:	Renames a column or table with an alias
ASC:	Sorts the result set in ascending order
BACKUP DATABASE:	Creates a back up of an existing database
BETWEEN:	Selects values within a given range
CASE:	Creates different outputs based on conditions
CHECK:	A constraint that limits the value that can be placed in a column
COLUMN:	Changes the data type of a column or deletes a column in a table
CONSTRAINT:	Adds or deletes a constraint
CREATE:	Creates a database, index, view, table, or procedure
CREATE DATABASE:	Creates a new SQL database
CREATE INDEX:	Creates an index on a table (allows duplicate values)
CREATE OR REPLACE VIEW:	Updates a view
CREATE TABLE:	Creates a new table in the database
CREATE PROCEDURE:	Creates a stored procedure
CREATE UNIQUE INDEX:	Creates a unique index on a table (no duplicate values)
CREATE VIEW:	Creates a view based on the result set of a SELECT statement
DATABASE:	Creates or deletes an SQL database
DEFAULT:	A constraint that provides a default value for a column
DELETE:	Deletes rows from a table
DESC:	Sorts the result set in descending order
DISTINCT:	Selects only distinct (different) values
DROP:	Deletes a column, constraint, database, index, table, or view
DROP COLUMN:	Deletes a column in a table
DROP CONSTRAINT:	Deletes a UNIQUE, PRIMARY KEY, FOREIGN KEY, or CHECK constraint
DROP DATABASE:	Deletes an existing SQL database
DROP DEFAULT:	Deletes a DEFAULT constraint
DROP INDEX:	Deletes an index in a table
DROP TABLE:	Deletes an existing table in the database
DROP VIEW:	Deletes a view
EXEC:	Executes a stored procedure
EXISTS:	Tests for the existence of any record in a subquery
FOREIGN KEY:	A constraint that is a key used to link two tables together
FROM:	Specifies which table to select or delete data from
FULL OUTER JOIN:	Returns all rows when there is a match in either left table or right table
GROUP BY:	Groups the result set (used with aggregate functions: COUNT, MAX, MIN, SUM, AVG)
HAVING:	Used instead of WHERE with aggregate functions
IN:	Allows you to specify multiple values in a WHERE clause
INDEX:	Creates or deletes an index in a table
INNER JOIN:	Returns rows that have matching values in both tables
INSERT INTO:	Inserts new rows in a table
INSERT INTO SELECT:	Copies data from one table into another table
IS NULL:	Tests for empty values
IS NOT NULL:	Tests for non-empty values
JOIN:	Joins tables
LEFT JOIN:	Returns all rows from the left table, and the matching rows from the right table
LIKE:	Searches for a specified pattern in a column
LIMIT:	Specifies the number of records to return in the result set
NOT:	Only includes rows where a condition is not true
NOT NULL:	A constraint that enforces a column to not accept NULL values
OR:	Includes rows where either condition is true
ORDER BY:	Sorts the result set in ascending or descending order
OUTER JOIN:	Returns all rows when there is a match in either left table or right table
PRIMARY KEY:	A constraint that uniquely identifies each record in a database table
PROCEDURE:	A stored procedure
RIGHT JOIN:	Returns all rows from the right table, and the matching rows from the left table
ROWNUM:	Specifies the number of records to return in the result set
SELECT:	Selects data from a database
SELECT DISTINCT:	Selects only distinct (different) values
SELECT INTO:	Copies data from one table into a new table
SELECT TOP:	Specifies the number of records to return in the result set
SET:	Specifies which columns and values that should be updated in a table
TABLE:	Creates a table, or adds, deletes, or modifies columns in a table, or deletes a table or data inside a table
TOP:	Specifies the number of records to return in the result set
TRUNCATE TABLE:	Deletes the data inside a table, but not the table itself
UNION:	Combines the result set of two or more SELECT statements (only distinct values)
UNION ALL:	Combines the result set of two or more SELECT statements (allows duplicate values)
UNIQUE:	A constraint that ensures that all values in a column are unique
UPDATE:	Updates existing rows in a table
VALUES:	Specifies the values of an INSERT INTO statement
VIEW:	Creates, updates, or deletes a view
WHERE:	Filters a result set to include only records that fulfill a specified condition

- CREATE DATABASE
```
CREATE DATABASE testDB;
```
- DROP DATABASE
```
DROP DATABASE testDB;
```
- BACKUP DATABASE
```
BACKUP DATABASE testDB TO DISK = 'c/user/rajasekhar/testDB2.bak';
```
- CREATE TABLE
```
1. CREATE new Table
CREATE TABLE Persons (PersonID INT, LastName VARCHAR2(20), FirstName VARCAHR2(20), Address VARCHAR2(20), City VARCHAR2(20));
2. CREATE table from existing table
CREATE TABLE testDB AS SELECT * FROM Customers WHERE 1=0;
```
- DROP TABLE
```
DROP TABLE testDB;
```
- ALTER TABLE
```
1. ADD
ALTER TABLE Customers ADD Email VARCHAR2(50);
2. DROP COLUMN
ALTER TABLE Customers DROP COLUMN Email;
3. MODIFY COLUMN
ALTER TABLE Customers MODIFY COLUMN Email INT;
```
- CONSTRAINTS
```
1. NOT NULL - Ensures that a column cannot have a NULL value
2. UNIQUE - Ensures that all values in a column are different
3. PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
4. FOREIGN KEY - Prevents actions that would destroy links between tables
5. CHECK - Ensures that the values in a column satisfies a specific condition
6. DEFAULT - Sets a default value for a column if no value is specified
7. CREATE INDEX - Used to create and retrieve data from the database very quickly
```
- NOT NULL
```
CREATE TABLE Persons (ID INT NOT NULL, LastName VARCHAR2(30) NUT NULL, FirstName VARCHAR2(25) NOT NULL, Age INT);
```
- UNIQUE
```
1. UNIQUE
CREATE TABLE Persons(ID INT NOT NULL UNIQUE, LastName VARCHAR2(200) NOT NULL, FirstName VARCHAR2(200), Age INT);
2. Name a CONSTRAINT
CREATE TABLE Persons(ID INT NOT NULL, LastName VARCHAR2(100) NOT NULL, FirstName VARCHAR2(200), Age INT, CONSTRAINT UC_Persons UNIQUE(ID, LastName));
3. DROP CONSTRAINT
ALTER TABLE Persons DROP CONSTRAINT UC_Persons;
```
- PRIMARY KEY
```
CREATE TABLE Persons (ID INT NOT NULL PRIMARY KEY, LastName VARCHAR2(200) NOT NULL, FirstName VARCHAR2(200), Age INT);
```
- FOREIGN KEY
```
CREATE TABLE Orders (OrderID INT NOT NULL, OrderNumber INT NOT NULL, PersonID INT FOREIGN KEY REFERENCES Persons(PersonID));
```
- CHECK
```
1. CHECK Age
CREATE TABLE Persons (ID INT NOT NULL, LastName VARCHAR2(200) NOT NULL, FirstName VARCHAR2(200), Age INT, CHECK (Age >= 18));
2. CHECK Multiple columns
CREATE TABLE Persons (ID INT NOT NULL, LastName VARCHAR2(200) NOT NULL, FirstName VARCHAR2(200), Age INT, City VARCHAR2(200), CONSTRAINT CHK_Person CHECK (Age > 18 AND City = 'Sandnes'));
```
- DEFAULT
```
1. DEFALUT
CREATE TABLE Persons (ID INT NOT NULL, LastName VARCHAR2(200) NOT NULL, FirstName VARCHAR2(200), Age INT, City VARCHAR2(200) DEFAULT 'Sandnes');
2. DEFALUT GETDATE()
CREATE TABLE Orders (ID INT NOT NULL, OrderNumber INT NOT NULL, OrderDate DEFAULT GETDATE());
```
- INDEX
```
CREATE INDEX idx_name ON Persons (LastName, FirstName);
```
- AUTO INCREMENT
```
CREATE SEQUENCE seq_person MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10;
INSERT INTO Persons VALUES(seq_person.NEXTVAL, 'Lars', 'Monsen');
```
- DATE
```
1. DATE - format YYYY-MM-DD
2. DATETIME - format: YYYY-MM-DD HH:MI:SS
3. SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
4. TIMESTAMP - format: a unique number
SELECT * FROM Orders WHERE OrderDate = '2008-11-11';
```
- VIEWS
```
1. CREATE VIEW
CREATE VIEW [Brazil Customers] AS SELECT CustomerName, ContactName FROM Customers WHERE Country = 'Brazil';
SELECT * FROM [Brazil Customers];
```
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
- LEFT JOIN
```
1. LEFT JOIN with ORDER BY
SELECT Customers.CustomerName, Orders.OrderID FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID ORDER BY Customers.CustomerName;
```
- RIGHT JOIN
```
1. RIGHT JOIN with ORDER BY
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName FROM Orders RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID ORDER BY Orders.OrderID;
```
- FULL JOIN
```
SELECT Customers.CustomerName, Orders.OrderID FROM Customers FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID ORDER BY Customers.CustomerName;
```
- SELF JOIN
```
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City FROM Customers A, Customer B WHERE A.CustomerID <> B.CustomerID AND A.City = B.City ORDER BY A.City;
```
- UNION
```
1. UNION with ORDER BY
SELECT City FROM Customers UNION SELECT City FROM Suppliers ORDER BY City;
2. UNION ALL with ORDER BY
SELECT City FROM Customers UNION ALL SELECT City FROM Suppliers ORDER BY city;
3. UNION with WHERE
SELECT City, Country FROM Customers WHERE Country='Germany' UNION SELECT City, Country FROM Suppliers WHERE Country='Germany' ORDER BY City;
4. UNION ALL with WHERE
SELECT City, Country FROM Customers WHERE Country='Germany' UNION ALL SELECT City, Country FROM Suppliers WHERE Country='Germany' ORDER BY City;
5. UNION with AS
SELECT 'Customer' AS Type, ContactName, City, Country FROM Customers UNION SELECT 'Supplier', ContactName, City, Country FROM Suppliers;
```
- GROUP BY
```
1. GROUP BY
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country;
2. GROUP BY with ORDER BY
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;
3. GROUP BY with JOIN
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID GROUP BY ShipperName;
```
- HAVING
```
1. HAVING with GROUP BY
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5;
2. HAVING with GROUP BY AND ORDER BY
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5 ORDER BY COUNT(CustomerID) DESC;
```
- EXISTS
```
1. EXISTS
SELECT SupplierName FROM Suppliers WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = SupplierID AND Price < 20);
```
- ANY, ALL
```
1. ANY
SELECT ProductName FROM Products WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);
2. ALL
SELECT ALL ProductName FROM Products WHERE TRUE;
3. ALL another EX
SELECT ProductName FROM Products WHERE ProductID = ALL(SELECT ProductID FROM OrderDetails WHERE Quantity = 10);
```
- SELECT INTO
```
1. SELECT INTO
SELECT * INTO CustomersBackup2017 FROM Customers;
2. SELECT INTO with IN
SELECT * INTO  CustomersBackup2017 IN 'Backup.mdb' FROM Customers;
3. SELECT INTO with WHERE
SELECT * INTO CustomersGermany FROM Customers WHERE Country = 'Germany';
4. SELECT INTO with JOIN
SELECT Customers.CustomerName, Orders.OrderID INTO CustomersOrderBackup2017 FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
5. SELECT INTO for creating a new table with same columns
SELECT * INTO newtable FROM oldtable WHERE 1=0;
```
- INSERT INTO SELECT
```
1. INSERT INTO SELECT
INSERT INTO Customers(CustomerName, City, Country) SELECT SupplierName, City, Country FROM Suppliers;
2. INSERT INTO SELECT with WHERE
INSERT INTO Customers(CustomerName, City, Country) SELECT SupplierName, City, Country FROM Suppliers WHERE Country = 'Germany';
```
- CASE
```
1. CASE
SELECT OrderID, Quantity, CASE WHEN Quantity > 30 THEN 'The quantity is greater than 30' WHEN Quantity = 30 THEN 'The quantity is 30' ELSE 'The quantity is under 30' END AS QuantityText FROM OrderDetails;
2. CASE ORDER BY
SELECT CustomerName, City, Country FROM Customers ORDER BY (CASE WHEN City IS NULL THEN Country ELSE City END);
```
- NULL
```
1. NVL()
SELECT ProductName, UnitPrice * (UnitsInStock + NVL(UnitsOnOrder, 0)) FROM Products;
2. COALESCE()
SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0)) FROM Products;
```
- Stored Procedures
```
1. EXAMPLE 1
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;
EXEC SelectAllCustomers;
2. Stored Procedure With Parameter
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS 
SELECT * FROM Customers WHERE City = @City
GO;
EXEC SelectAllCustomers @City = 'London';
```
- COMMENTS
```
--SELECT ALL
/* SELECT
ALL
*/
```