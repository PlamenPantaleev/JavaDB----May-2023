/* task 1 */

SELECT 
    title
FROM
    books
WHERE
    SUBSTRING(title, 1, 3) = 'The';
    
/* task 2 */

SELECT 
    REPLACE(title, 'The', '***') AS title
FROM
    books
WHERE
    SUBSTRING(title, 1, 3) = 'The';
    
/* task 3 */

SELECT 
    ROUND(SUM(books.cost), 2)
FROM
    books;
    
    
/* task 4 */
SELECT 
    first_name,
    last_name AS full_name,
    TIMESTAMPDIFF(DAY, born, died) AS days_lived
FROM
    authors;
    
/* task 5 */
SELECT 
    title
FROM
    books
WHERE
    title LIKE 'Harry Potter%';