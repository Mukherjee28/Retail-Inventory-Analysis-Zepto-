# 🛒 Retail Inventory Analysis using SQL (Zepto Dataset)
## 📌 Project Overview
This project analyzes a retail inventory dataset inspired by **Zepto**, one of India's leading quick-commerce platforms. The objective is to demonstrate end-to-end SQL skills by exploring, cleaning, validating, and analyzing inventory data to generate meaningful business insights.
The project is built entirely using **PostgreSQL** and covers both fundamental and advanced SQL concepts commonly used in real-world data analysis.

# 🎯 Objectives
- Explore and understand the inventory dataset.
- Assess and improve data quality through cleaning and validation.
- Answer real business questions using SQL.
- Demonstrate advanced SQL techniques such as Window Functions, CTEs, Views, and Indexes.
- Showcase relational database concepts using Joins.
- Generate actionable business insights for inventory management.

# 📂 Dataset Information
**Dataset:** Zepto Retail Inventory Dataset
**Total Products:** 3,731
**Product Categories:** 14

The dataset contains information including:
- Product Name
- Category
- MRP
- Discount Percentage
- Discounted Selling Price
- Available Quantity
- Weight
- Stock Status

# 🗄 Database Design
The project uses a normalized relational database consisting of three tables:
### 1. Zepto
Stores product-level inventory information.
### 2. Categories
Stores category details.
### 3. Price_Tier
Classifies products into:
- Budget
- Mid Range
- Premium
- Luxury

Relationships are maintained using foreign keys:
- `Category_ID`
- `Tier_ID`

# 📁 Project Structure
Retail-Inventory-Analysis-Zepto/
│
├── Database_Tables_SQL_Project.sql
├── Data_Exploration_SQL_Project.sql
├── Data_Cleaning_SQL_Project.sql
├── Data_Validation_SQL_Project.sql
├── Business_Questions_SQL_Project.sql
├── Joins_SQL_Project.sql
├── Demonstrating_Functions_SQL_Project.sql
├── zepto_v2_dataset.csv
├── ProjectFindings.md
└── README.md

# 🛠 SQL Concepts Demonstrated
### Basic SQL
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- CASE Statements

### Data Cleaning
- Duplicate Detection
- Missing Value Validation
- Invalid Price Detection
- Invalid Weight Detection
- Category Validation

### Data Validation
- Discount Validation
- Stock Validation
- Inventory Validation
- Pricing Validation
- Inventory Value Calculation

### Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- SELF JOIN
- CROSS JOIN

### Advanced SQL
- Common Table Expressions (CTEs)
- Window Functions
- Views
- Indexes
- Ranking Functions
- ROW_NUMBER()
- RANK()

# 📊 Business Questions Answered
The project answers several real-world business questions, including:

- Which category contains the highest number of products?
- Which products should be restocked first?
- Which price tier contributes the highest inventory value?
- Which categories have the highest percentage of out-of-stock products?
- Which categories offer the highest average discount?
- Which products are premium-priced within their categories?
- Which categories contribute the highest inventory investment?

# 📈 Key Findings
- The inventory contains **3,731 products** across **14 categories**.
- **Munchies** and **Cooking Essentials** have the largest product assortment.
- **453 products** are currently out of stock.
- **Mid Range** products contribute the highest inventory value.
- **Fruits & Vegetables** offer the highest average discount.
- Data quality is high, with no NULL values or invalid pricing records.
- Window Functions, Views, CTEs, and Indexes improved analytical capability and query performance.

A detailed summary is available in **ProjectFindings.md**.

# 💻 Technologies Used
- PostgreSQL
- pgAdmin 4
- SQL
- Git
- GitHub

# 📚 Skills Demonstrated
- Relational Database Design
- Data Exploration
- Data Cleaning
- Data Validation
- Business Analysis
- SQL Optimization
- Query Performance Improvement
- Inventory Analytics
- Data Quality Assessment
- Business Intelligence using SQL

# 🚀 Future Improvements
Future enhancements for this project include:
- Building an interactive Power BI dashboard.
- Performing inventory forecasting using Python.
- Developing SQL stored procedures and triggers.
- Automating data validation workflows.
- Integrating the project into a complete ETL pipeline.

# 👩‍💻 Author
**Sakshi Mukherjee**
B.Tech Computer Science Graduate (2026)
Aspiring Data/Business Analyst | SQL | Python | Excel | Power BI | Tableau
GitHub: https://github.com/Mukherjee28

## ⭐ If you found this project useful, consider giving the repository a star!
