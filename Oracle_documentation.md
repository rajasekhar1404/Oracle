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
- Rowcount - it is used to count the number of rows affected by an action.
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