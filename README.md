# Customer Sales & Feedback Analysis (SQL Project)

## 📌 Project Overview
This project is focused on analyzing customer behavior, sales performance, and feedback using **SQL**.  
The dataset is structured with three main tables:  
- **Customers**
- **Orders**
- **Feedback**  

The project demonstrates how SQL can be used to answer **real-world business questions** such as sales trends, customer activity, product performance, and feedback insights.

---

## 🛠️ Tools & Skills Used
- SQL (Joins, Aggregations, Group By, Order By, Limit)
- PostgreSQL Functions (DATE_TRUNC, TO_CHAR)
- Business-Oriented Query Writing

---

## 📂 Database Schema
### Customers Table
- Customer_ID (PK)  
- Name  
- Gender  
- Age  
- City  
- State  
- Join_Date  

### Orders Table
- Order_ID (PK)  
- Customer_ID (FK)  
- Order_Date  
- Product_Category  
- Amount  

### Feedback Table
- Feedback_ID (PK)  
- Customer_ID (FK)  
- Order_ID (FK)  
- Rating  
- Review_Text  

---

## 🔎 Business Queries Implemented
Below are the **12 SQL queries** included in this project:

1. Count of customers by city  
2. Active vs. Inactive customers  
3. Total sales by product category  
4. Total sales by city  
5. Top 5 highest order values  
6. Top 5 best-selling product categories  
7. Average order value per customer  
8. Average rating by product category  
9. Monthly sales trend  
10. Most reviewed customers  
11. Sales by state  
12. Highest & lowest rated product categories  
13. Monthly average rating trend  

---

## 📊 Key Insights
- Identified top product categories driving revenue  
- Found states and cities with the highest sales concentration  
- Compared customer activity levels (active vs inactive)  
- Analyzed customer feedback trends over time  

---

## 🚀 How to Use
1. Clone this repository:  
   ```bash
   git clone https://github.com/yourusername/Customer-Sales-Feedback-SQL-Project.git
   ```
2. Load the database schema & insert sample data.  
3. Run queries from `project.sql` to reproduce insights.  

---

## 📌 Author
👤 **Arpit Tiwari**  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/arpit-tiwari-286835380)

---

⭐ If you found this project helpful, don’t forget to give it a star!
