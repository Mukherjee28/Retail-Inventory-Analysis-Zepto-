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


-- Creating Categories Table
CREATE TABLE IF NOT EXISTS Categories(
Category_Id SERIAL PRIMARY KEY,
Category_Name VARCHAR(100) UNIQUE);
-- Inserting values in Categories table
INSERT INTO Categories(Category_Name)
SELECT DISTINCT Category FROM Zepto
ORDER BY Category;
-- Add Category_Id to Zepto
ALTER TABLE Zepto
ADD COLUMN Category_Id INT;
-- Fill Category_Id
UPDATE Zepto z SET Category_Id = c.Category_Id
FROM Categories c
WHERE z.Category = c.Category_name;
-- Adding Foreign Key
ALTER TABLE Zepto
ADD CONSTRAINT fk_categories
FOREIGN KEY (Category_Id)
REFERENCES Categories(Category_Id);


-- Creating Price Tier Table
CREATE TABLE Price_Tier(
Tier_Id INT PRIMARY KEY,
Tier_Name VARCHAR(30),
Min_Price INT,
Max_Price INT);
-- Inserting values in Price_Tier table
INSERT INTO Price_Tier (Tier_Id, Tier_Name, Min_Price, Max_Price)
VALUES (4, 'Luxury', 601, 100000);
(1, 'Budget', 0, 100),
(2, 'Mid Range', 101, 300),
(3, 'Premium', 301, 600),
(4, 'Luxury', 601, 100000);
-- Add Tier_Id To Zepto
ALTER TABLE Zepto
ADD COLUMN Tier_Id INT;
-- Fill Tier_Id
UPDATE Zepto z SET Tier_Id = p.Tier_Id
FROM Price_Tier p
WHERE z.Mrp BETWEEN p.Min_Price AND p.Max_Price;
-- Adding Foreign Key
ALTER TABLE Zepto
ADD CONSTRAINT fk_price_tier
FOREIGN KEY (Tier_Id)
REFERENCES Price_Tier(Tier_Id);


SELECT * FROM Categories;
SELECT * FROM Price_Tier;
SELECT * FROM Zepto;


UPDATE Price_Tier SET Max_Price = 100000 WHERE Tier_Id = 4;
UPDATE Zepto z SET Tier_Id = p.Tier_Id FROM Price_Tier p WHERE z.Mrp BETWEEN p.Min_Price AND p.Max_Price;
SELECT * FROM Zepto WHERE Tier_Id IS NULL;