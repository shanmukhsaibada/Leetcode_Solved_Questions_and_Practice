# 🧠 LeetCode SQL50 Solutions  

## 📑 Table of Contents  
- [🟢 Problem 1757: Recyclable and Low Fat Products](#-leetcode-sql50---problem-1757)  
- [🟢 Problem 584: Find Customer Referee](#-leetcode-sql50---problem-584)  
- [🟢 Problem 595: Big Countries](#-leetcode-sql50---problem-595)  
- [🟢 Problem 1148: Article Views I](#-leetcode-sql50---problem-1148)  
- [🟢 Problem: Invalid Tweets](#-leetcode-sql50---problem-invalid-tweets)  

---

```sql
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


-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 595
-- 🔗 Link: https://leetcode.com/problems/big-countries/
-- ==========================================================

-- 📌 PROBLEM STATEMENT:
-- A country is considered big if:
-- 1️⃣ It has an area of at least 3,000,000 (km²), OR
-- 2️⃣ It has a population of at least 25,000,000.
-- Write a solution to find the name, population, and area of the big countries.
-- Return the result table in any order.

-- 📊 TABLE SCHEMA:
-- World(name VARCHAR, continent VARCHAR, area INT, population INT, gdp BIGINT)

-- ==========================================================
-- ✅ SOLUTION:
-- ==========================================================

SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;


-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 1148
-- 🔗 Link: https://leetcode.com/problems/article-views-i/
-- ==========================================================

-- 📌 PROBLEM STATEMENT:
-- Find all authors who have viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.

-- 📊 TABLE SCHEMA:
-- Views(article_id INT, author_id INT, viewer_id INT, view_date DATE)

-- ==========================================================
-- ✅ SOLUTION:
-- ==========================================================

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC;


-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem (Invalid Tweets)
-- 🔗 Link: https://leetcode.com/problems/invalid-tweets/
-- ==========================================================

-- 📌 PROBLEM STATEMENT:
-- A tweet is considered invalid if the number of characters in its content
-- is strictly greater than 15.
-- Write a solution to find the IDs of the invalid tweets.
-- Return the result table in any order.

-- 📊 TABLE SCHEMA:
-- Tweets(tweet_id INT, content VARCHAR)

-- ==========================================================
-- ✅ SOLUTION:
-- ==========================================================

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
