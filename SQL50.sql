-- LeetCode SQL50 - Problem 1757
-- Title: Recyclable and Low Fat Products
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/recyclable-and-low-fat-products/

-- Table Schema:
-- Products(product_id INT, low_fats ENUM('Y','N'), recyclable ENUM('Y','N'))

-- Problem Statement:
-- Write a solution to find the ids of products that are both low fat and recyclable.
-- Return the result table in any order.

-- Solution:
SELECT product_id
FROM Products
WHERE low_fats = 'Y' 
  AND recyclable = 'Y';


-- LeetCode SQL50 - Problem 584
-- Title: Find Customer Referee
-- Difficulty: Easy
-- Link: https://leetcode.com/problems/find-customer-referee/

-- Table Schema:
-- Customer(id INT, name VARCHAR, referee_id INT)

-- Problem Statement:
-- Find the names of customers that are either:
-- 1. Referred by any customer with id != 2.
-- 2. Not referred by any customer (referee_id IS NULL).
-- Return the result table in any order.

-- ✅ Solution:
SELECT name
FROM Customer
WHERE referee_id <> 2 
   OR referee_id IS NULL;
