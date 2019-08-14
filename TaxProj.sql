-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tax` (
  `idTax` INT NOT NULL AUTO_INCREMENT,
  `TaxName` VARCHAR(20) NULL,
  `TaxDesc` VARCHAR(255) NULL,
  PRIMARY KEY (`idTax`),
  UNIQUE INDEX `idTax_UNIQUE` (`idTax` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tax_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tax_Type` (
  `idTax_Type` INT NOT NULL AUTO_INCREMENT,
  `Tax_TypeName` VARCHAR(45) NOT NULL,
  `TaxRate` INT NULL,
  `TaxAmount` INT NULL,
  `CreationDate` DATE NULL,
  `Tax_idTax` INT NOT NULL,
  PRIMARY KEY (`idTax_Type`),
  UNIQUE INDEX `Tax_TypeName_UNIQUE` (`Tax_TypeName` ASC),
  INDEX `fk_Tax_Type_Tax_idx` (`Tax_idTax` ASC),
  CONSTRAINT `fk_Tax_Type_Tax`
    FOREIGN KEY (`Tax_idTax`)
    REFERENCES `mydb`.`Tax` (`idTax`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tax_Payer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tax_Payer` (
  `idTax_Payer` INT NOT NULL,
  `Tax_Payer_Name` VARCHAR(50) NULL,
  `Sex` VARCHAR(10) NULL,
  `NID` VARCHAR(20) NULL,
  `Contact` VARCHAR(45) NULL,
  `Tax_Payer_Type` VARCHAR(45) NOT NULL,
  `Business_location` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idTax_Payer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tax_Type_has_Tax_Payer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tax_Type_has_Tax_Payer` (
  `Tax_Type_idTax_Type` INT NOT NULL,
  `Tax_Payer_idTax_Payer` INT NOT NULL,
  `Transaction_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Payer_Amount` INT NOT NULL,
  `Payment_Date` VARCHAR(45) NULL,
  PRIMARY KEY (`Transaction_ID`, `Tax_Type_idTax_Type`),
  INDEX `fk_Tax_Type_has_Tax_Payer_Tax_Payer1_idx` (`Tax_Payer_idTax_Payer` ASC),
  INDEX `fk_Tax_Type_has_Tax_Payer_Tax_Type1_idx` (`Tax_Type_idTax_Type` ASC),
  CONSTRAINT `fk_Tax_Type_has_Tax_Payer_Tax_Type1`
    FOREIGN KEY (`Tax_Type_idTax_Type`)
    REFERENCES `mydb`.`Tax_Type` (`idTax_Type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tax_Type_has_Tax_Payer_Tax_Payer1`
    FOREIGN KEY (`Tax_Payer_idTax_Payer`)
    REFERENCES `mydb`.`Tax_Payer` (`idTax_Payer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
