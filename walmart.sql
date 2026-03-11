-- Total Sales, Profit, and Orders
SELECT
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    SUM(Quantity) AS QuantitySold,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS ProfitMarginPct
FROM dbo.walmart;

-- Sales by Category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM dbo.walmart
GROUP BY Category
ORDER BY TotalSales DESC;

-- Profit by Region
SELECT
    Region,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM dbo.walmart
GROUP BY Region
ORDER BY TotalProfit DESC;

-- Top 10 Products by Sales
SELECT TOP 10
    Product_Name,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM dbo.walmart
GROUP BY Product_Name
ORDER BY TotalSales DESC;

-- Bottom 10 Products by Profit
SELECT TOP 10
    Product_Name,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM dbo.walmart
GROUP BY Product_Name
ORDER BY TotalProfit ASC;

-- Top 10 Customers by Sales
SELECT TOP 10
    Customer_Name,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM dbo.walmart
GROUP BY Customer_Name
ORDER BY TotalSales DESC;

-- Sales by Customer Segment
SELECT
    Segment,
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM dbo.walmart
GROUP BY Segment
ORDER BY TotalSales DESC;

-- Sales by State
SELECT
    State,
    ROUND(SUM(Sales), 2) AS TotalSales
FROM dbo.walmart
GROUP BY State
ORDER BY TotalSales DESC;

-- Average Discount by Category
SELECT
    Category,
    ROUND(AVG(Discount) * 100, 2) AS AvgDiscountPct
FROM dbo.walmart
GROUP BY Category
ORDER BY AvgDiscountPct DESC;

-- Profit Margin by Category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS ProfitMarginPct
FROM dbo.walmart
GROUP BY Category
ORDER BY ProfitMarginPct DESC;

-- Monthly Sales Trend
SELECT
    FORMAT(Order_Date, 'yyyy-MM') AS YearMonth,
    ROUND(SUM(Sales), 2) AS MonthlySales
FROM dbo.walmart
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY YearMonth;

-- Monthly Profit Trend
SELECT
    FORMAT(Order_Date, 'yyyy-MM') AS YearMonth,
    ROUND(SUM(Profit), 2) AS MonthlyProfit
FROM dbo.walmart
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY YearMonth;

-- Rank Products by Sales Using Window Function
WITH ProductSales AS (
    SELECT
        Product_Name,
        ROUND(SUM(Sales), 2) AS TotalSales
    FROM dbo.walmart
    GROUP BY Product_Name
)
SELECT
    Product_Name,
    TotalSales,
    RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM ProductSales
ORDER BY SalesRank;

-- Month-over-Month Sales Growth
WITH MonthlySales AS (
    SELECT
        DATEFROMPARTS(YEAR(Order_Date), MONTH(Order_Date), 1) AS MonthStart,
        SUM(Sales) AS TotalSales
    FROM dbo.walmart
    GROUP BY DATEFROMPARTS(YEAR(Order_Date), MONTH(Order_Date), 1)
)
SELECT
    FORMAT(MonthStart, 'yyyy-MM') AS YearMonth,
    ROUND(TotalSales, 2) AS TotalSales,
    ROUND(LAG(TotalSales) OVER (ORDER BY MonthStart), 2) AS PreviousMonthSales,
    ROUND(
        (TotalSales - LAG(TotalSales) OVER (ORDER BY MonthStart))
        / NULLIF(LAG(TotalSales) OVER (ORDER BY MonthStart), 0) * 100,
        2
    ) AS MoMGrowthPct
FROM MonthlySales
ORDER BY MonthStart;

-- Customer Summary (RFM-style)
SELECT
    Customer_ID,
    Customer_Name,
    MAX(Order_Date) AS LastOrderDate,
    COUNT(DISTINCT Order_ID) AS Frequency,
    ROUND(SUM(Sales), 2) AS Monetary
FROM dbo.walmart
GROUP BY Customer_ID, Customer_Name
ORDER BY Monetary DESC;