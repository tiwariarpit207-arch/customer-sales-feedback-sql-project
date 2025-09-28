/* ==========================================================
   CUSTOMER SALES & FEEDBACK ANALYSIS PROJECT
   Database: customers, orders, feedback
   Author: [ARPIT TIWARI]
   ========================================================== */

/* =====================
   1. CUSTOMER ANALYSIS
   ===================== */

-- 1. Total customers by city
SELECT city, COUNT(customer_id) AS total_customers
FROM customers
GROUP BY city
ORDER BY city ASC;

-- 2. Active vs inactive customers
SELECT 'Active' AS status, COUNT(DISTINCT customer_id) AS count_customers
FROM orders
UNION
SELECT 'Inactive' AS status, COUNT(*) 
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

-- 3. Most reviewed customers
SELECT c.customer_id, c.name, COUNT(f.rating) AS no_of_reviews
FROM feedback AS f
JOIN customers AS c ON c.customer_id = f.customer_id
GROUP BY c.customer_id, c.name
ORDER BY no_of_reviews DESC;


/* =====================
   2. SALES ANALYSIS
   ===================== */

-- 4. Total sales by product category
SELECT product_category, SUM(amount) AS total_sales
FROM orders
GROUP BY product_category
ORDER BY total_sales DESC;

-- 5. Total sales by city
SELECT c.city, SUM(o.amount) AS total_sales
FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_sales DESC;

-- 6. Top 5 customers by total purchase amount
SELECT c.customer_id, c.name, SUM(o.amount) AS total_purchase
FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_purchase DESC
LIMIT 5;

-- 7. Top 5 product categories by sales
SELECT product_category, SUM(amount) AS total_sales
FROM orders
GROUP BY product_category
ORDER BY total_sales DESC
LIMIT 5;

-- 8. Monthly sales trend
SELECT TO_CHAR(order_date, 'Mon YYYY') AS month_name, SUM(amount) AS sales_trend
FROM orders
GROUP BY TO_CHAR(order_date, 'Mon YYYY')
ORDER BY MIN(order_date);


/* =====================
   3. FEEDBACK ANALYSIS
   ===================== */

-- 9. State-wise sales
SELECT c.state, SUM(o.amount) AS total_sales
FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id
GROUP BY c.state
ORDER BY total_sales DESC;

-- 10. Average order value per customer
SELECT c.customer_id, c.name, AVG(o.amount) AS avg_order_value
FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY avg_order_value DESC;

-- 11. Average rating by product category
SELECT o.product_category, AVG(f.rating) AS avg_rating
FROM feedback AS f
JOIN orders AS o ON o.order_id = f.order_id
GROUP BY o.product_category
ORDER BY avg_rating DESC;

-- 12. Lowest-rated product category
SELECT o.product_category, AVG(f.rating) AS avg_rating
FROM feedback AS f
JOIN orders AS o ON o.order_id = f.order_id
GROUP BY o.product_category
ORDER BY avg_rating ASC
LIMIT 1;

-- 13. Monthly average rating trend
SELECT TO_CHAR(o.order_date, 'Mon YYYY') AS month_name, AVG(f.rating) AS avg_rating
FROM feedback AS f
JOIN orders AS o ON o.order_id = f.order_id
GROUP BY TO_CHAR(o.order_date, 'Mon YYYY')
ORDER BY MIN(o.order_date);
