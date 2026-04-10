SELECT * FROM medical_store_sales_inventory_dataset;

UPDATE medical_store_sales_inventory_dataset
SET Date = STR_TO_DATE(DATE , ' %d-%m-%y');

ALTER TABLE medical_store_sales_inventory_dataset
MODIFY COLUMN Date DATE;

-- Question: What is total revenue generated?
SELECT SUM(Total_Sales) AS Total_Revenue
FROM medical_store_sales_inventory_dataset;

-- How many orders were placed?
SELECT COUNT(Order_ID) AS Total_Orders
FROM medical_store_sales_inventory_dataset;

-- What is average revenue per order?
SELECT 
SUM(Total_Sales)/COUNT(Order_ID) AS Average_Order_Value
FROM medical_store_sales_inventory_dataset;


-- Which products sell the most?
SELECT 
Product_Name,
SUM(Quantity) AS Total_Sold
FROM medical_store_sales_inventory_dataset
GROUP BY Product_Name
ORDER BY Total_Sold DESC;

-- Which category generates most revenue?
SELECT 
Category,
SUM(Total_Sales) AS Revenue
FROM medical_store_sales_inventory_dataset
GROUP BY Category
ORDER BY Revenue DESC;

-- Which city generates highest revenue?
SELECT 
City,
SUM(Total_Sales) AS Revenue
FROM medical_store_sales_inventory_dataset
GROUP BY City
ORDER BY Revenue DESC;

-- How sales change over time?
SELECT 
MONTH(Date) AS Month,
SUM(Total_Sales) AS Monthly_Sales
FROM medical_store_sales_inventory_dataset
GROUP BY Month
ORDER BY Month;

-- Top 5 Products by Revenue
SELECT 
Product_Name,
SUM(Total_Sales) AS Revenue
FROM medical_store_sales_inventory_dataset
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 5;

-- Product avaliability 
SELECT 
SUM(Stock) AS Total_Stock,
SUM(Quantity) AS Total_Sold,
(SUM(Stock) / (SUM(Stock) + SUM(Quantity))) * 100 
AS Product_Availability_Percentage
FROM medical_store_sales_inventory_dataset;

-- How much total inventory is available?
SELECT SUM(Stock) AS Total_Stock
FROM medical_store_sales_inventory_dataset;

-- Which products need restocking?
SELECT Product_Name, Stock
FROM medical_store_sales_inventory_dataset
WHERE Stock < 50
ORDER BY Stock ASC;

-- Low stock count
SELECT COUNT(*) AS Low_Stock_Count
FROM medical_store_sales_inventory_dataset
WHERE Stock < 50;
-- Which category has highest stock?
SELECT Category, SUM(Stock) as Total_Stock
FROM medical_store_sales_inventory_dataset
GROUP BY Category
ORDER BY Total_Stock DESC;

-- Which products sell quickly?
SELECT Product_Name, SUM(Quantity) AS Total_Sold
FROM medical_store_sales_inventory_dataset
GROUP BY Product_Name
ORDER BY Total_Sold DESC;

-- Which products sell slowly?
SELECT Product_Name, SUM(Quantity) AS Total_Sold
FROM medical_store_sales_inventory_dataset
GROUP BY Product_Name
ORDER BY Total_Sold ASC
LIMIT 5;

-- What is average stock level?
SELECT AVG(Stock) AS Average_Stock
FROM medical_store_sales_inventory_dataset;

-- Which products are out of stock?
SELECT Product_Name, Stock
FROM medical_store_sales_inventory_dataset
WHERE Stock = 0;

-- Top selling product
SELECT 
    Product_Name,
    SUM(Quantity) AS Total_Sold
FROM medical_store_sales_inventory_dataset
GROUP BY Product_Name
ORDER BY Total_Sold DESC
LIMIT 1;

-- Which city has highest inventory?
SELECT City, SUM(Stock) AS Total_Stock
FROM medical_store_sales_inventory_dataset
GROUP BY City
ORDER BY Total_Stock DESC;

-- Sales by City
SELECT City, SUM(Total_Sales) AS Total_Sales
FROM medical_store_sales_inventory_dataset
GROUP BY City
ORDER BY Total_Sales DESC;
	