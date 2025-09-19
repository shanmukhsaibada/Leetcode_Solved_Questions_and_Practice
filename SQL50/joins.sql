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

-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 1661
-- 🔗 Link: https://leetcode.com/problems/average-time-of-process-per-machine/
-- ==========================================================

-- 📌 PROBLEM: Average Time of Process per Machine
-- Find the average time each machine takes to complete a process.

SELECT 
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a
JOIN Activity b
  ON a.machine_id = b.machine_id
 AND a.process_id = b.process_id
 AND a.activity_type = 'start'
 AND b.activity_type = 'end'
GROUP BY a.machine_id;


-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 577
-- 🔗 Link: https://leetcode.com/problems/employee-bonus/
-- ==========================================================

-- 📌 PROBLEM: Employee Bonus
-- Report the name and bonus amount of each employee with a bonus less than 1000 or no bonus.

SELECT 
    emp.name, 
    bon.bonus
FROM employee AS emp
LEFT JOIN bonus AS bon 
    ON emp.empID = bon.empId
WHERE bon.bonus < 1000 
   OR bon.bonus IS NULL;


-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 1280
-- 🔗 Link: https://leetcode.com/problems/students-and-examinations/
-- ==========================================================

-- 📌 PROBLEM: Students and Examinations
-- Find the number of times each student attended each exam.

SELECT 
    stu.student_id, 
    stu.student_name, 
    sub.subject_name, 
    COUNT(exa.student_id) AS attended_exams
FROM students AS stu
CROSS JOIN subjects AS sub
LEFT JOIN examinations AS exa
    ON stu.student_id = exa.student_id
    AND sub.subject_name = exa.subject_name
GROUP BY stu.student_id, sub.subject_name, stu.student_name
ORDER BY stu.student_id, sub.subject_name;


-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 570
-- 🔗 Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
-- ==========================================================

-- 📌 PROBLEM: Managers with at Least 5 Direct Reports
-- Find managers who have at least five direct reports.

SELECT 
    e.name
FROM employee AS e
JOIN employee AS e1 
    ON e.id = e1.managerID
GROUP BY e.id, e.name
HAVING COUNT(e1.id) >= 5;


-- ==========================================================
-- 🟢 LeetCode SQL50 - Problem 1934
-- 🔗 Link: https://leetcode.com/problems/confirmation-rate/
-- ==========================================================

-- 📌 PROBLEM: Confirmation Rate
-- Find the confirmation rate of each user (confirmed requests / total requests).

SELECT 
    s.user_id,
    ROUND(
        IFNULL(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id), 0),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;

