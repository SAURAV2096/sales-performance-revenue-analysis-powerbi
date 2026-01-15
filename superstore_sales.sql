use superstore_db;
create table superstore (
OrderID varchar(15),
OrderDate date,
ShipDate date,
ShipMode varchar(20),
CustomerID varchar(15),
CustomerName varchar(50),
Segment varchar(20),
Region varchar(20),
Category varchar(20),
Sub_Category varchar(20),
ProductName varchar(100),
Sales float(10,2),
Quantity int,
Discount float(10,2),
Profit float(10,2)
);

-- Total Sales & Profit
SELECT 
    SUM(sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM
    superstore;

-- Sales by Year & Month
SELECT 
    YEAR(OrderDate) AS year, SUM(sales) AS Total_sales
FROM
    superstore
GROUP BY year
ORDER BY year;

SELECT 
    MONTH(OrderDate) AS month, SUM(sales) AS total_sales
FROM
    superstore
GROUP BY month
ORDER BY month;

-- Top 5 Products by Sales
SELECT 
    ProductName, SUM(sales) AS total_sales
FROM
    superstore
GROUP BY ProductName
ORDER BY total_sales DESC
LIMIT 5;


-- Profit by Category & Sub-Category
SELECT 
    Category, SUM(profit) AS Total_profit
FROM
    superstore
GROUP BY Category;

SELECT 
    Sub_Category, SUM(profit) AS Total_profit
FROM
    superstore
GROUP BY Sub_Category;


-- Region-wise Sales & Profit
SELECT 
    Region, SUM(sales) AS sales,
    SUM(profit) AS profit
FROM
    superstore
GROUP BY Region;

-- Loss-making products
SELECT 
    ProductName, profit
FROM
    superstore
WHERE
    profit < 0
ORDER BY profit;