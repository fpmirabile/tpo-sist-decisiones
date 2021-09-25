create database commodore64;

CREATE TABLE `commodore64`.`dim_docente` (
  `id_docente` INT NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `direccion` VARCHAR(255) NULL,
  `ciudad` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_contratacion` VARCHAR(45) NULL,
  `cant_familiares` INT NULL,
  `fecha_nacimiento` VARCHAR(45) NULL,
  `cant_hijos` INT NULL,
  `comision` DECIMAL NULL,
  `comision_rate` FLOAT NULL,
  PRIMARY KEY (`id_docente`));

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


CREATE TABLE `commodore64`.fact_curso_esperado (
  `id_curso_esperado` INT UNIQUE,
  `id_curso` INT NOT NULL,
  `capacidad_maxima` INT NOT NULL,
  `id_temporada` VARCHAR(255) NOT NULL,
 PRIMARY KEY (`id_curso_esperado`),
 FOREIGN KEY (`id_curso`) REFERENCES dim_curso(`id_curso`)
 );
 
 CREATE TABLE commodore64.dim_modalidad (
	id_modalidad INT auto_increment NOT NULL,
	descripcion varchar(100) NOT NULL,
	dias varchar(100) NOT NULL,
	CONSTRAINT dim_modalidad_PK PRIMARY KEY (id_modalidad)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE commodore64.dim_tiempo (
	id_tiempo INT auto_increment NOT NULL,
	ano INT NOT NULL,
	temporada VARCHAR(50) NOT NULL,
	CONSTRAINT dim_tiempo_PK PRIMARY KEY (id_tiempo)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE commodore64.fact_curso_real (
	id_curso_real INT auto_increment,
	id_curso INT NOT NULL,
	id_modalidad INT NOT NULL,
	id_docente INT NOT NULL,
	id_tiempo INT NOT NULL,
	id_sala INT NOT NULL,
	inscriptos INT NOT NULL,
	CONSTRAINT fact_cursoReal_PK PRIMARY KEY (id_curso_real),
	CONSTRAINT fact_cursoReal_FK FOREIGN KEY (id_curso) REFERENCES commodore64.dim_curso(id_curso),
	CONSTRAINT fact_cursoReal_FK_1 FOREIGN KEY (id_docente) REFERENCES commodore64.dim_docente(id_docente),
	CONSTRAINT fact_cursoReal_FK_2 FOREIGN KEY (id_sala) REFERENCES commodore64.dim_salas(id_sala),
	CONSTRAINT fact_cursoReal_FK_3 FOREIGN KEY (id_modalidad) REFERENCES commodore64.dim_modalidad(id_modalidad),
	CONSTRAINT fact_cursoReal_FK_4 FOREIGN KEY (id_tiempo) REFERENCES commodore64.dim_tiempo(id_tiempo)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;