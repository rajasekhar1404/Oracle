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



DELETE FROM buyer WHERE rowid not in(
SELECT MAX(rowid)
FROM buyer 
GROUP BY buyer);