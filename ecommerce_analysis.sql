-- E-Commerce Sales & Profit Analysis
-- MySQL Portfolio Project

CREATE DATABASE IF NOT EXISTS ecommerce_analysis;
USE ecommerce_analysis;

CREATE TABLE IF NOT EXISTS SalesData (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Region VARCHAR(50),
    City VARCHAR(100),
    Category VARCHAR(100),
    Sub_Category VARCHAR(100),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Sales DECIMAL(12,2),
    Profit DECIMAL(12,2),
    Payment_Mode VARCHAR(50)
);

-- Overall KPIs
SELECT
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM SalesData;

-- Category analysis
SELECT
    Category,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM SalesData
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Region analysis
SELECT
    Region,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM SalesData
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Top 10 customers
SELECT
    Customer_ID,
    Customer_Name,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM SalesData
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Monthly sales trend
SELECT
    MONTH(Order_Date) AS Month_Number,
    MONTHNAME(Order_Date) AS Month_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM SalesData
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY Month_Number;

-- Payment mode analysis
SELECT
    Payment_Mode,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM SalesData
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;

-- Customer segment analysis
SELECT
    Segment,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM SalesData
GROUP BY Segment
ORDER BY Total_Sales DESC;
