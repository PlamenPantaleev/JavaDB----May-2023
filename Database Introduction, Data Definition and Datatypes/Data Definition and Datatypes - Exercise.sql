/* task 1 */
CREATE SCHEMA `minions`;

/* task 2 */
CREATE TABLE `minions` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55),
    `age` INT
);

CREATE TABLE `towns` (
    `town_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55)
);

/* task 3 */
ALTER TABLE `towns` 
RENAME COLUMN `town_id` TO `id`;

ALTER TABLE `minions`
ADD COLUMN `town_id` INT;

ALTER TABLE `minions`
ADD CONSTRAINT FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`);

/* task 4 */
INSERT INTO `towns`(`name`)
VALUES ('Sofia'),
	   ('Plovdiv'),
       ('Varna');

INSERT INTO `minions` (`name`, `age`, `town_id`)
VALUES ('Kevin', 22, 1),
       ('Bob', 15, 3),
       ('Steward', null, 2);

/* task 5 */
TRUNCATE TABLE `minions`;

/* task 6 */
DROP TABLE `minions`;
DROP TABLE `towns`;

/* task 7 */
CREATE TABLE `people` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` DOUBLE(10 , 2 ),
    `weight` DOUBLE(10 , 2 ),
    `gender` BOOLEAN NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

/* task 8 */
CREATE TABLE `users` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `username` VARCHAR(30) NOT NULL UNIQUE,
   `password` VARCHAR(26) NOT NULL,
   `profile_picture` BLOB,
   `last_login_time` TIMESTAMP,
   `is_deleted` BOOLEAN
);
   
/* task 9 */
ALTER TABLE `users`
DROP COLUMN `id`;

ALTER TABLE `users`
ADD COLUMN `id` INT NOT NULL;

ALTER TABLE `users`
ADD CONSTRAINT PRIMARY KEY(`id`, `username`);

/* task 10 */
ALTER TABLE `users`
DROP COLUMN `last_login_time`;

ALTER TABLE `users`
ADD COLUMN `last_login_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

/* task 11 */
CREATE SCHEMA `movies`;

/* task 12 */
CREATE TABLE `directors` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(55) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `genres` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `genre_name` VARCHAR(55) NOT NULL,
   `notes` TEXT
);

CREATE TABLE `categories` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `category_name` VARCHAR(55) NOT NULL,
   `notes` TEXT
);

CREATE TABLE `movies` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(55) NOT NULL,
    `director_id` INT NOT NULL,
    FOREIGN KEY (`director_id`)
        REFERENCES `directors` (`id`),
    `copyright_year` YEAR,
    `length` TIME,
    `genre_id` INT NOT NULL,
    FOREIGN KEY (`genre_id`)
        REFERENCES `genres` (`id`),
    `category_id` INT NOT NULL,
    FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`),
    `rating` DOUBLE(10 , 2 ),
    `notes` TEXT
);

INSERT INTO `directors` (`director_name`, `notes`)
VALUES ('Keanu Reaves', 'This is a note of Keanu Reaves'),
	   ('John Cena', 'First price in "Most stupid film?"'),
       ('Zahari Baharov', 'What?'),
       ('Djaro', 'I am not supposed to be here...'),
       ('Dumbaldor', 'Again WHAT?');
       
INSERT INTO `genres` (`genre_name`, `notes`)
VALUES ('Action', 'Action genre'),
       ('Sci-Fi', 'Sci-Fi genre'),
       ('Comedy', 'Comedy genre'),
       ('Tragedy', 'Tragedy genre'),
       ('Some other', 'Some other genre');
       
INSERT INTO `categories` (`category_name`, `notes`)
VALUES ('Family', 'Family category'),
       ('Prison', 'Prison category'),
       ('Kids', 'Kids category'),
       ('Adult', 'Adult category'),
       ('Sports', 'Sports category');
       
INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`)
VALUES ('The Matrix', 1, 1999, 020000, 2, 1, 5.5, 'Matrix movie'),
       ('Pod prikritie', 4, 2011, 012500, 1, 1, 4.5, 'Undercover movie'),
       ('Prison break - part 1 "The Dream"', 2, 2004, 022012, 1, 2, 5.0, 'A story for a prisoner that wants to escape and clear his name from the outside'),
       ('Prison break - part 2 "The next dream"', 2, 2005, 022025, 4, 2, 5.0, 'Part two of this film tells about the next dream of the prisoner from the first movie'),
       ('Fast', 5, 2013, 015530, 1, 5, 3.7, 'Fast is a movies about who is the fastest guy int a race');

/* task 13 */
CREATE SCHEMA car_database;

CREATE TABLE `categories` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `category` VARCHAR(55) NOT NULL,
   `daily_rate` DECIMAL(19, 2),
   `weekly_rate` DECIMAL(19, 2),
   `monthy_rate` DECIMAL(19, 2),
   `weekend_rate` DECIMAL(19, 2)
);

CREATE TABLE `cars` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `plate_number` VARCHAR(55),
    `make` VARCHAR(55),
    `model` VARCHAR(55),
    `car_year` YEAR,
    `category_id` INT NOT NULL,
    FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`),
    `doors` INT,
    `picture` BLOB,
    `car_condition` TEXT,
    `available` BOOLEAN
);

CREATE TABLE `employees` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `first_name` VARCHAR(55) NOT NULL,
   `last_name` VARCHAR(55) NOT NULL,
   `title` VARCHAR(55) NOT NULL,
   `notes` TEXT
);

CREATE TABLE `customers` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `driver_licence_number` INT,
   `full_name` VARCHAR(55) NOT NULL,
   `address` VARCHAR(55) NOT NULL,
   `city` VARCHAR(55) NOT NULL,
   `zip_code` INT,
   `notes` TEXT
);

CREATE TABLE `rental_orders` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT NOT NULL,
    FOREIGN KEY (`employee_id`)
        REFERENCES `employees` (`id`),
    `customer_id` INT NOT NULL,
    FOREIGN KEY (`customer_id`)
        REFERENCES `customers` (`id`),
    `car_id` INT NOT NULL,
    FOREIGN KEY (`car_id`)
        REFERENCES `cars` (`id`),
    `car_condition` VARCHAR(55),
    `tank_level` INT,
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE,
    `end_date` DATE,
    `total_day` INT,
    `rate_applied` DECIMAL(19 , 2 ),
    `tax_rate` DECIMAL(19 , 2 ),
    `order_status` VARCHAR(55),
    `notes` TEXT
);

/* task 14*/
INSERT INTO `towns` (`name`)
VALUES ("Sofia"), ("Plovdiv"), ("Varna"), ("Burgas");

INSERT INTO `departments` (`name`)
VALUES ("Engineering"), ("Sales"), ("Marketing"), 
	("Software Development"), ("Quality Assurance");
    
INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`,
	`job_title`, `department_id`, `hire_date`, `salary`)
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

/* task 15 */
SELECT * FROM `towns`;

SELECT * FROM `departments`;

SELECT * FROM `employees`;

/* task 16 */
SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;

/* task 17 */
SELECT `name` FROM `towns`
ORDER BY `name`;

SELECT `name` FROM `departments`
ORDER BY `name`;

SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;

/* task 18 */
UPDATE `employees`
SET `salary` = `salary` * 1.10;

SELECT `salary` FROM `employees`;