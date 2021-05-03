-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercise4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercise4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercise4` ;
USE `Exercise4` ;

-- -----------------------------------------------------
-- Table `Exercise4`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Specialist` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Field_area` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Medical` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Overtime_rate` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Doctor` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Date_of_birth` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Salary` INT UNSIGNED NULL,
  `Specialist_ID` INT UNSIGNED NOT NULL,
  `Medical_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_Doctor_Specialist_idx` (`Specialist_ID` ASC),
  INDEX `fk_Doctor_Medical1_idx` (`Medical_ID` ASC),
  CONSTRAINT `fk_Doctor_Specialist`
    FOREIGN KEY (`Specialist_ID`)
    REFERENCES `Exercise4`.`Specialist` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_Medical1`
    FOREIGN KEY (`Medical_ID`)
    REFERENCES `Exercise4`.`Medical` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Patient` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Patient` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Date_of_birth` DATE NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Bill` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Total` INT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Appointment` (
  `Doctor_ID` INT UNSIGNED NOT NULL,
  `Patient_ID` INT UNSIGNED NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `Bill_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Doctor_ID`, `Patient_ID`),
  INDEX `fk_Doctor_has_Patient_Patient1_idx` (`Patient_ID` ASC),
  INDEX `fk_Doctor_has_Patient_Doctor1_idx` (`Doctor_ID` ASC),
  INDEX `fk_Appointment_Bill1_idx` (`Bill_ID` ASC),
  CONSTRAINT `fk_Doctor_has_Patient_Doctor1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `Exercise4`.`Doctor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_has_Patient_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `Exercise4`.`Patient` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Bill1`
    FOREIGN KEY (`Bill_ID`)
    REFERENCES `Exercise4`.`Bill` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Payment` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Details` VARCHAR(45) NULL,
  `Method` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Payment_has_Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Payment_has_Bill` (
  `Payment_ID` INT UNSIGNED NOT NULL,
  `Bill_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Payment_ID`, `Bill_ID`),
  INDEX `fk_Payment_has_Bill_Bill1_idx` (`Bill_ID` ASC),
  INDEX `fk_Payment_has_Bill_Payment1_idx` (`Payment_ID` ASC),
  CONSTRAINT `fk_Payment_has_Bill_Payment1`
    FOREIGN KEY (`Payment_ID`)
    REFERENCES `Exercise4`.`Payment` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_has_Bill_Bill1`
    FOREIGN KEY (`Bill_ID`)
    REFERENCES `Exercise4`.`Bill` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
