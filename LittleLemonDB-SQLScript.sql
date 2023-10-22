-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LIttleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LIttleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LIttleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LIttleLemonDB` ;

-- -----------------------------------------------------
-- Table `LIttleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIttleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NULL,
  `TableNumber` INT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LIttleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIttleLemonDB`.`Orders` (
  `OrdersID` INT NOT NULL AUTO_INCREMENT,
  `BookingID` INT NULL,
  `OrderDate` DATETIME NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL(10,2) NULL,
  PRIMARY KEY (`OrdersID`),
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `BookingID_idx2`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LIttleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LIttleLemonDB`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIttleLemonDB`.`OrderStatus` (
  `OrderStatusID` INT NOT NULL AUTO_INCREMENT,
  `OrderID` INT NULL,
  `DeliverDate` DATETIME NULL,
  `Status` VARCHAR(100) NULL,
  PRIMARY KEY (`OrderStatusID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LIttleLemonDB`.`Orders` (`OrdersID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LIttleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIttleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `Cuisine` VARCHAR(45) NULL,
  `Starter` VARCHAR(45) NULL,
  `Course` VARCHAR(45) NULL,
  `Drink` VARCHAR(45) NULL,
  `Dessert` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LIttleLemonDB`.`CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIttleLemonDB`.`CustomerDetails` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `BookingID` INT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `BookingID_idx1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LIttleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LIttleLemonDB`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIttleLemonDB`.`Employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(45) NULL,
  `Salary` DECIMAL(10,2) NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
