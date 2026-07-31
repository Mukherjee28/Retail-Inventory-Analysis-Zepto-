-- BUSINESS ANALYSIS
-- 1. Which category has the most products?
SELECT Category, COUNT(*) AS Product_Count FROM Zepto
GROUP BY Category
ORDER BY Product_Count DESC;
-- 2. Which products should be restocked first?
SELECT Name, Category, Discounted_Selling_Price FROM Zepto
WHERE Out_Of_Stock = TRUE
ORDER BY Discounted_Selling_Price DESC;
-- 3. Which price tier generates the highest inventory value?
SELECT p.Tier_Name,
SUM(z.Discounted_Selling_Price * z.Available_Quantity) AS Inventory_Value
FROM Zepto z
JOIN Price_Tier p ON z.Tier_Id = p.Tier_Id
GROUP BY p.Tier_name
ORDER BY Inventory_Value DESC;
-- 4. Which categories have the highest percentage of out of stock products?
SELECT c.Category_Name,
ROUND(100.0 * SUM(CASE WHEN z.Out_Of_Stock THEN 1 ELSE 0 END) / COUNT(*),2) AS Out_Of_Stock_Percentage
FROM Zepto z
JOIN Categories c ON z.Category_Id = c.Category_Id
GROUP BY c.Category_Name
ORDER BY Out_Of_Stock_Percentage DESC;
-- 5. Which categories offer the highest average discount?
SELECT c.Category_Name,
ROUND(AVG(z.Discount_Percent),2) AS Avg_Discount
FROM Zepto z
JOIN Categories c ON z.Category_Id = c.Category_Id
GROUP BY c.Category_Name
ORDER BY Avg_Discount DESC;