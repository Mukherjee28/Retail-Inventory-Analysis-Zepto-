-- WINDOWS, CTEs, VIEWS AND INDEX QUESTIONS
-- 1. Rank products by MRP within each category.
SELECT Name, Category, Mrp, 
RANK() OVER(PARTITION BY Category
ORDER BY Mrp DESC) AS Price_Rank 
FROM Zepto;
-- 2. Compare product price with category average.
SELECT Name, Category, Mrp, 
AVG(Mrp) OVER(PARTITION BY Category) AS Category_Average
FROM Zepto;
-- 3. Top 3 most expensive products in each category
SELECT * FROM (SELECT Name, Category, Mrp,
ROW_NUMBER() OVER(PARTITION BY Category
ORDER BY Mrp DESC) AS rn
FROM Zepto) t
WHERE rn <= 3;


-- 4. Categories with above-average inventory value
WITH CategoryInventory AS (
SELECT Category,
SUM(Discounted_Selling_Price * Available_Quantity) AS Inventory_Value
FROM Zepto
GROUP BY Category)
SELECT * FROM CategoryInventory
WHERE Inventory_Value > ( SELECT AVG(Inventory_Value)
FROM CategoryInventory);
-- 5. High-value out of stock products
WITH OutOfStockProducts AS (
SELECT * FROM Zepto
WHERE Out_Of_Stock = TRUE )
SELECT Name, Category, Discounted_Selling_Price
FROM OutOfStockProducts
ORDER BY Discounted_Selling_Price DESC;


-- 6. Category Summary
CREATE VIEW vw_Category_Summary AS
SELECT c.Category_Name, COUNT(*) AS Total_Products,
ROUND(AVG(z.Discount_Percent),2) AS Avg_Discount,
SUM(z.Discounted_Selling_Price * z.Available_Quantity) AS Inventory_Value
FROM Zepto z
JOIN Categories c ON z.Category_Id = c.Category_id
GROUP BY c.Category_Name;

SELECT * FROM vw_Category_Summary;
-- 7. Premium Inventory
CREATE VIEW vw_Premium_Inventory AS
SELECT z.Name, c.Category_Name, p.Tier_Name, z.Mrp FROM Zepto z
JOIN Categories c ON z.Category_Id = c.Category_Id
JOIN Price_Tier p ON z.Tier_Id = p.Tier_Id
WHERE p.Tier_Name IN ('Premium','Luxury');

SELECT * FROM vw_Premium_Inventory;


-- 8. Frequntly searching by category
CREATE INDEX idx_category
ON Zepto(Category_Id);
-- 9. Frequently searching by stock status
CREATE INDEX idx_stock
ON Zepto(Out_Of_Stock);