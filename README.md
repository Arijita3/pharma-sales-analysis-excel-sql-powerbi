💊 Pharma Sales Analysis (2020–2025)
Turning raw pharmaceutical transaction data into actionable business intelligence for revenue growth, demand forecasting, and supply chain optimization.
________________________________________
📌 Overview
This project analyzes a global pharmaceutical sales dataset (2020–2025) containing 175,361 daily transaction records across multiple medicines, categories, regions, and customer demographics.
The analysis focuses on uncovering revenue drivers, seasonal demand patterns, inventory risks, post-COVID market behavior, and product performance trends.
Designed as an end-to-end analytics project, this repository demonstrates the complete workflow from Excel data cleaning, SQL business analysis, and Power BI dashboard development to executive-level business storytelling.
The project simulates real-world pharmaceutical analytics used by healthcare organizations for:
•	Revenue Optimization
•	Demand Forecasting
•	Inventory Risk Management
•	Regional Sales Strategy
•	Product Portfolio Evaluation
________________________________________
🎯 Key Business Questions Answered
•	Which regions contribute the highest pharmaceutical revenue globally?
•	Which medicines consistently generate the highest sales across categories?
•	How did pharmaceutical demand change during and after COVID-19?
•	Which age groups generate the highest medicine revenue?
•	What seasonal trends exist for Antibiotic and Cough & Cold medicines?
•	Which countries face the highest inventory and expiry risks?
•	Which medicines are at the greatest risk of stock-outs or near expiry?
•	How resilient was the pharmaceutical portfolio after the COVID revenue spike?
________________________________________
📊 Dataset Summary
Attribute	Details
Dataset Type	Global Pharmacy Sales Transactions
Time Period	2020–2025
Total Records	175,361 Daily Transactions
Geographic Coverage	Global Regions & Countries
Key Dimensions	Region, Country, Medicine, Category, Age Group
Business Metrics	Revenue, Units Sold, Inventory, Expiry Risk
Analysis Focus	Sales Trends, Supply Chain Risk, Product Performance
________________________________________
🛠️ Tools & Technologies
Tool	Purpose
Microsoft Excel	Data cleaning, preprocessing, exploratory data analysis (EDA), KPI validation
SQL	Business analysis, ranking, aggregation, trend analysis, inventory risk analysis
Power BI	Interactive dashboards, DAX measures, forecasting, executive reporting, data storytelling
 <img width="1920" height="1080" alt="MODEL" src="https://github.com/user-attachments/assets/5aaf8f96-5d80-42a3-8c72-64e7b136b120" />

________________________________________
🔄 Project Workflow
1️⃣ Data Collection
•	Imported the global pharmaceutical sales dataset
•	Validated data formats and consistency
2️⃣ Excel Data Cleaning & EDA
•	Removed duplicates
•	Handled missing values
•	Standardized category and regional fields
•	Created Pivot Tables
•	Built an Excel dashboard for exploratory analysis
3️⃣ SQL Business Analysis
•	Revenue analysis by region, category, and medicine
•	Inventory risk assessment
•	Stock-out analysis
•	COVID vs Post-COVID comparison
•	Year-over-Year (YoY) growth analysis
•	Seasonal demand analysis
4️⃣ Power BI Dashboard Development
•	Built three executive dashboards
•	Created advanced DAX measures
•	Designed KPI cards
•	Added slicers and drill-down capabilities
•	Built forecasting and heatmap visualizations
5️⃣ Business Storytelling
•	Converted technical analysis into executive insights
•	Generated strategic business recommendations
•	Simulated real-world pharmaceutical decision making
________________________________________
📈 Key Insights & Findings
•	🌍 East Asia generated the highest pharmaceutical revenue, contributing more than $519M, followed by South America and Europe.
•	💊 Paracetamol remained the highest revenue-generating medicine with approximately $417M in sales.
•	👨‍⚕️ The 46–65 age group generated the highest revenue, especially for chronic and antibiotic medicines.
•	📦 Nearly 9% of total revenue was associated with medicines having fewer than 90 days until expiry, highlighting inventory risk.
•	🦠 Revenue peaked during the COVID period at approximately $947M annually, followed by stabilization driven by chronic and wellness medicine demand.
•	📈 Antipyretic medicines experienced approximately 23% post-COVID sales growth, suggesting long-term preventive healthcare trends.
•	🌡️ Strong seasonal demand spikes were observed during Q1 for Antibiotic and Cough & Cold medicines.
________________________________________
💼 Business Recommendations
Revenue Growth
•	Increase product availability in high-performing regions.
•	Expand successful product categories into emerging markets.
Inventory Optimization
•	Prioritize clearance of near-expiry medicines.
•	Improve replenishment planning.
Demand Forecasting
•	Build inventory ahead of seasonal demand.
•	Use predictive forecasting for procurement planning.
Customer Strategy
•	Develop targeted campaigns for customers aged 46–65 years.
•	Promote preventive healthcare products among younger demographics.
Regional Strategy
•	Investigate low-performing regions to improve pricing, distribution, and marketing strategies.
________________________________________
📷 Dashboard Preview
Executive Summary Dashboard
Provides a high-level overview of business performance.
KPIs
•	Total Revenue
•	Total Units Sold
•	Top Performing Medicine
•	Worst Performing Region
•	Near Expiry Inventory
Visualizations
•	Revenue Trend
•	YoY Growth
•	Revenue by Category
•	Revenue by Region
•	Monthly Sales Trend
•	Geographic Revenue Distribution
 <img width="1419" height="818" alt="executive_summary" src="https://github.com/user-attachments/assets/fa8e8e24-6a6f-4c1a-9e2d-97cae4a38d22" />

(Screenshot: assets/executive_summary.png)
________________________________________
Medicine & Category Deep Dive
Provides detailed product performance analysis.
Includes:
•	Revenue by Medicine
•	Revenue by Age Group
•	Monthly Sales Trend
•	COVID vs Post-COVID Comparison
•	Product Ranking
•	Category Performance
 <img width="1480" height="840" alt="medicine-and-category-deepdrive" src="https://github.com/user-attachments/assets/a054aae3-4a17-42dc-aa18-ecfddc32d913" />

Screenshot: assets/medicine-and-category-deepdrive.png)
________________________________________
Supply Chain Risk Overview
Designed for inventory management.
Includes:
•	Near Expiry Medicines
•	Stock Risk
•	Inventory Value
•	High Risk Products
•	Expiry Risk Heatmap
•	Region-wise Inventory Analysis
Interactive slicers allow users to drill into regions, medicines, categories, age groups, and time periods.
 <img width="1440" height="838" alt="supply-chain" src="https://github.com/user-attachments/assets/42c2755b-40f5-4be4-9e95-135bdfb739b5" />

(Screenshot: assets/supply-chain.png)
________________________________________
🧠 SQL Highlights
Revenue by Region
SELECT
    region,
    ROUND(SUM(unit_price * units_sold),2) AS total_revenue
FROM global_pharmacy_sales
GROUP BY region
ORDER BY total_revenue DESC;
Top 3 Medicines by Revenue Within Each Category
WITH medicine_rank AS (
    SELECT
        category,
        medicine,
        SUM(unit_price * units_sold) AS revenue,
        DENSE_RANK() OVER(
            PARTITION BY category
            ORDER BY SUM(unit_price * units_sold) DESC
        ) AS rank_num
    FROM global_pharmacy_sales
    GROUP BY category, medicine
)

SELECT *
FROM medicine_rank
WHERE rank_num <= 3;
________________________________________
🗂️ Repository Structure
Pharma-Sales-Analysis/
│
├── data/
│   ├── global_pharmacy_sales_2020_2025_daily_dataset.csv
│   └── sample_dataset.xlsx
│
├── excel/
│   └── pharma-sales-analysis.xlsm
│
├── sql/
│   ├── pharma_sales_queries.sql
│   └── pharma-sales-project-sql-insight.docx
│
├── powerbi/
│   ├── pharma_sales_dashboard.pbix
│   └── dax_measures.docx
│
├── assets/
│   ├── excel_dashboard.png
│   ├── executive_summary.png
│   ├── supply-chain.png
│   └── medicine-and-category-deepdrive.png
│   └── MODEL.png
│
├── insights/
│   └── business_insights.pdf
│
└── README.md
________________________________________
🚀 How to Explore This Project
Option 1 — Browse Online
Explore:
•	Dashboard screenshots
•	SQL scripts
•	DAX measures
•	Business insights
•	Excel analysis
Option 2 — Download Repository
Open:
•	Excel workbook
•	SQL scripts
•	Power BI (.pbix) dashboard
Option 3 — Power BI
Open the PBIX file using Microsoft Power BI Desktop.
Explore:
•	KPI Cards
•	Interactive Slicers
•	Forecasting
•	Regional Performance
•	Supply Chain Monitoring
________________________________________
🎓 Learning Outcomes
Through this project, I developed practical experience in:
•	End-to-end Business Intelligence solutions
•	Advanced SQL analysis
•	Interactive Power BI dashboard development
•	KPI design
•	Executive reporting
•	Pharmaceutical sales analytics
•	Supply chain analytics
•	Business storytelling
________________________________________
🚀 Future Enhancements
Planned improvements include:
•	Python-based demand forecasting
•	Machine Learning sales prediction
•	Automated ETL pipeline
•	Power BI Service deployment
•	Row-Level Security (RLS)
•	Incremental Refresh
•	Real-time dashboard integration
________________________________________
👩‍💻 About the Author
Arijita Manna
Pharmaceutical professional transitioning into Business Analytics with expertise in:
•	Pharmaceutical Domain Knowledge
•	Business Intelligence
•	Power BI Dashboard Development
•	SQL Analytics
•	Excel Reporting
•	KPI Design
•	Supply Chain Analytics
•	Data Storytelling
I am passionate about transforming complex healthcare and business datasets into actionable insights that support strategic decision-making.
Connect With Me
•	🔗 LinkedIn: https://www.linkedin.com/in/arijita-manna-b47156143/
________________________________________
📄 License
This project is intended for educational and portfolio purposes only.
________________________________________
⭐ Support
If you found this project helpful or interesting, consider giving this repository a ⭐ Star. Your support is greatly appreciated!


