## Query-1 Validate orders and customers join 
SELECT 
    COUNT(*) AS Total_Orders,
    COUNT(DISTINCT o.OrderID) AS Unique_Orders,
    COUNT(DISTINCT c.CustomerID) AS Unique_Customers
FROM orders o
LEFT JOIN categories c
    ON o.CustomerID = c.CustomerID;
## Query-2 Find orders without a matching customer
SELECT 
    o.OrderID,
    o.CustomerID
FROM orders o
LEFT JOIN categories c
    ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;
## Query-3 Combine orders, customers and order details
SELECT
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    c.CompanyName,
    o.ProductID,
    o.Quantity,
    o.UnitPrice,
    o.Quantity * o.UnitPrice AS Sales
FROM orders o
JOIN categories c
    ON o.CustomerID = c.CustomerID;
## QUery-4 Combine orders, products and customers
    SELECT
    o.OrderID,
    o.OrderDate,
    c.CompanyName,
    p.ProductName,
    o.Quantity,
    o.UnitPrice,
    o.Quantity * o.UnitPrice AS Sales
FROM orders o
JOIN categories c
    ON o.CustomerID = c.CustomerID
JOIN Products p
    ON o.ProductID = p.ProductID;
    ## Query-5 Total Sales
    SELECT
    ROUND(SUM(o.Quantity * o.UnitPrice), 2) AS Total_Sales
FROM orders o;
    ## Query-6 Sales by customer
    SELECT
    c.CustomerID,
    c.CompanyName,
    ROUND(SUM(o.Quantity * o.UnitPrice), 2) AS Total_Sales
FROM categories c
JOIN orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY Total_Sales DESC;
##Query-7 Sales by product
SELECT
    p.ProductID,
    p.ProductName,
    SUM(o.Quantity) AS Units_Sold,
    ROUND(SUM(o.Quantity * o.UnitPrice), 2) AS Total_Sales
FROM Products p
JOIN orders o
    ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Sales DESC;
## Query-8 Sales by category
SELECT
    cat.`Category Name`,
    ROUND(SUM(o.Quantity * o.UnitPrice), 2) AS Total_Sales
FROM category cat
JOIN Products p
    ON cat.`Category ID` = p.CategoryID
JOIN orders o
    ON p.ProductID = o.ProductID
GROUP BY cat.`Category ID`, cat.`Category Name`
ORDER BY Total_Sales DESC;
## Query-9 Sales by customer country
SELECT
    c.Country,
    ROUND(SUM(o.Quantity * o.UnitPrice), 2) AS Total_Sales
FROM categories c
JOIN orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.Country
ORDER BY Total_Sales DESC;
## Query-10 number of orders by customer
SELECT
    c.CustomerID,
    c.CompanyName,
    COUNT(DISTINCT o.OrderID) AS Total_Orders
FROM categories c
JOIN orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY Total_Orders DESC;
## Query-11 Average order value
SELECT
    ROUND(SUM(Order_Sales) / COUNT(*), 2) AS Average_Order_Value
FROM (
    SELECT
        o.OrderID,
        SUM(o.Quantity * o.UnitPrice) AS Order_Sales
    FROM orders o
    GROUP BY o.OrderID
) AS OrderTotals;
## Query-12 Top 10 customers by sales
SELECT
    c.CustomerID,
    c.CompanyName,
    ROUND(SUM(o.Quantity * o.UnitPrice), 2) AS Total_Sales
FROM categories c
JOIN orders o
    ON c.CustomerID = o.CustomerID

GROUP BY c.CustomerID, c.CompanyName
ORDER BY Total_Sales DESC
LIMIT 10;
## Query-13 Top 10 products by sales
SELECT
    p.ProductID,
    p.ProductName,
    ROUND(SUM(o.Quantity * o.UnitPrice), 2) AS Total_Sales
FROM Products p
JOIN orders o
    ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Sales DESC
LIMIT 10;
## Query-14 monthly Sales trend
SELECT
    YEAR(o.OrderDate) AS Sales_Year,
    MONTH(o.OrderDate) AS Sales_Month,
    ROUND(SUM(o.Quantity * o.UnitPrice), 2) AS Total_Sales
FROM Orders o
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Sales_Year, Sales_Month;
## Query-15 Validate against double counting
SELECT 
    COUNT(DISTINCT o.OrderID) AS Unique_Orders,
    COUNT(o.OrderID) AS Order_Detail_Rows,
    SUM(o.Quantity * o.UnitPrice) AS Total_Sales
FROM Orders o
;