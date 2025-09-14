-- ==========================================================
-- 🔗 LeetCode SQL - Joins Practice Solutions
-- ==========================================================

-- This file contains solutions to popular LeetCode SQL join problems.
-- Each section includes the problem number, title, link, and solution.
-- ==========================================================

-- ==========================================================
-- 🟢 Problem 1378 - Replace Employee ID With The Unique Identifier
-- 🔗 Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
-- ==========================================================

-- 📌 PROBLEM:
-- Show the unique ID of each user.
-- If a user does not have a unique ID, show NULL.

SELECT emp1.unique_id, emp.name
FROM Employees AS emp
LEFT JOIN EmployeeUNI AS emp1 
ON emp.id = emp1.id;


-- ==========================================================
-- 🟢 Problem 1068 - Product Sales Analysis I
-- 🔗 Link: https://leetcode.com/problems/product-sales-analysis-i/
-- ==========================================================

-- 📌 PROBLEM:
-- Report the product_name, year, and price for each sale_id in the Sales table.

SELECT pro.product_name, sal.year, sal.price
FROM Sales AS sal
JOIN Product AS pro
ON sal.product_id = pro.product_id;


-- ==========================================================
-- 🟢 Problem 1581 - Customer Who Visited but Did Not Make Any Transactions
-- 🔗 Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
-- ==========================================================

-- 📌 PROBLEM:
-- Find customer IDs who visited without making transactions and count those visits.

SELECT vis.customer_id, COUNT(vis.customer_id) AS count_no_trans
FROM Visits AS vis
LEFT JOIN Transactions AS tran
ON vis.visit_id = tran.visit_id
WHERE tran.transaction_id IS NULL
GROUP BY vis.customer_id;


-- ==========================================================
-- 🟢 Problem 197 - Rising Temperature
-- 🔗 Link: https://leetcode.com/problems/rising-temperature/
-- ==========================================================

-- 📌 PROBLEM:
-- Find all dates' IDs where the temperature is higher than the previous day.

SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
