LOAD DATA
INFILE 'D:\Learning_journy\SQL_PL_SQL\Learning_programs\Oracle\SQL\Sample_Sales Records.csv'
TRUNCATE
INTO TABLE sales
FIELDS TERMINATED BY ","
(
	Region,
	Country,
	Item_Type,
	Sales_Channel,
	Order_Priority,
	Order_Date,
	Order_ID,
	Ship_Date,
	Units_Sold,
	Unit_Price,
	Unit_Cost,
	Total_Revenue,
	Total_Cost,
	Total_Profit
)