/* task 1 */

SELECT 
    department_id, COUNT(id) AS `Number of employees`
FROM
    employees
GROUP BY department_id
ORDER BY department_id , `Number of employees`;

/* task 2 */

SELECT 
    department_id,
    Round(SUM(salary) / COUNT(id), 2)
    /* Round(avg(salary), 2) */ AS `Average Salary`
FROM
    employees
GROUP BY department_id
ORDER BY department_id;

/* task 3 */

SELECT 
    department_id, MIN(salary) AS `Min Salary`
FROM
    employees
GROUP BY department_id
HAVING `Min Salary` > 800;

/* task 4 */

SELECT 
    COUNT(category_id)
FROM
    products
WHERE
    category_id = 2 AND price > 8;
    
/* task 5 */

SELECT 
    category_id,
    ROUND(AVG(price), 2) AS `Average Price`,
    ROUND(MIN(price), 2) AS `Cheapest Product`,
    ROUND(MAX(price), 2) AS `Most Expensive Product`
FROM
    products
GROUP BY category_id;