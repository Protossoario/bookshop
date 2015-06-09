-- MySQL Script generated by MySQL Workbench
-- Tue Jun  9 18:08:10 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bookshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bookshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bookshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bookshop` ;

-- -----------------------------------------------------
-- Table `bookshop`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookshop`.`book` (
  `id_book` INT NOT NULL AUTO_INCREMENT,
  `ISBN` VARCHAR(13) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `publication` DATE NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `image_url` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_book`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookshop`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookshop`.`author` (
  `id_author` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  `birthday` DATE NULL,
  PRIMARY KEY (`id_author`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookshop`.`book_has_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookshop`.`book_has_author` (
  `book_id_book` INT NOT NULL,
  `author_id_author` INT NOT NULL,
  PRIMARY KEY (`book_id_book`, `author_id_author`),
  INDEX `fk_book_has_author_author1_idx` (`author_id_author` ASC),
  INDEX `fk_book_has_author_book_idx` (`book_id_book` ASC),
  CONSTRAINT `fk_book_has_author_book`
    FOREIGN KEY (`book_id_book`)
    REFERENCES `bookshop`.`book` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_author_author1`
    FOREIGN KEY (`author_id_author`)
    REFERENCES `bookshop`.`author` (`id_author`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `bookshop`.`book`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookshop`;
INSERT INTO `bookshop`.`book` (`id_book`, `ISBN`, `title`, `publication`, `price`, `image_url`) VALUES (1, '9781400079988', 'War and Peace', '2008-12-02', 19.99, 'http://s18.postimg.org/u7sazpldl/war_and_peace.jpg');
INSERT INTO `bookshop`.`book` (`id_book`, `ISBN`, `title`, `publication`, `price`, `image_url`) VALUES (2, '9780451419439', 'Les Misérables', '2013-10-01', 14.99, 'http://s18.postimg.org/edow66o3d/lesmiserables.jpg');
INSERT INTO `bookshop`.`book` (`id_book`, `ISBN`, `title`, `publication`, `price`, `image_url`) VALUES (3, '9781604598933', 'The Art of War', '2009-10-30', 9.99, 'http://s16.postimg.org/3vyh21njp/9781907518355.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bookshop`.`author`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookshop`;
INSERT INTO `bookshop`.`author` (`id_author`, `name`, `lastname`, `birthday`) VALUES (1, 'Victor', 'Hugo', '1802-02-26');
INSERT INTO `bookshop`.`author` (`id_author`, `name`, `lastname`, `birthday`) VALUES (2, 'Leo', 'Tolstoy', '1828-09-09');
INSERT INTO `bookshop`.`author` (`id_author`, `name`, `lastname`, `birthday`) VALUES (3, 'Sun', 'Tzu', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bookshop`.`book_has_author`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookshop`;
INSERT INTO `bookshop`.`book_has_author` (`book_id_book`, `author_id_author`) VALUES (1, 2);
INSERT INTO `bookshop`.`book_has_author` (`book_id_book`, `author_id_author`) VALUES (2, 1);
INSERT INTO `bookshop`.`book_has_author` (`book_id_book`, `author_id_author`) VALUES (3, 3);

COMMIT;

