/* task 1 */

SELECT 
    *
FROM
    employees;
    
    
/* task 2 */

SELECT 
    id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    job_title,
    salary
FROM
    employees
WHERE
    salary >= 1000.00
ORDER BY id;


/* task 3 */


UPDATE employees 
SET 
    salary = salary + 100
WHERE
    job_title = 'Manager';
    
SELECT 
    *
FROM
    employees
WHERE
    job_title = 'Manager';
    
/* task 4 */

CREATE VIEW `top_paid_employee` AS
    SELECT 
        CONCAT(first_name, ' ', last_name) AS full_name, salary
    FROM
        employees
    ORDER BY salary DESC
    LIMIT 1;
    
SELECT 
    *
FROM
    top_paid_employee;
    
    
/* task 5 */

SELECT 
    *
FROM
    employees
WHERE
    department_id = 4 AND salary >= 1000;
    
    
/* task 6 */

DELETE FROM employees 
WHERE
    department_id = 1 OR department_id = 2;
    
SELECT 
    *
FROM
    employees;