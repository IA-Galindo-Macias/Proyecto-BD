-- MySQL Script generated by MySQL Workbench
-- mié 29 nov 2023 17:47:42
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipo` (
  `id_equipo` INT NOT NULL AUTO_INCREMENT,
  `equipo_nombre` VARCHAR(45) NOT NULL,
  `equipo_estatus` ENUM("activo", "cancelado") NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE INDEX `equipo_nombre_UNIQUE` (`equipo_nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`integrante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`integrante` (
  `id_integrante` INT NOT NULL AUTO_INCREMENT,
  `integrante_nombre` VARCHAR(45) NOT NULL,
  `integrante_email` VARCHAR(45) NOT NULL,
  `integrante_activo` BIT(1) NOT NULL DEFAULT 1,
  `integrante_salario` INT NOT NULL DEFAULT 0,
  `equipo_id_equipo` INT NOT NULL,
  PRIMARY KEY (`id_integrante`),
  INDEX `fk_integrante_equipo1_idx` (`equipo_id_equipo` ASC) VISIBLE,
  UNIQUE INDEX `integrante_email_UNIQUE` (`integrante_email` ASC) VISIBLE,
  CONSTRAINT `fk_integrante_equipo1`
    FOREIGN KEY (`equipo_id_equipo`)
    REFERENCES `mydb`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`historial_activo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historial_activo` (
  `id_historial_activo` INT NOT NULL AUTO_INCREMENT,
  `historial_activo_marca` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `historial_activo_anterior` BIT(1) NOT NULL,
  `historial_activo_siguiente` BIT(1) NOT NULL,
  `integrante_id_integrante` INT NOT NULL,
  PRIMARY KEY (`id_historial_activo`),
  INDEX `fk_historial_activo_integrante2_idx` (`integrante_id_integrante` ASC) VISIBLE,
  CONSTRAINT `fk_historial_activo_integrante2`
    FOREIGN KEY (`integrante_id_integrante`)
    REFERENCES `mydb`.`integrante` (`id_integrante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`historial_salario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historial_salario` (
  `id_historial_salario` INT NOT NULL AUTO_INCREMENT,
  `historial_salario_marca` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `historial_salario_anterior` INT NOT NULL,
  `historial_salario_siguiente` INT NOT NULL,
  `id_integrante` INT NOT NULL,
  INDEX `fk_historial_activo_integrante_idx` (`id_integrante` ASC) VISIBLE,
  PRIMARY KEY (`id_historial_salario`),
  CONSTRAINT `fk_historial_activo_integrante0`
    FOREIGN KEY (`id_integrante`)
    REFERENCES `mydb`.`integrante` (`id_integrante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`control_horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`control_horario` (
  `id_control_horario` INT NOT NULL AUTO_INCREMENT,
  `control_horario_entrada` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `control_horario_salida` DATETIME NULL,
  `id_integrante` INT NOT NULL,
  INDEX `fk_historial_activo_integrante_idx` (`id_integrante` ASC) VISIBLE,
  PRIMARY KEY (`id_control_horario`),
  CONSTRAINT `fk_historial_activo_integrante1`
    FOREIGN KEY (`id_integrante`)
    REFERENCES `mydb`.`integrante` (`id_integrante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tarea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tarea` (
  `id_tarea` INT NOT NULL AUTO_INCREMENT,
  `tarea_inicio` DATETIME NOT NULL,
  `tarea_nombre` VARCHAR(45) NOT NULL,
  `tarea_descripcion` VARCHAR(255) NULL,
  `tarea_duracion` INT NOT NULL,
  `tarea_status` ENUM('PENDIENTE', 'CANCELADO', 'COMPLETADO') NOT NULL DEFAULT 'PENDIENTE',
  `integrante_id_integrante` INT NULL,
  `equipo_id_equipo` INT NULL,
  PRIMARY KEY (`id_tarea`),
  UNIQUE INDEX `tarea_nombre_UNIQUE` (`tarea_nombre` ASC) VISIBLE,
  INDEX `fk_tarea_integrante1_idx` (`integrante_id_integrante` ASC) VISIBLE,
  INDEX `fk_tarea_equipo1_idx` (`equipo_id_equipo` ASC) VISIBLE,
  CONSTRAINT `fk_tarea_integrante1`
    FOREIGN KEY (`integrante_id_integrante`)
    REFERENCES `mydb`.`integrante` (`id_integrante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarea_equipo1`
    FOREIGN KEY (`equipo_id_equipo`)
    REFERENCES `mydb`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`historial_prorroga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historial_prorroga` (
  `id_historial_prorroga` INT NOT NULL AUTO_INCREMENT,
  `historial_prorroga_duracion` INT NULL,
  `tarea_id_tarea` INT NOT NULL,
  PRIMARY KEY (`id_historial_prorroga`),
  INDEX `fk_historal_prorroga_tarea1_idx` (`tarea_id_tarea` ASC) VISIBLE,
  CONSTRAINT `fk_historal_prorroga_tarea1`
    FOREIGN KEY (`tarea_id_tarea`)
    REFERENCES `mydb`.`tarea` (`id_tarea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tarea_completada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tarea_completada` (
  `id_tarea_completa` INT NOT NULL AUTO_INCREMENT,
  `tarea_completada_marca` TIMESTAMP NOT NULL,
  `tarea_id_tarea` INT NOT NULL,
  PRIMARY KEY (`id_tarea_completa`),
  INDEX `fk_tarea_completada_tarea1_idx` (`tarea_id_tarea` ASC) VISIBLE,
  CONSTRAINT `fk_tarea_completada_tarea1`
    FOREIGN KEY (`tarea_id_tarea`)
    REFERENCES `mydb`.`tarea` (`id_tarea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
