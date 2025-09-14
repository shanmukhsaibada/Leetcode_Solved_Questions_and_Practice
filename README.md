# 🧠 LeetCode SQL50 Solutions

![SQL Logo](leetcodepic.png)

This repository contains solutions to selected LeetCode SQL50 problems. Each solution includes the problem statement, SQL solution, and a link to the official LeetCode problem.

---

## 1️⃣ Problem 1757 - Recyclable and Low Fat Products

🔗 [LeetCode Link](https://leetcode.com/problems/recyclable-and-low-fat-products/)

**Problem:** Find the IDs of products that are both low fat (`low_fats = 'Y'`) and recyclable (`recyclable = 'Y'`).

**Solution:**

```sql
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

---

## 2️⃣ Problem 584 - Find Customer Referee

🔗 [LeetCode Link](https://leetcode.com/problems/find-customer-referee/)

**Problem:** Find names of customers who are either referred by a customer with `id != 2` or not referred by anyone (`referee_id IS NULL`).

**Solution:**

```sql
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;
```

---

## 3️⃣ Problem 595 - Big Countries

🔗 [LeetCode Link](https://leetcode.com/problems/big-countries/)

**Problem:** Find countries with area ≥ 3,000,000 or population ≥ 25,000,000. Return name, population, and area.

**Solution:**

```sql
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
```

---

## 4️⃣ Problem 1148 - Article Views I

🔗 [LeetCode Link](https://leetcode.com/problems/article-views-i/)

**Problem:** Find all authors who viewed at least one of their own articles. Sort by `id` ascending.

**Solution:**

```sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC;
```

---

## 5️⃣ Problem - Invalid Tweets

🔗 [LeetCode Link](https://leetcode.com/problems/invalid-tweets/)

**Problem:** Find tweet IDs where the content length is strictly greater than 15.

**Solution:**

```sql
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
```

---

## 📌 Questions & Solutions

### 6️⃣ **1378. Replace Employee ID With The Unique Identifier**
Show the unique ID of each employee. If a user does not have a unique ID, display `NULL`.

```sql
SELECT emp1.unique_id, emp.name
FROM employees AS emp
LEFT JOIN employeeUNI AS emp1
ON emp.id = emp1.id;
```

7️⃣ 1068. Product Sales Analysis I

Report the product_name, year, and price for each sale.

```sql
SELECT pro.product_name, sal.year, sal.price
FROM sales AS sal
JOIN product AS pro
ON sal.product_id = pro.product_id;
```

8️⃣ 1581. Customer Who Visited but Did Not Make Any Transactions

Find the IDs of users who visited without making any transactions and how many such visits they made.

```sql
SELECT vis.customer_id, COUNT(vis.customer_id) AS count_no_trans
FROM visits AS vis
LEFT JOIN transactions AS tran
ON vis.visit_id = tran.visit_id
WHERE tran.transaction_id IS NULL
GROUP BY vis.customer_id;
```

9️⃣ 197. Rising Temperature

Find all ids where the temperature is higher than the previous day.

```sql
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
```



**Author:** Shanmukha Sai Bada
This repository is part of my portfolio demonstrating SQL problem-solving skills for data analyst roles.

**Connect With Me:** [LinkedIn](https://www.linkedin.com/in/shanmukhasai/)
