create database commodore64;

CREATE TABLE `commodore64`.`dim_docente` (
  `id` INT NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `direccion` VARCHAR(255) NULL,
  `ciudad` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fechacontratacion` VARCHAR(45) NULL,
  `cantfamiliares` INT NULL,
  `fechanacimiento` VARCHAR(45) NULL,
  `cantidadhijos` INT NULL,
  `comision` DECIMAL NULL,
  `comisionrate` FLOAT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `commodore64`.`dim_salas` (
  `id_sala` INT NOT NULL,
  `nro_sala` VARCHAR(45) NULL,
  `capacidad` INT NULL,
  `ubicacion` VARCHAR(255) NULL,
  PRIMARY KEY (`id_sala`));


CREATE TABLE `commodore64`.dim_curso (
`id_curso` INT NOT NULL,
`titulo` VARCHAR(255) NOT NULL,
`codigo_curso` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id_curso`));


CREATE TABLE `commodore64`.fact_cursoEsperado (
  `id_cursoesperado` INT UNIQUE,
  `id_curso` INT NOT NULL,
  `capacidad_maxima` INT NOT NULL,
  `id_temporada` VARCHAR(255) NOT NULL,
 PRIMARY KEY (`id_cursoesperado`),
 FOREIGN KEY (`id_curso`) REFERENCES dim_curso(`id_curso`)
 );