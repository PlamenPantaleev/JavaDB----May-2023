/* task 1 */

CREATE TABLE `mountains` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55) NOT NULL
);

CREATE TABLE `peaks` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55) NOT NULL,
    `mountain_id` INT,
    CONSTRAINT `fk_peaks_mountain` FOREIGN KEY (`mountain_id`)
        REFERENCES `mountains` (id)
);

/* task 2 */
SELECT 
    driver_id,
    vehicle_type,
    CONCAT(c.first_name, ' ', c.last_name) AS `driver_name`
FROM
    vehicles
        JOIN
    campers AS c ON driver_id = c.id;
    
/* task 3 */

SELECT 
    starting_point AS `route_starting_point`,
    end_point AS `route_ending_point`,
    c.id AS `leader_id`,
    CONCAT(c.first_name, ' ', c.last_name) AS `leader_name`
FROM
    routes
        JOIN
    campers AS c ON leader_id = c.id;
    
/* task 4 */

CREATE TABLE `mountains` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55) NOT NULL
);

CREATE TABLE `peaks` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55) NOT NULL,
    `mountain_id` INT,
    CONSTRAINT `fk_peaks_mountain` FOREIGN KEY (`mountain_id`)
        REFERENCES `mountains` (id)
        ON DELETE CASCADE
);

/* task 5 */

create schema `relations`;
use relations;

CREATE TABLE `clients` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `client_name` VARCHAR(100)
);

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(100),
    `last_name` VARCHAR(100),
    `project_id` INT,
    CONSTRAINT fk_project_id FOREIGN KEY (`project_id`)
        REFERENCES `projects` (`id`)
);

CREATE TABLE `projects` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `client_id` INT,
    `project_lead_id` INT,
    CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`)
        REFERENCES `clients` (`id`)
);

ALTER TABLE `projects`
ADD CONSTRAINT `fk_project_lead_id`
FOREIGN KEY (`project_lead_id`)
REFERENCES `employees` (`id`);
