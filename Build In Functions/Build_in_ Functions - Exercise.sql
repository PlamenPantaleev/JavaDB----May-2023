/* task 1 */

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    LOWER(SUBSTR(first_name, 1, 2)) = 'sa'
ORDER BY employee_id;

/* task 2 */

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    UPPER(last_name) LIKE '%ei%'
ORDER BY employee_id;

/* task 3 */

SELECT 
    first_name
FROM
    employees
WHERE
    department_id = 3
        OR department_id = 10
        AND EXTRACT(YEAR FROM hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id ASC;

/* task 4 */

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    job_title NOT LIKE ('%engineer%')
ORDER BY employee_id ASC;

/* task 5 */

SELECT 
    `name`
FROM
    towns
WHERE
    LENGTH(`name`) = 5 OR LENGTH(`name`) = 6
ORDER BY `name` ASC;

/* task 6 */

SELECT 
    *
FROM
    towns
WHERE
    LOWER(SUBSTR(`name`, 1, 1) = 'm')
        OR LOWER(SUBSTR(`name`, 1, 1) = 'k')
        OR LOWER(SUBSTR(`name`, 1, 1) = 'b')
        OR LOWER(SUBSTR(`name`, 1, 1) = 'e')
ORDER BY `name` ASC;

/* task 7 */

SELECT 
    *
FROM
    towns
WHERE
    LOWER(SUBSTR(`name`, 1, 1) != 'r')
        AND LOWER(SUBSTR(`name`, 1, 1) != 'b')
        AND LOWER(SUBSTR(`name`, 1, 1) != 'd')
ORDER BY `name` ASC;

/* task 8 */

CREATE VIEW `v_employees_hired_after_2000` AS
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        YEAR(hire_date) > 2000
    ORDER BY employee_id ASC;
    
/* task 9 */

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    CHAR_LENGTH(last_name) = 5;
    
/* task 10 */

SELECT 
    country_name, iso_code
FROM
    countries
WHERE
    country_name LIKE '%a%%a%%a%'
ORDER BY iso_code ASC;

/* task 11 */

SELECT 
    peak_name,
    river_name,
    CONCAT(LEFT(LOWER(peak_name),
                LENGTH(peak_name) - 1),
            LOWER(river_name)) AS mix
FROM
    peaks,
    rivers
WHERE
    RIGHT(peak_name, 1) = LEFT(river_name, 1)
ORDER BY mix ASC;

/* task 12 */

SELECT 
    `name`, DATE_FORMAT(`start`, '%Y-%m-%d') AS `start`
FROM
    games
WHERE
    YEAR(`start`) = 2011
        OR YEAR(`start`) = 2012
ORDER BY `start`
LIMIT 50;

/* task 13 */

SELECT 
    user_name,
    SUBSTR(email, LOCATE('@', email) + 1) AS email_provider
FROM
    users
ORDER BY email_provider ASC , user_name ASC;

/* task 14 */

SELECT 
    user_name, ip_address
FROM
    users
WHERE
    ip_address LIKE '___.1%.%.___'
ORDER BY user_name ASC;

/* task 15 */

SELECT 
    `name`,
    CASE
        WHEN HOUR(`start`) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN HOUR(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS 'Part of the Day',
    CASE
        WHEN duration <= 3 THEN 'Extra Short'
        WHEN duration <= 6 THEN 'Short'
        WHEN duration <= 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration' from games;
    
/* task 16 */

SELECT 
    product_name,
    order_date,
    DATE_ADD(order_date, INTERVAL 3 DAY) AS pay_due,
    DATE_ADD(order_date, INTERVAL 1 MONTH) AS delivery_due
FROM
    orders;