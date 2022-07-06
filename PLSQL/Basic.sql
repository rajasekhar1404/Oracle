DECLARE
    marks NUMBER;
BEGIN
    marks := :val;
    DBMS_OUTPUT.PUT_LINE('Total marks obtained: ' || marks);
END;

--
/*
Print all the employees who are living in HYD.
*/
DECLARE
    emp_info Employee%ROWTYPE;
    v_dept VARCHAR2(30);
BEGIN
    SELECT dept_name INTO v_dept FROM departments WHERE location = 'BLR';
    SELECT * INTO emp_info FROM employee WHERE dept_name = v_dept AND ROWNUM = 1;
    DBMS_OUTPUT.PUT_LINE(emp_info.emp_name || chr(10) || emp_info.emp_id || chr(10) || emp_info.dept_name || chr(10) || emp_info.salary || ' are working in HYD.');
END;

SELECT e.*, d.location FROM employee e, departments d WHERE e.dept_name = d.dept_name;