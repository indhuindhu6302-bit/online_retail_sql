CREATE DATABASE online_retail;
USE online_retail;

CREATE TABLE retail_sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100)
);


SELECT
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM retail_sales;

SELECT
    Description,
    SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;


SELECT
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM retail_sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;


SELECT
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM retail_sales
GROUP BY Country
ORDER BY Revenue DESC;


SELECT
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM retail_sales
GROUP BY Year, Month
ORDER BY Year, Month

SELECT
    ROUND(
        SUM(Quantity * UnitPrice) /
        COUNT(DISTINCT InvoiceNo), 2
    ) AS Avg_Order_Value
FROM retail_sales;

SELECT
    MONTHNAME(InvoiceDate) AS Month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM retail_sales
GROUP BY Month
ORDER BY Revenue DESC
LIMIT 1;

SELECT
    Description,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM retail_sales
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;


SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM retail_sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Orders DESC;


SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS Orders_Count
FROM retail_sales
GROUP BY Country
ORDER BY Orders_Count DESC
LIMIT 5;