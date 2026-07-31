# Project Findings
## Overview
This document summarizes the key findings obtained from exploratory analysis, data quality assessment, validation checks, business analysis, advanced SQL techniques, and join operations performed on the Zepto Inventory dataset.
The analysis was conducted using PostgreSQL and demonstrates SQL concepts ranging from basic data exploration to advanced analytical queries using Window Functions, CTEs, Views, Indexes, and Joins.

# 1. Data Exploration
### Key Findings
- The dataset contains **3,731 products**, providing sufficient data for meaningful analysis.
- Products are distributed across **14 unique categories**, representing a diverse grocery inventory.
- Product prices range from **₹10** to **₹2,600**, with an average MRP of **₹156.84**, indicating a mix of budget and premium products.
- Approximately **87.9%** of products are currently in stock, while **12.1%** are out of stock.
- **Munchies** and **Cooking Essentials** contain the largest number of products (**514 each**), followed by Packaged Food, Ice Cream & Desserts, and Chocolates & Candies.
### Business Impact
The exploratory analysis provides a clear understanding of the inventory structure, pricing distribution, category diversity, and stock availability, establishing a strong foundation for further business analysis.

# 2. Data Cleaning
### Key Findings
- Only **11 duplicate records** were identified and retained because they represent legitimate repeated inventory listings.
- **1,190 products** appear under multiple categories, indicating intentional cross-category placement.
- No invalid discount percentages were detected.
- No selling prices exceed their corresponding MRP.
- Only **4 products** contain invalid weight values requiring manual review.
- No blank category names were found.
- No NULL values exist in any critical business columns.
- No negative pricing or inventory values were detected.
### Business Impact
The dataset demonstrates a high level of data quality and consistency. Minimal data quality issues ensure that subsequent analysis and reporting can be performed with confidence.

# 3. Data Validation
### Key Findings
- Stored discount percentages accurately match calculated discount values.
- No products are incorrectly marked as out of stock while inventory is available.
- No products are incorrectly marked as available despite having zero inventory.
- Premium-priced products were successfully identified using statistical thresholds.
- Inventory value was calculated for every product, enabling financial prioritization.
### Business Impact
The validation process confirms that pricing and inventory data follow essential business rules, making the dataset reliable for KPI reporting, inventory management, and business intelligence.

# 4. Business Analysis
### Key Findings
- **Munchies** and **Cooking Essentials** have the highest number of products (**514 each**).
- **453 products** are currently out of stock, including several high-value products requiring replenishment.
- **Mid Range** products contribute the highest inventory value (**₹1,159,675.60**).
- **Biscuits** have the highest stock-out percentage (**28.57%**), followed by Beverages and Dairy, Bread & Butter.
- **Fruits & Vegetables** provide the highest average discount (**15.46%**).
### Business Impact
These findings help prioritize inventory replenishment, optimize pricing strategies, improve stock availability, and identify categories that contribute most to inventory investment.

# 5. Advanced SQL Analysis
### Key Findings
Advanced SQL techniques were implemented using:
- Window Functions
- Common Table Expressions (CTEs)
- Views
- Indexes

The analysis successfully:
- Ranked products within categories.
- Compared products with category averages.
- Identified the Top 3 premium products in every category.
- Calculated inventory value by category.
- Identified high-value out-of-stock products.
- Created reusable category summary and premium inventory views.
- Improved query performance through indexing.
### Business Impact
Advanced SQL features transformed raw inventory data into actionable business intelligence while improving query efficiency, database scalability, and report reusability.

# 6. Join Analysis
### Key Findings
The project demonstrates practical use of:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- SELF JOIN
- CROSS JOIN

Key observations include:
- Every product is successfully linked with a valid category and price tier.
- No unused categories exist.
- Every price tier contains products.
- No orphan records were detected.
- Products with identical MRPs within the same category were identified.
- Generated all possible Category–Price Tier combinations (56 total).
### Business Impact
The join operations validate referential integrity and demonstrate how normalized relational databases support efficient business reporting and analysis.

# Overall Project Summary
This SQL project demonstrates the complete workflow of inventory analysis using PostgreSQL.
The project includes:
- Data Exploration
- Data Cleaning
- Data Validation
- Business Analysis
- Advanced SQL (Window Functions, CTEs, Views & Indexes)
- Relational Database Design
- SQL Joins
- Business Insights

Throughout the analysis, the dataset exhibited strong data quality with very few inconsistencies. SQL was used not only to retrieve information but also to validate business rules, identify inventory trends, evaluate pricing strategies, optimize database performance, and generate actionable business insights.

The project reflects practical SQL skills applicable to real-world inventory management, pricing analysis, and business intelligence, making it suitable for Data Analyst, Business Analyst, and SQL Developer portfolio demonstrations.
