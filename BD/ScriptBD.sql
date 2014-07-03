SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `whereismyteacher` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `whereismyteacher` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Area` (
  `idArea` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Estado` BIT NOT NULL,
  PRIMARY KEY (`idArea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Persona` (
  `idPersona` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Sexo` VARCHAR(45) NOT NULL,
  `Celular` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Estado` BIT NOT NULL,
  `idArea` INT NOT NULL,
  PRIMARY KEY (`idPersona`),
  INDEX `fk_Tbl_Persona_Tbl_Area_idx` (`idArea` ASC),
  CONSTRAINT `fk_Tbl_Persona_Tbl_Area`
    FOREIGN KEY (`idArea`)
    REFERENCES `mydb`.`Tbl_Area` (`idArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Piso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Piso` (
  `idPiso` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPiso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Aula` (
  `idAula` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `idPiso` INT NOT NULL,
  PRIMARY KEY (`idAula`),
  INDEX `fk_Tbl_Aula_Tbl_Piso1_idx` (`idPiso` ASC),
  CONSTRAINT `fk_Tbl_Aula_Tbl_Piso1`
    FOREIGN KEY (`idPiso`)
    REFERENCES `mydb`.`Tbl_Piso` (`idPiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Estado` (
  `idEstado` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Ubicacion` (
  `idUbicacion` INT NOT NULL,
  `idPersona` INT NOT NULL,
  `idAula` INT NOT NULL,
  `idEstado` INT NOT NULL,
  `Fecha` TIMESTAMP NOT NULL,
  `Descripcion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idUbicacion`),
  INDEX `fk_Tbl_Ubicacion_Tbl_Persona1_idx` (`idPersona` ASC),
  INDEX `fk_Tbl_Ubicacion_Tbl_Aula1_idx` (`idAula` ASC),
  INDEX `fk_Tbl_Ubicacion_Tbl_Estado1_idx` (`idEstado` ASC),
  CONSTRAINT `fk_Tbl_Ubicacion_Tbl_Persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `mydb`.`Tbl_Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Ubicacion_Tbl_Aula1`
    FOREIGN KEY (`idAula`)
    REFERENCES `mydb`.`Tbl_Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Ubicacion_Tbl_Estado1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `mydb`.`Tbl_Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
