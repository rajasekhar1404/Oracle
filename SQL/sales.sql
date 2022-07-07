--Create table sales.

CREATE TABLE sales(
    Region VARCHAR2(100),
    Country VARCHAR2(100),
    Item_Type VARCHAR2(50),
    Sales_Channel VARCHAR2(7),
    Order_Priority VARCHAR2(1),
    Order_Date VARCHAR2(20),
    Order_ID NUMBER,
    Ship_Date VARCHAR2(20),
    Units_Sold NUMBER,
    Unit_Price NUMBER(6, 2),
    Unit_Cost NUMBER(6, 2),
    Total_Revenue NUMBER(10, 2),
    Total_Cost NUMBER(10, 2),
    Total_Profit NUMBER(10, 2)
);

SELECT * FROM sales;

--UPDATE dates to valid dates
SELECT TO_DATE(ORDER_DATE, 'DD-MM-YYYY') FROM sales;

UPDATE sales SET order_date = TO_DATE(ORDER_DATE, 'DD-MM-YYYY');
UPDATE sales SET SHIP_DATE = TO_DATE(SHIP_DATE, 'DD-MM-YYYY');

ALTER TABLE sales MODIFY order_date DATE;

SELECT TO_DATE(SHIP_DATE, 'DD-MM-YYYY')-TO_DATE(ORDER_DATE, 'DD-MM-YYYY') as DIFF 
FROM sales;