DECLARE
    CURSOR emp_cur IS SELECT * FROM Employee WHERE Dept_name = :dept;
    emp_info Employee%ROWTYPE;
BEGIN
    OPEN emp_cur;
    LOOP
    FETCH emp_cur INTO emp_info;
    DBMS_OUTPUT.PUT_LINE('Employee id: ' || emp_info.emp_id ||
                        ' Employee name: ' || emp_info.emp_name ||
                        ' Department name : ' || emp_info.dept_name ||
                        ' Salary: '||emp_info.salary);
    DBMS_OUTPUT.PUT_LINE(CHR(10));
    EXIT WHEN emp_cur%NOTFOUND;
    END LOOP;
    CLOSE emp_cur;
END;