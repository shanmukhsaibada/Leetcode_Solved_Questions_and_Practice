-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 1757
-- 🔗 Link: https://leetcode.com/problems/recyclable-and-low-fat-products/
-- ==========================================================

-- 📌 PROBLEM STATEMENT:
-- Write a solution to find the IDs of products that are both:
-- 1️⃣ Low fat (low_fats = 'Y')
-- 2️⃣ Recyclable (recyclable = 'Y')
-- Return the result table in any order.

-- 📊 TABLE SCHEMA:
-- Products(product_id INT, low_fats ENUM('Y','N'), recyclable ENUM('Y','N'))

-- ==========================================================
-- ✅ SOLUTION:
-- ==========================================================

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';


-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 584
-- 🔗 Link: https://leetcode.com/problems/find-customer-referee/
-- ==========================================================

-- 📌 PROBLEM STATEMENT:
-- Find the names of customers that are either:
-- 1️⃣ Referred by any customer with id != 2.
-- 2️⃣ Not referred by any customer (referee_id IS NULL).
-- Return the result table in any order.

-- 📊 TABLE SCHEMA:
-- Customer(id INT, name VARCHAR, referee_id INT)

-- ==========================================================
-- ✅ SOLUTION:
-- ==========================================================

SELECT name
FROM Customer
WHERE referee_id <> 2 
   OR referee_id IS NULL;
