--Table creation
CREATE TABLE employee
(
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    company_name VARCHAR2(100),
    address VARCHAR2(500),	
    city VARCHAR2(50),
    county VARCHAR2(50),
    postal VARCHAR2(50),
    phone VARCHAR2(20),
    email VARCHAR2(100),
    web VARCHAR2(200)
);

select * from employee;

--DATA cleaning
SELECT * FROM employee WHERE SUBSTR(TRIM(address), -1, 1) = '"';
SELECT  SUBSTR(TRIM(address), -1, 1) FROM employee;

SELECT SUBSTR(address, 0, length(address)-1) FROM employee 
WHERE SUBSTR(TRIM(address), -1, 1) = '"';

UPDATE employee SET address = SUBSTR(address, 0, length(address)-1)
WHERE SUBSTR(TRIM(address), -1, 1) = '"';

--Done removing quations from address

SELECT SUBSTR(COMPANY_NAME, 0, length(COMPANY_NAME)-1) FROM employee 
WHERE SUBSTR(TRIM(COMPANY_NAME), 1, 1) = '"';

SELECT SUBSTR(COMPANY_NAME, 2, length(COMPANY_NAME)) FROM employee 
WHERE SUBSTR(TRIM(COMPANY_NAME), 1, 1) = '"';

UPDATE employee SET company_name = SUBSTR(COMPANY_NAME, 2, length(COMPANY_NAME))
WHERE SUBSTR(TRIM(COMPANY_NAME), 0, 1) = '"';

--removing quations form country
SELECT * FROM employee WHERE SUBSTR(TRIM(COUNTY), 0, 1) = '"';


SELECT * FROM employee WHERE SUBSTR(TRIM(PHONE), 0, 1) BETWEEN '0' AND '9';

SELECT * FROM employee WHERE LENGTH(POSTAL) > 8;

--Columns which are not affected by changing comma to pipe

SELECT FIRST_NAME FROM employee WHERE FIRST_NAME LIKE '%|%';
SELECT LAST_NAME FROM employee WHERE LAST_NAME LIKE '%|%';
SELECT ADDRESS FROM employee WHERE ADDRESS LIKE '%|%';
SELECT POSTAL FROM employee WHERE POSTAL LIKE '%|%';
SELECT PHONE FROM employee WHERE PHONE LIKE '%|%';
SELECT EMAIL FROM employee WHERE EMAIL LIKE '%|%';
SELECT WEB FROM employee WHERE WEB LIKE '%|%';



--Columns which are affected by changing comma to pipe and needs to update

SELECT COUNTY FROM employee WHERE COUNTY LIKE '%|%';
SELECT CITY FROM employee WHERE CITY LIKE '%|%';
SELECT COMPANY_NAME FROM employee WHERE COMPANY_NAME LIKE '%|%';

SELECT REPLACE(COUNTY, '|', ',') FROM employee WHERE COUNTY LIKE '%|%';

SELECT REPLACE('RAJASEKHAR | KARAMPUDI', '|', ',') FROM DUAL;

--Fixing the pipes to commas.
UPDATE employee SET COUNTY = REPLACE(COUNTY, '|', ',')
WHERE COUNTY LIKE '%|%';

UPDATE employee SET CITY = REPLACE(CITY, '|', ',')
WHERE CITY LIKE '%|%';

UPDATE employee SET COMPANY_NAME = REPLACE(COMPANY_NAME, '|', ',')
WHERE COMPANY_NAME LIKE '%|%';

--verifing invalid DATA
SELECT * FROM employee WHERE email NOT LIKE '%@%';
SELECT * FROM employee WHERE PHONE NOT LIKE '%-%';
SELECT * FROM employee WHERE LENGTH(POSTAL) > 8;
SELECT * FROM employee WHERE SUBSTR(ADDRESS, 0, 1) BETWEEN 0 AND 9;

--Deleting duplicate VALUES
SELECT * FROM employee WHERE phone = '01957-962781';

SELECT count(*) FROM employee 
WHERE ROWID NOT IN (
                    SELECT MAX(ROWID) FROM employee
                    GROUP BY email);

DELETE FROM employee 
WHERE ROWID NOT IN (
                    SELECT MAX(ROWID) FROM employee
                    GROUP BY email);

SELECT COUNT(*) FROM employee GROUP BY email HAVING COUNT(*) > 1;

--printing values as csv
SELECT COUNTY FROM employee WHERE COUNTY LIKE '%|%';
SELECT CITY FROM employee WHERE CITY LIKE '%|%';
SELECT COMPANY_NAME FROM employee WHERE COMPANY_NAME LIKE '%|%';

CREATE TABLE employee_temp AS SELECT * FROM employee;

UPDATE employee_temp SET COUNTY = REPLACE(COUNTY, ',', '|')
WHERE COUNTY LIKE '%,%';

UPDATE employee_temp SET CITY = REPLACE(CITY, ',', '|')
WHERE CITY LIKE '%,%';

UPDATE employee_temp SET COMPANY_NAME = REPLACE(COMPANY_NAME, ',', '|')
WHERE COMPANY_NAME LIKE '%,%';

SELECT * FROM employee_temp;

drop table employee_temp;