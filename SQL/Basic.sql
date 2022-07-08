SELECT * FROM departments;
SELECT * FROM Employee;

SELECT e.emp_id, e.emp_name, e.dept_name, d.location, e.salary
FROM employee e, departments d
WHERE e.dept_name = d.dept_name AND e.dept_name = 'Admin';

SELECT * FROM employee WHERE dept_name IN 
(SELECT dept_name FROM departments
WHERE location = 'HYD' OR location = 'BLR');


SELECT * FROM DIVISION;
SELECT * FROM MERCH;
SELECT * FROM BUYER;

INSERT INTO buyer VALUES(1700, 'Steve', 6335352352, 3523523543);

SELECT b.*, m.*, d.* 
FROM buyer b, merch m, division d
WHERE b.buyer = d.buyer AND
d.merch = m.merch;

SELECT * FROM BUYER 
WHERE buyer_fax IS NULL;

SELECT COUNT(buyer), buyer
FROM buyer 
GROUP BY buyer
HAVING COUNT(buyer) > 1;

--
SELECT * FROM BUYER WHERE ROWID NOT IN (
SELECT MAX(ROWID) FROM Buyer GROUP BY buyer);

--
SELECT * FROM Employee WHERE ROWID NOT IN (
SELECT MAX(ROWID) FROM employee GROUP BY salary);

--
SELECT COUNT(EMP_ID) FROM employee GROUP BY emp_id HAVING COUNT(emp_id) = 1;

--
SELECT * FROM ALL_OBJECTS WHERE OBJECT_TYPE = 'TABLE' AND OBJECT_NAME = 'EMPLOYEE';

--
SELECT * FROM ALL_TABLES WHERE TABLE_NAME = 'EMPLOYEE';

--
CREATE TABLE temp AS SELECT * FROM Employee WHERE 1 = 2;
SELECT * FROM temp;
DESCRIBE EMPLOYEE;
DROP TABLE temp;

--
SELECT * FROM USER_SOURCE;
DROP PROCEDURE proc_1;
DROP PACKAGE pk_1;

--
SELECT ORA_DATABASE_NAME FROM DUAL;
SELECT * FROM GLOBAL_NAME;
SELECT NAME FROM V$DATABASE;

--
SELECT * FROM employee WHERE emp_id NOT IN (
SELECT EMP_ID FROM employee WHERE ROWNUM <= 5);

--
SELECT * FROM(
SELECT ROWNUM rno, e.* FROM employee e ORDER BY rno DESC) WHERE rno > 5;

SELECT * FROM Employee WHERE ROWNUM <=5 ORDER BY EMP_ID DESC;

SELECT DISTINCT salary FROM employee ORDER BY salary DESC;

--
SELECT * FROM (
SELECT ROWNUM rno, e.* FROM employee e) WHERE MOD(rno, 2) != 0;

SELECT * FROM employee WHERE MOD(emp_id, 2) <> 0;

--
SELECT MOD(4, 2) FROM DUAL;

SELECT * FROM Departments WHERE dept_name NOT IN (SELECT DISTINCT dept_name FROM employee);

--
select * from Employee a where  rowid = 
(select max(rowid) from Employee b where  a.salary=b.salary);

SELECT * FROM Employee a WHERE ROWID = (
SELECT MAX(ROWID) FROM employee b WHERE b.SALARY = a.SALARY);

--
Select Substr('ORACLE',Level,2) From Dual
Connect By Level<= Length('ORACLE');

SELECT MAX(SALARY), DEPT_NAME FROM EMPLOYEE GROUP BY DEPT_NAME;

SELECT RPAD('R', 3,'A') FROM DUAL;
SELECT RPAD('*', ROWNUM, '*') FROM employee WHERE ROWNUM <= 5;

--
SELECT LEVEL FROM DUAL CONNECT BY LEVEL <= 100;

CREATE TABLE temp_emp AS SELECT * FROM EMPLOYEE WHERE 2 = 1;

SELECT * FROM temp_emp;

DROP TABLE temp_emp;

--
SELECT SYS_CONTEXT('userenv', 'current_schema') FROM DUAL;
SELECT user FROM DUAL;

SELECT DBMS_METADATA.GET_DDL('TABLE', 'EMPLOYEE', 'SYSTEM') FROM DUAL;

SELECT * FROM employee WHERE ROWID = (SELECT MAX(ROWID) FROM employee);

SELECT SUM(BYTES/1024/1024) FROM DBA_SEGMENTS WHERE OWNER = 'SYSTEM';

SELECT * FROM V$VERSION;

--working large dataset

SELECT * FROM new_sms_download;

SELECT CONTENT FROM new_sms_download WHERE CONTENT LIKE '%{%';

SELECT SEND_TIME FROM NEW_SMS_DOWNLOAD;

SELECT REPLACE(SEND_TIME, '|', ':') FROM new_sms_download;
UPDATE new_sms_download SET send_time = REPLACE(SEND_TIME, '|', ':');

--COLLECT TIME
SELECT COLLECT_TIME FROM new_sms_download;
SELECT LENGTH(COLLECT_TIME) FROM new_sms_download WHERE LENGTH(COLLECT_TIME) > 7;

--SENDER
SELECT DISTINCT LENGTH(SENDER) FROM new_sms_download;
SELECT LENGTH(SENDER) FROM new_sms_download WHERE LENGTH(SENDER) > 32;

SELECT count(*) FROM new_sms_download WHERE LENGTH(SENDER) = 3;

SELECT SEND_TIME, CONTENT FROM new_sms_download 
WHERE SENDER = '79780a9dbe83fd1e5dd2bd2543e7da2a' AND
RECEIVER = '6aeb251bfc2f8705cfd81acc20253863'
ORDER BY SEND_TIME;
