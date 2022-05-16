# Basics of Oracle sql.
- Oracle database can not be installed in Windows home edition.
- But good news is we have __livesql.oracle.com__ which is a web based sql platform, where we can do all the operations of oracle sql, just we need a oracle account.
- everything i know about mysql is works here too, so i don't need to mention them again here.
- we need to DECLARE the variables in between DECLARE and BEGIN keywords.
- We can write the coding part or sql query's in between BEGIN and END key words,
- We have to end query's with semi-colon(;), at the end of the code we have to use Forward slash(/) to execute the code.
- while declaring the variables we have to give the variable name first and the data type then assignment operator then the value of the variable.
    Ex: emp_id VARCHAR(20) := 'Rajasekhar';
- To print anything on the output we'll use DBMS_OUTPUT.PUT_LINE('Hello');
- To concatenate we use two pipe(|) symbols.
- If we don't know the variable type we can get the variable type from the table by using Table name and column with Type Keyword.
    Ex: emp_id EMP.emp_id%TYPE;
- We can get the values from table and assign them to variables.
    Ex: SELECT emp_id, emp_name, emp_salary INTO emp_id, emp_name, emp_salary FROM EMP WHERE emp_id = 2;
- We can use the data type of one variable to another.
    Ex: emp_salary emp_id%TYPE;
    It will get the variable type of emp_id and it will assing that to emp_salary.
- We can use the ROWTYPE keyword to get the total row values, then we can print the values with table name and column name.
    Ex: recordvalues EMP%ROWTYPE; - to store the row data;
    SELECT * INTO recordvalues FROM EMP WHERE emp_id = 2; - to send the row data into variable.
    DBMS_OUTPUT.PUT_LINE(rowvalues.emp_id || ' ' || rowvalues.emp_name || ' ' || rowvalues.emp_salary); - to print the row data.
- It is not possible to get user input with livesql.

## Conditional statements;
- Everything is same as in all other languages that i already know, the main differences are,
    1. it is not ELSE IF it is ELSIF.
    2. We need a THEN keyword for every IF condition.
    3. Every IF condition should end with END IF;

- CASE
```
DECLARE
num INT;
name VARCHAR(20);
BEGIN
    num := 2;
        name := CASE num
        WHEN 1 THEN 'Rajasekhar'
        WHEN 2 THEN 'Karampudi'
        ELSE 'NONE'
    END;
    DBMS_OUTPUT.PUT_LINE(name);
END;
/
```
## Loops;
- LOOP
```
DECLARE
    num INT := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(num);
        num := num+1;
        EXIT WHEN num > 15;
    END LOOP;
END;
/
```
- While LOOP
```
DECLARE
    num INT := 1;
BEGIN
    WHILE num <= 15 LOOP
        DBMS_OUTPUT.PUT_LINE(num);
        num := num+1;
    END LOOP;
END;
/
```
- FOR LOOP
```
DECLARE
    num INT := 1;
BEGIN
    FOR num IN 1..15 LOOP
    DBMS_OUTPUT.PUT_LINE(num);
    END LOOP;
END;
/
```
- FOR LOOP REVERSE
```
DECLARE
    num INT := 1;
BEGIN
    FOR num IN REVERSE 1..15 LOOP
    DBMS_OUTPUT.PUT_LINE(num);
    END LOOP;
END;
/
```
- Rowcount: it is used to count the number of rows affected by an action.
```
DECLARE
cnt INT(5);
BEGIN
    UPDATE EMP SET emp_salary=13000 WHERE emp_id=2;
    cnt := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE(cnt || ' row afftected');
END;
/

SELECT COUNT(*) FROM EMP WHERE emp_id>0;
```
- EXPLICIT CURSOR: It is used to get the data from perticular columns, we declare a cursor, then open, then FETCH, THEN CLOSE.
```
DECLARE
    e_empName EMP.emp_name%TYPE;
    e_empSal EMP.emp_salary%TYPE;
    CURSOR emp_cursor IS SELECT emp_name, emp_salary FROM EMP;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO e_empName, e_empSal;
        EXIT WHEN emp_cursor%ROWCOUNT > 2 OR emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(e_empName || ': ' || e_empSal);
    END LOOP;
    CLOSE emp_cursor;
END;
/
```
- Parameterized cursor: we can send some parameters to the cursor so that we can open the cursor with different values.
```
DECLARE
    e_empName EMP.emp_name%TYPE;
    e_empSal EMP.emp_salary%TYPE;
    CURSOR emp_cursor(e_id INT) IS SELECT emp_name, emp_salary FROM EMP WHERE emp_id=e_id;
BEGIN
    OPEN emp_cursor(1);
    LOOP
        FETCH emp_cursor INTO e_empName, e_empSal;
        EXIT WHEN emp_cursor%ROWCOUNT > 2 OR emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(e_empName || ': ' || e_empSal);
    END LOOP;
    CLOSE emp_cursor;
        DBMS_OUTPUT.PUT_LINE('------------------------');
    OPEN emp_cursor(2);
    LOOP
        FETCH emp_cursor INTO e_empName, e_empSal;
        EXIT WHEN emp_cursor%ROWCOUNT > 2 OR emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(e_empName || ': ' || e_empSal);
    END LOOP;
    CLOSE emp_cursor;    
END;
/
```
- EXCEPTION HANDLING: there are two types of exception handling, explicit, implicit.
```
DECLARE
e_empName EMP.emp_name%TYPE;
e_empSal EMP.emp_salary%TYPE;
BEGIN
    SELECT emp_name, emp_salary INTO e_empName, e_empSal FROM EMP WHERE emp_id = 4;
    DBMS_OUTPUT.PUT_LINE(e_empName || ': ' || e_empSal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No values are there with that id');
    WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('more values are there with that id');
    WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Some error occured');
END;
/
```
- EXCEPTION HANDLING: we can give our own exceptions by raising them.
```
DECLARE
e_empName EMP.emp_name%TYPE;
e_empSal EMP.emp_salary%TYPE;
e_invalid EXCEPTION;
BEGIN
    UPDATE EMP SET emp_salary=15000 WHERE emp_salary=14400;
    IF SQL%NOTFOUND THEN
        RAISE e_invalid;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No values are there with that id');
    WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('more values are there with that id');
    WHEN e_invalid THEN
            DBMS_OUTPUT.PUT_LINE('Excepted error found');
    WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Some error occured');
END;
/
```
- CREATE PROCEDURE: We can create a set of block as a procedure, when ever we want those steps we can simple execute that procedure.
```
CREATE OR REPLACE PROCEDURE test_procedure IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('This is the test procedure');
END;
/

EXECUTE test_procedure;
```
- CREATE PROCEDURE: this example is used to create a procedure which accepts parameters.
```
CREATE OR REPLACE PROCEDURE add_val
(e_emp_id IN EMP.emp_id%TYPE,
e_emp_name IN EMP.emp_name%TYPE,
e_emp_salary IN EMP.emp_salary%TYPE)
IS

BEGIN
    INSERT INTO EMP VALUES(e_emp_id, e_emp_name, e_emp_salary);
    DBMS_OUTPUT.PUT_LINE('Data added');
END;
/

EXECUTE add_val(3, 'Rajkumar', 10000);

SELECT * FROM EMP;
```
- PROCEDURE CREATION: IN and OUT procedure creation.
```
SELECT * FROM EMP;

CREATE OR REPLACE PROCEDURE val_check 
(p_phone_no IN OUT VARCHAR2) IS 
BEGIN
    p_phone_no := '(' || SUBSTR(p_phone_no, 1, 3) || ')' || SUBSTR(p_phone_no, 4, 3) || '-' || SUBSTR(p_phone_no, 7);
END;
/

DECLARE
 v_phone_no VARCHAR2(15);
 BEGIN
    v_phone_no := '8465946463';
    val_check(v_phone_no);
    DBMS_OUTPUT.PUT_LINE(v_phone_no);
END;
/
```
- PACKAGES: Here is an example of creating an package.
```
SELECT * FROM EMP;

CREATE OR REPLACE PACKAGE edit_emp IS
    PROCEDURE add_emp(e_emp_id INT, e_emp_name VARCHAR);
    PROCEDURE edit_emp(e_emp_id INT, e_emp_name VARCHAR);
END edit_emp;

CREATE OR REPLACE PACKAGE BODY edit_emp IS 
    PROCEDURE add_emp(e_emp_id INT, e_emp_name VARCHAR) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee added');
END add_emp;
    PROCEDURE edit_emp(e_emp_id INT, e_emp_name VARCHAR) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee Updated');
END edit_emp;
END;
/

EXECUTE edit_emp.edit_emp(3, 'KARAMPUDI');
EXECUTE edit_emp.add_emp(3, 'KARAMPUDI');
```
- BODYLESS PACKAGE: here is an example for bodyless package.
```
CREATE OR REPLACE PACKAGE global_constants IS
    ml_to_km CONSTANT NUMBER := 1.5;
    km_to_ml CONSTANT NUMBER := 0.5;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(50 * global_constants.ml_to_km);
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(50 * global_constants.km_to_ml);
END;
/
```