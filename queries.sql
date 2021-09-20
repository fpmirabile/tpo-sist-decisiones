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