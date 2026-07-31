-- JOINS
-- 1. Display every product along with its category and price tier.
SELECT z.Name, c.Category_Name, p.Tier_Name, z.Mrp, z.Discounted_Selling_Price
FROM Zepto z
INNER JOIN Categories c ON z.Category_Id = c.Category_Id
INNER JOIN Price_Tier p ON z.Tier_Id = p.Tier_Id
ORDER BY c.Category_Name, z.Name;
-- 2. Which categories currently have no products assigned to them?
SELECT c.Category_Name,
COUNT(z.Sku_Id) AS Total_Products FROM Categories c
LEFT JOIN Zepto z ON c.Category_Id = z.Category_Id
GROUP BY c.Category_Name
HAVING COUNT(z.Sku_Id) = 0;
-- 3. Show every price tier along with the products assigned to it, including tiers with no products.
SELECT p.Tier_Name, z.Name, z.Mrp
FROM Zepto z
RIGHT JOIN Price_Tier p ON z.Tier_Id = p.Tier_Id
ORDER BY p.Tier_Id;
-- 4. Find categories that don't have products and products that don't have a matching category.
SELECT c.Category_Name, z.Name
FROM Categories c
FULL OUTER JOIN Zepto z ON c.Category_Id = z.Category_Id
WHERE c.Category_Id IS NULL OR
z.Category_Id IS NULL;
-- 5. Find products in the same category that have the same MRP but have different products.
SELECT z1.Name AS Product_1, z2.Name AS Product_2, z1.Category, z1.Mrp
FROM Zepto z1
JOIN Zepto z2 ON z1.Category_Id = z2.Category_Id
AND z1.Mrp = z2.Mrp AND z1.Sku_Id < z2.Sku_Id
ORDER BY z1.Category, z1.Mrp;
-- 6. Generate every possible combination of categories and price tiers to identify missing category-tier combinations.
SELECT c.Category_Name, p.Tier_Name
FROM Categories c
CROSS JOIN Price_Tier p;