/*
====================================
Sales Performance Analysis
====================================
*/

-- Business Question 1
-- Total Transactions

SELECT
    COUNT(*) AS total_transactions
FROM orders;

-- Business Question 2
-- Total Revenue

SELECT
    SUM(subtotal_idr) AS total_revenue
FROM order_items;

-- Business Question 3
-- Total Products Sold

SELECT
    SUM(quantity) AS total_products_sold
FROM order_items;

-- Business Question 4
-- Average Order Value

SELECT
    ROUND(
        SUM(subtotal_idr) * 1.0 /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM order_items;
