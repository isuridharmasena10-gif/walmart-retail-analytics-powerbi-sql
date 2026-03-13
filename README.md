# Walmart Retail Analytics - Power BI & SQL

## 📌 Project Overview
This project is an end-to-end retail analytics solution using SQL and Power BI to analyze Walmart-style transactional data. The focus is on providing actionable business insights, product performance metrics, and delivering a clean, user-friendly dashboard UI/UX. SQL is used for data validation, while Power BI is used to design interactive dashboards for decision-making.

## 📊 Dashboard Pages
### 1️⃣ Executive Summary
Provides an overview of the business performance:
- **Total Revenue**
- **Total Orders**
- **Average Order Value (AOV)**
- **Average Items per Order**
- **Orders by Day of Week**
- **Orders by Month**
- **Revenue by Product Category**

This page serves as a quick snapshot for executives to gauge overall performance.

### 2️⃣ Product Overview
Focuses on individual product-level performance:
- **Top Products by Revenue**
- **Top Products by Quantity Sold**
- **Product-specific KPIs** (Revenue, Quantity Sold, etc.)
- **Product Contribution Table** showing:
  - Revenue per product
  - Percentage contribution to total revenue
  - Quantity sold

The visuals were designed to minimize redundancy and prioritize clarity.
![Product Overview](data/product%20overview.png)

### 3️⃣ Customer Overview
Displays key customer metrics:
- **Total Customers** 
- **Avg Orders per Customer**
- **Avg Sales per Customer**
- **Total Customers by State**
- **Top Customers by Sales**
![Customer Overview](data/customer%20overview.png)

### 4️⃣ Sales Overview
A comprehensive view of sales performance:
- **Total Sales by Category**
- **Total Profit**
- **Total Orders**
- **Sales YoY Growth**
![Sales Overview](data/sales_summary.png)

## 🎨 Dashboard Design
- **Minimalist design** to prioritize readability and performance.
- **Consistent visual hierarchy** and KPI cards.
- Focused on **business storytelling** and user experience.

## 🗄️ SQL Usage
SQL was used to support the analytics workflow by:
- Validating **KPIs** (revenue, orders, quantities).
- Identifying **top products** by revenue and volume.
- Analyzing sales by **category** and **size**.
- Exploring **monthly** sales trends.
- Performing **data quality checks** (distinct counts, null values).


## 🛠 Tools & Technologies
- **Power BI Desktop**
- **SQL** (MySQL/PostgreSQL)
- **DAX**
- **Power Query**
- **Excel** (data source)

## 📁 Repository Structure
- `/sql`: Contains SQL scripts for data transformation and analysis.
- `/dashboard`: The Power BI dashboard file (`dashboard.pbix`).
- `/images`: Includes visuals like product overviews, sales summaries, and customer details.

## 🧠 Key Design Decisions
- **Customer-level data** was not included due to its unavailability in the dataset.
- Limited dashboard pages to avoid redundancy and improve clarity.
- Focused on delivering **accurate insights** based solely on the available data.

## 🚀 Outcome
This project demonstrates the ability to:
- Translate raw transactional data into **meaningful business insights**.
- Use **SQL** for data validation and analysis.
- Build **clean, user-focused Power BI dashboards**.
- Make thoughtful, **data-driven design decisions**.

### 📌 This project was developed as a **portfolio project** to showcase data analytics and business intelligence skills.

---

Feel free to explore and interact with the dashboards to analyze Walmart-style transactional data and uncover valuable insights.
