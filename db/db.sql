CREATE TABLE Alumnos (
  id_alumno INT AUTO_INCREMENT PRIMARY KEY,
  apellido VARCHAR(35),
  nombre VARCHAR(35),
  fecha_nac DATE,
  direccion VARCHAR(100),
  telefono VARCHAR(20),
  email VARCHAR(50)
);

CREATE TABLE Cursos (
  id_curso INT auto_increment PRIMARY KEY,
  nombre VARCHAR(35),
  nivel_habilidad VARCHAR(35),
  tipo_instrumento VARCHAR(35)
);

CREATE TABLE Inscripciones (
  id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
  fecha_insc DATE,
  abono_insc BOOLEAN,
  id_alumno INT,
  id_curso INT,
  CONSTRAINT `fk_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `Alumnos` (`id_alumno`),
  CONSTRAINT `fk_curso` FOREIGN KEY (`id_curso`) REFERENCES `Cursos` (`id_curso`)
);