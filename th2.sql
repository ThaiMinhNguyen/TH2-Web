CREATE SCHEMA `th2` ;

CREATE TABLE `th2`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `th2`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `publication_year` INT NULL,
  PRIMARY KEY (`id`));
  
  
INSERT INTO `th2`.`users` (`username`, `password`) VALUES ('admin', '1');
  
INSERT INTO `th2`.`books` (`title`, `author`, `publication_year`) VALUES ('Call of the Wild', 'Jack London', '2017');
INSERT INTO `th2`.`books` (`title`, `author`, `publication_year`) VALUES ('Hạ đỏ', 'Nguyễn Nhật Ánh', '2019');
	
