DROP TABLE IF EXISTS Zepto;

CREATE TABLE Zepto(
Sku_Id SERIAL PRIMARY KEY,
Category VARCHAR(120),
Name VARCHAR(150) NOT NULL,
Mrp NUMERIC(8,2),
Discount_Percent NUMERIC(5,2),
Available_Quantity INTEGER,
Discounted_Selling_Price NUMERIC(8,2),
Weight_In_Gms INTEGER,
Out_Of_Stock BOOLEAN,
Quantity INTEGER
);

-- Data Exploration

-- Count of Rows
SELECT COUNT(*) FROM Zepto; -- Found 3732 rows

-- Sample Data
SELECT * FROM Zepto
Limit 20;

-- Null Values
SELECT * FROM Zepto
WHERE Name IS NULL OR
Category IS NULL OR 
Mrp IS NULL OR
Discount_Percent IS NULL OR 
Available_Quantity IS NULL OR 
Discounted_Selling_Price IS NULL OR 
Weight_In_Gms IS NULL OR 
Out_Of_Stock IS NULL OR 
Quantity IS NULL; -- Found 0 rows

-- Different Product Categories
SELECT DISTINCT Category FROM Zepto
ORDER BY Category; -- Found 14 rows

-- Producs In Stock vs Out of stock
SELECT Out_Of_Stock, COUNT(Sku_Id)
FROM Zepto
GROUP BY Out_Of_Stock; -- Found 453 True and 3279 False

-- Product Names Present Multiple Times
SELECT Name, COUNT(Sku_Id) AS "Number_Of_SKUs"
FROM Zepto
GROUP BY Name
HAVING COUNT(Sku_Id) > 1
ORDER BY COUNT(Sku_Id) DESC; -- Multiple Rows Found

-- Data Cleaning

-- Products With Price = 0
SELECT * FROM Zepto
WHERE Mrp = 0 OR Discounted_Selling_Price = 0; -- Found 1 row

DELETE FROM Zepto
WHERE Mrp = 0;

-- Convert Paise To Rupees in Mrp Column
UPDATE Zepto 
SET Mrp = Mrp/100.0,
Discounted_Selling_Price = Discounted_Selling_Price/100.0;

SELECT Mrp, Discounted_Selling_Price FROM Zepto;

-- Answering Business Questions

-- Q1. Find the top 10 best value products based on the discount percentage.
SELECT DISTINCT Name, Mrp, Discount_Percent FROM Zepto
ORDER BY Discount_Percent DESC
LIMIT 10;

-- Q2. What are the products with high MRP but out of stock?
SELECT DISTINCT Name, Mrp FROM Zepto
WHERE Mrp > 300 AND Out_Of_Stock = TRUE
ORDER BY Mrp DESC;

-- Q3. Calculate estimated revenue for each category.
SELECT Category, 
SUM(Discounted_Selling_Price * Available_Quantity) AS Total_Estimated_Revenue
FROM Zepto
GROUP BY Category
ORDER BY Total_Estimated_Revenue;

-- Q4. Find all products where MRP is greater than 500 rupees and discount is less than 10%.
SELECT DISTINCT Name, Mrp, Discount_Percent 
FROM Zepto
WHERE MRP > 500 AND Discount_Percent < 10
ORDER BY Mrp DESC, Discount_Percent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT Category, AVG(Discount_Percent) AS Avg_Discount 
FROM Zepto
GROUP BY Category
ORDER BY Avg_Discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT Name, Weight_In_Gms, Discounted_Selling_Price,
ROUND(Discounted_Selling_Price/Weight_In_Gms, 2) AS Price_Per_Gram 
FROM Zepto
WHERE Weight_In_Gms >= 100
ORDER BY Price_Per_Gram;

-- Q7. Group the products into categories like Low, Medium and Bulk.
SELECT DISTINCT Name, Weight_In_Gms,
	CASE
		WHEN Weight_In_Gms < 1000 THEN 'Low'
		WHEN Weight_In_Gms < 5000 THEN 'Medium'
		ELSE 'Bulk'
	END AS Weight_Category
FROM Zepto;

-- Q8. What is the total inventory weight per category?
SELECT Category, 
SUM(Weight_In_Gms * Available_Quantity) AS Total_Weight 
FROM Zepto
GROUP BY Category
ORDER BY Total_Weight;
