-- DATA VALIDATION
-- 1. Does the stored discount match the actual discount?
SELECT Name, Mrp, Discounted_Selling_Price, Discount_Percent,
ROUND(((Mrp - Discounted_Selling_Price) / Mrp) * 100, 2) AS Calculated_Discount
FROM Zepto
WHERE ABS(ROUND(((Mrp - Discounted_Selling_Price) / Mrp) * 100, 2) - Discount_Percent) > 1;   
-- 2. Find products marked out of stock but still showing inventory.
SELECT * FROM Zepto
WHERE Out_Of_Stock = TRUE AND Available_Quantity > 0;
-- 3. Find products in stock but quantity is zero.
SELECT * FROM Zepto
WHERE Out_Of_Stock = FALSE AND Available_Quantity = 0;
-- 4. Find unusually expensive products
SELECT * FROM Zepto
WHERE Mrp > (SELECT AVG(Mrp) * 2 FROM Zepto);
-- 5. Products having very high inventory value.
SELECT Name, Category, Discounted_Selling_Price, Available_Quantity,
Discounted_Selling_Price * Available_Quantity AS Inventory_Value
FROM Zepto
ORDER BY Inventory_Value DESC;                                        -- Found 3731 rows