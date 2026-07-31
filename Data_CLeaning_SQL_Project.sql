-- DATA CLEANING
-- 1. Are there duplicate products with same details?
SELECT Category, Name, Mrp, Discounted_Selling_Price, Weight_In_Gms, 
COUNT(*) AS Duplicate_Count FROM Zepto
GROUP BY Category, Name, Mrp, Discounted_Selling_price, Weight_In_Gms 
HAVING COUNT(*) > 1;                                     --(Found 11 rows)
-- 2. Check for category inconsistencies.
SELECT Name, COUNT(DISTINCT Category) AS Category_Count
FROM Zepto
GROUP BY Name
HAVING COUNT(DISTINCT Category) > 1;                      -- (Found 1190 rows)
-- 3. Are there products with impossible discounts?
SELECT * FROM Zepto
WHERE Discount_Percent < 0 OR
Discount_Percent > 100;
-- 4. Does discounted price exceed Mrp?
SELECT * FROM Zepto
WHERE Discounted_Selling_Price > Mrp;
-- 5. Find products having invalid weights.
SELECT * FROM Zepto
WHERE Weight_In_Gms <=0;                                   -- (Found 4 rows)
-- 6. Check for missing category names after trimming spaces.
SELECT * FROM Zepto
WHERE TRIM(Category) = '';
-- 7. Check for NULL values
SELECT * FROM Zepto
WHERE Name IS NULL OR Category IS NULL OR
Mrp IS NULL OR Discounted_Selling_Price IS NULL OR
Discount_Percent IS NULL OR Available_Quantity IS NULL OR
Weight_In_Gms IS NULL OR Out_Of_Stock IS NULL OR
Quantity IS NULL OR Category_Id IS NULL OR
Tier_Id IS NULL;
-- 8. Check for negative status
SELECT * FROM Zepto
WHERE Mrp < 0 OR Discounted_Selling_Price < 0 OR
Available_Quantity < 0 OR Quantity < 0;