# Amazon Sales Analysis Project

## 📊 Project Overview
This project performs a comprehensive analysis of **Amazon sales data** using **MS SQL Server**. The dataset consists of three major tables: `Customers`, `Orders`, and `Products`, each containing 10,000+ records. The goal is to clean the data, remove duplicates/nulls, perform transformations, and extract actionable insights using advanced SQL queries.

---

## 🗂️ Datasets Used

- **Customers**: Contains customer details like ID, name, email, city, and join date.
- **Orders**: Includes order ID, customer ID, order date, amount, shipping method, and status.
- **Products**: Contains product ID, name, category, price, stock, and supplier.

---

## 🔧 Key SQL Operations Performed

### 1. 🧹 Data Cleaning
- Removed **NULL values** and **duplicates** from all three tables.
- Checked for data integrity across relationships (`CustomerID`, `OrderID`, `ProductID`).
- Rounded numeric fields (`Amount`, `Price`) to 2 decimal places.

### 2. 🔄 Data Transformation
- Created `FullName` column by combining `FirstName` and `LastName`.
- Dropped unnecessary columns after transformation.
- Created `Final_Table` using a `CTE` with a `RIGHT JOIN` between customers and orders.

### 3. 📈 Data Analysis Queries
- Calculated **total sales per customer**, **per city**, and **per shipping method**.
- Used `DENSE_RANK()` for ranking based on `Amount`.
- Counted number of orders by **status** and **shipping method**.
- Calculated **total price by product category**, **stock statistics**, and **min/max prices**.
- Extracted **duration metrics** like years/months/days between first and last orders/join dates.

---

## 🧠 Insights & Observations

- Data spans **7 years** of customer activity and **3 years** of order history.
- Identified top customers by **total amount spent**.
- Analyzed **city-wise revenue** and **shipping method efficiency**.
- Categorized products by **price** and **stock levels**.
- No duplicate entries or missing values after data cleaning.

---

## ⚙️ Tools & Technologies

- **MS SQL Server**
- **SQL Management Studio (SSMS)**
- **Relational Database Concepts**
- **Window Functions, CTEs, Joins, Aggregates**

---

## 📁 File Structure

📦 AmazonSalesAnalysis/
┣ 📄 SQLQuery amazon project.sql
┗ 📄 README.md



**Thanks you **  
Rohit Sharma