
-- Task 3: SQL for Data Analysis

-- 1. Total Number of Customers
SELECT COUNT(DISTINCT Customer_Id) AS total_customers FROM ecommerce;

-- 2. Top 5 Most Ordered Products
SELECT Product, COUNT(*) AS total_orders
FROM ecommerce
GROUP BY Product
ORDER BY total_orders DESC
LIMIT 5;

-- 3. Average Revenue per User
SELECT Customer_Id, AVG(Sales) AS avg_revenue
FROM ecommerce
GROUP BY Customer_Id
ORDER BY avg_revenue DESC
LIMIT 5;

-- 4. Revenue by Product Category
SELECT Product_Category, SUM(Sales) AS total_revenue
FROM ecommerce
GROUP BY Product_Category
ORDER BY total_revenue DESC;

-- 5. Monthly Revenue View
CREATE VIEW monthly_revenue AS
SELECT strftime('%Y-%m', Order_Date) AS month, SUM(Sales) AS revenue
FROM ecommerce
GROUP BY month;

-- 6. Orders with High Profit
SELECT * FROM ecommerce WHERE Profit > 100;

-- 7. Orders with Discount > 0.2 and Priority High/Critical
SELECT * FROM ecommerce 
WHERE Discount > 0.2 
AND Order_Priority IN ('High', 'Critical');
