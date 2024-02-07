/*creating schema*/
create schema `gamebar` DEFAULT CHARSET utf8;

/* first task */
CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(55) NOT NULL,
    `last_name` VARCHAR(55) NOT NULL
);

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55) NOT NULL
);

CREATE TABLE `products` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(55) NOT NULL,
    `category_id` INT NOT NULL
);

/*second taks */
insert into `categories` (`name`)
values('Action'),
	  ('Strategy'),
      ('SciFi');

/* third task */
alter table `employees` 
add column `middle_name` varchar(55) not null;

/* fourth task */ 
alter table `products`
add constraint foreign key (`category_id`)
references `categories`(`id`);

/* fifth task */
alter table `employees` 
modify column `middle_name` varchar(100);