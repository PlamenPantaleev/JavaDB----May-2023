/* task 1 */

SELECT 
    e.employee_id, e.job_title, e.address_id, a.address_text
FROM
    employees AS e
        JOIN
    addresses AS a ON e.address_id = a.address_id
ORDER BY e.address_id ASC
LIMIT 5;

/* task 2 */

SELECT 
    e.first_name, e.last_name, t.name, a.address_text
FROM
    employees AS e
        JOIN
    addresses AS a ON e.address_id = a.address_id
        JOIN
    towns AS t ON t.town_id = a.town_id
ORDER BY e.first_name , e.last_name;

/* task 3 */

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.name AS department_name
FROM
    employees AS e
        JOIN
    departments AS d ON d.department_id = e.department_id
WHERE
    d.name = 'Sales'
ORDER BY employee_id DESC;

/* task 4 */

SELECT 
    e.employee_id,
    e.first_name,
    e.salary,
    d.name AS department_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

/* task 5 */

SELECT 
    e.employee_id, e.first_name
FROM
    employees AS e
        LEFT JOIN
    employees_projects AS ep ON e.employee_id = ep.employee_id
WHERE
    ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;

/* task 6 */

SELECT 
    e.first_name, e.last_name, e.hire_date, d.name AS dept_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.hire_date > '1999-01-01'
        AND d.name = 'Sales'
        OR d.name = 'Finance'
ORDER BY hire_date ASC;

/* task 7 */

SELECT 
    e.employee_id, e.first_name, p.name AS project_name
FROM
    employees AS e
        JOIN
    employees_projects AS ep ON e.employee_id = ep.employee_id
        JOIN
    projects AS p ON ep.project_id = p.project_id
WHERE
    DATE(p.start_date) > '2002-08-13'
        AND p.end_date IS NULL
ORDER BY e.first_name , p.name
LIMIT 5;

/* task 8 */

SELECT 
    e.employee_id,
    e.first_name,
    IF(YEAR(p.start_date) > 2004,
        NULL,
        p.name) AS project_name
FROM
    employees AS e
        JOIN
    employees_projects AS ep ON e.employee_id = ep.employee_id
        JOIN
    projects AS p ON p.project_id = ep.project_id
WHERE
    e.employee_id = 24
ORDER BY project_name ASC;

/* task 9 */

SELECT 
    e.employee_id,
    e.first_name,
    e.manager_id,
    m.first_name AS manager_name
FROM
    employees AS e
        JOIN
    employees AS m ON m.employee_id = e.manager_id
WHERE
    e.manager_id = 3 OR e.manager_id = 7
ORDER BY e.first_name;

/* task 10 */

SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    d.name AS department_name
FROM
    employees AS e
        JOIN
    employees AS m ON e.manager_id = m.employee_id
        JOIN
    departments AS d ON e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;

/* task 11 */

SELECT 
    AVG(e.salary) AS min_average_salary
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
GROUP BY e.department_id
ORDER BY min_average_salary ASC
LIMIT 1;

/* task 12 */

SELECT 
    mc.country_code,
    m.mountain_range,
    p.peak_name,
    p.elevation
FROM
    mountains_countries AS mc
        JOIN
    mountains AS m ON mc.mountain_id = m.id
        JOIN
    peaks AS p ON p.mountain_id = m.id
WHERE
    mc.country_code = BG
        AND p.elevation > 2835
ORDER BY p.elevation DESC;

/* task 13 */

SELECT 
    mc.country_code,
    COUNT(m.id) AS mountain_range
FROM
    mountains_countries AS mc
        JOIN
    mountains AS m ON mc.mountain_id = m.id
WHERE
    mc.country_code = 'US'
        OR mc.country_code = RU
        OR mc.country_code = BG
GROUP BY mc.country_code
ORDER BY mountain_range DESC;

/* task 14 */

SELECT 
    c.country_name, r.river_name
FROM
    countries AS c
        LEFT JOIN
    countries_rivers AS cr ON c.country_code = cr.country_code
        LEFT JOIN
    rivers AS r ON r.id = cr.river_id
WHERE
    c.continent_code = AF
ORDER BY c.country_name
LIMIT 5;

/* task 16 */

SELECT 
    COUNT(*) as country_count
FROM
    countries AS c
WHERE
    c.country_code NOT IN (SELECT 
            country_code
        FROM
            mountains_countries);
            
/* task 17 */

SELECT 
    c.country_name,
    MAX(p.elevation) AS highest_peak_elevation,
    MAX(r.length) AS longest_river_length
FROM
    countries AS c
        LEFT JOIN
    mountains_countries AS mc ON mc.country_code = c.country_code
        LEFT JOIN
    mountains AS m ON m.id = mc.mountain_id
        LEFT JOIN
    peaks AS p ON p.mountain_id = m.id
        LEFT JOIN
    countries_rivers AS cr ON cr.country_code = c.country_code
        LEFT JOIN
    rivers AS r ON r.id = cr.river_id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC , longest_river_length DESC
LIMIT 5;


