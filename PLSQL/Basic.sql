DECLARE
    marks NUMBER;
BEGIN
    marks := :val;
    DBMS_OUTPUT.PUT_LINE('Total marks obtained: ' || marks);
END;