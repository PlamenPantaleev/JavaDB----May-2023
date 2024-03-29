/* task 1 */

CREATE TABLE passports (
    passport_id INT PRIMARY KEY AUTO_INCREMENT,
    passport_number VARCHAR(55) NOT NULL UNIQUE
);


CREATE TABLE people (
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(55) NOT NULL,
    salary DECIMAL(19 , 2 ) NOT NULL,
    passport_id INT NOT NULL UNIQUE,
    CONSTRAINT fk_passport_id FOREIGN KEY (passport_id)
        REFERENCES passports (passport_id)
);

alter table passports 
auto_increment = 101;

insert into passports (passport_number)
values ('N34FG21B'),
	   ('K65LO4R7'),
       ('ZE657QP2');

insert into people (first_name, salary, passport_id)
values ('Roberto', 43300.00, 102),
       ('Tom', 56100.00, 103),
       ('Yana', 60200.00, 101);
       
       
/* task 2 */

CREATE TABLE manufacturers (
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55) NOT NULL,
    established_on DATE NOT NULL
);

CREATE TABLE models (
    model_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55) NOT NULL UNIQUE,
    manufacturer_id INT NOT NULL,
    CONSTRAINT fk_manufacturer_id FOREIGN KEY (manufacturer_id)
        REFERENCES manufacturers (manufacturer_id)
);

alter table models
auto_increment = 101;

insert into manufacturers (`name`, established_on)
values ('BMW', '1916-03-01'),
	   ('Tesla', '2003-01-01'),
       ('Lada', '1966-05-01');
       
insert into models (`name`, manufacturer_id)
values ('X1', 1),
       ('i6', 1),
       ('Model S', 2),
       ('Model X', 2),
       ('Model 3', 2),
       ('Nova', 3);
       
/* task 3 */

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

ALTER TABLE exams 
AUTO_INCREMENT = 101;

CREATE TABLE students_exams (
    student_id INT,
    exam_id INT,
    CONSTRAINT pk_students_exams PRIMARY KEY (student_id , exam_id),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_exam_id FOREIGN KEY (exam_id)
        REFERENCES exams (exam_id)
);

INSERT INTO students (name)
VALUES
 ('Mila'),
 ('Toni'),
 ('Ron');
 
 INSERT INTO exams (name)
 VALUES
 ('Spring MVC'),
 ('Neo4j'),
 ('Oracle 11g');
 

INSERT INTO students_exams 
VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103);

/* task 4 */

CREATE TABLE teachers (
	teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    manager_id INT
);

ALTER TABLE teachers AUTO_INCREMENT = 101;

INSERT INTO teachers (name, manager_id)
VALUES ("John", NULL),
       ("Maya", 106),
       ("Silvia", 106),
       ("Ted", 105),
       ("Mark", 101),
       ("Greta", 101);

ALTER TABLE teachers
ADD CONSTRAINT fk_techers
FOREIGN KEY (manager_id)
REFERENCES teachers(teacher_id);

/* task 5 */

CREATE TABLE item_types (
    item_type_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE cities (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    birthday DATE,
    city_id INT,
    CONSTRAINT `fk_city_id` FOREIGN KEY (city_id)
        REFERENCES cities (city_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    CONSTRAINT `fk_customer_id` FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);


CREATE TABLE items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    item_type_id INT,
    CONSTRAINT `fk_item_type_id` FOREIGN KEY (item_type_id)
        REFERENCES item_types (item_type_id)
);

CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    CONSTRAINT `pk_orders_items` PRIMARY KEY (order_id , item_id),
    CONSTRAINT `fk_order_id` FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    CONSTRAINT `fk_item_id` FOREIGN KEY (item_id)
        REFERENCES items (item_id)
);

/* task 6 */

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);

CREATE TABLE majors (
    major_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12),
    student_name VARCHAR(50),
    major_id INT,
    CONSTRAINT fk_students_major FOREIGN KEY (major_id)
        REFERENCES majors (major_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE,
    payment_amount DECIMAL(8 , 2 ),
    student_id INT,
    CONSTRAINT fk_student_id FOREIGN KEY (student_id)
        REFERENCES students (student_id)
);
CREATE TABLE agenda (
    student_id INT,
    subject_id INT,
    CONSTRAINT pk_agenda_key PRIMARY KEY (student_id , subject_id),
    CONSTRAINT fk_agenda_student FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_agenda_subject FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id)
);

/* task 7 */

SELECT 
    m.mountain_range AS mountain_range,
    p.peak_name,
    p.elevation AS peak_elevation
FROM
    peaks AS p
        JOIN
    mountains AS m ON p.mountain_id = m.id
WHERE
    mountain_range = 'Rila'
ORDER BY peak_elevation DESC;

