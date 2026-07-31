-- DATA EXPLORATION
-- 1. How many products are available i the dataset?
SELECT COUNT(*) AS Total_Products
FROM Zepto;
-- 2. What are the distinct product categories?
SELECT DISTINCT Category FROM Zepto
ORDER BY Category;
-- 3. What is the price range of products?
SELECT MIN(Mrp) AS Lowest_MRP,
MAX(Mrp) AS Highest_MRP,
ROUND(AVG(Mrp),2) AS Average_MRP
FROM Zepto;
-- 4. What is the stock availability overview?
SELECT Out_Of_Stock,
COUNT(*) AS Product_Count
FROM Zepto
GROUP BY Out_Of_Stock;
-- 5. How many products belong to each category?
SELECT Category,
COUNT(*) AS Product_Count
FROM Zepto
GROUP BY Category
ORDER BY Product_Count DESC;
