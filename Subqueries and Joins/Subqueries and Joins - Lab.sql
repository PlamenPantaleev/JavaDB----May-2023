/* task 1 */

SELECT 
    d.manager_id AS employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    d.department_id,
    d.name
FROM
    employees AS e
        JOIN
    departments AS d ON d.manager_id = e.employee_id
ORDER BY employee_id
LIMIT 5;

/* task 2 */

SELECT 
    t.town_id, t.name AS town_name, a.address_text
FROM
    towns AS t
        JOIN
    addresses AS a ON t.town_id = a.town_id
WHERE
    t.name = 'San Francisco'
        OR t.name = 'Sofia'
        OR t.name = 'Carnation'
ORDER BY t.town_id , a.address_id;

/* task 3 */

SELECT 
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM
    employees
WHERE
    manager_id IS NULL;
    
/* task 4 */

SELECT 
    COUNT(employee_id) AS count
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary) AS average_salary
        FROM
            employees);