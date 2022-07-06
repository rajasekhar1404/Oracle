SELECT ROWNUM, a.* FROM (
SELECT * FROM (
SELECT ROWNUM rno, Employee.* FROM Employee
) ORDER BY rno DESC) a;

SELECT ROWNUM rno, Employee.* FROM Employee

SELECT emp_id, emp_name, dept_name, salary FROM (
SELECT ROWNUM rno, a.* FROM (
SELECT emp_id, emp_name, dept_name, DISTINCT salary FROM employee ORDER BY salary DESC) a ) WHERE rno = 5;

SELECT * FROM Employee WHERE salary = (
SELECT salary FROM (
SELECT ROWNUM rno, a.* FROM (
SELECT DISTINCT salary FROM employee ORDER BY salary DESC) a)
WHERE rno = 4);

SELECT * FROM EMPLOYEE;