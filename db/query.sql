-- Consultar alumnos que sean igual oo mayor a la fecha de inscripcion
SELECT * FROM inscripciones WHERE fecha_insc >= '2024-01-01';

-- Contar los abonados de la inscripcion con alumnos
SELECT COUNT(*) FROM inscripciones WHERE abono_insc = true;

-- Consultar curso que tenga un nivel de habilidad avanzado
SELECT * FROM cursos WHERE nivel_habilidad = 'Avanzado';

-- Listar todos los alumnos inscritos en el curso de "Guitarra Intermedio"
SELECT al.nombre, al.apellido
FROM
    alumnos al
    JOIN inscripciones i ON al.id_alumno = i.id_alumno
    JOIN cursos cu on i.id_curso = cu.id_curso
WHERE
    c.nombre = "Guitarra Intermedio";

SELECT al.nombre, al.apellido
FROM
    alumnos al,
    inscripciones i,
    cursos c
WHERE
    al.id_alumno = i.id_alumno
    AND i.id_curso = cu.id_curso
    AND c.nombre = "Guitarra Intermedio";

-- Listar los nombres y apellidos de los alumnos junto con los nombre de los cursos a
-- los que están inscritos
SELECT al.nombre, al.apellido, c.nombre
FROM
    alumnos al
    JOIN inscripciones i ON al.id_alumno = i.id_alumno
    JOIN cursos c ON i.id_curso = c.id_curso;

-- Obtener el nombre y apeliido de los alumnos que esten inscritos en más de dos cursos
SELECT nombre, apellido
FROM alumnos
WHERE
    id_alumno in (
        SELECT id_alumno
        FROM inscripciones
        GROUP BY
            id_alumno
        HAVING
            COUNT(id_curso) > 1
    );

-- Mostrar el nombre del curso y la cantidad de alumnos inscritos en cada curso
SELECT c.nombre, COUNT(i.id_alumno)
FROM cursos c
    JOIN inscripciones i ON c.id_curso = i.id_curso
GROUP BY
    c.nombre
    -- Obtener los nombres de los cursos que tienen al menos un alumno mayor de 20
    -- años inscritos
SELECT DISTINCT
    c.nombre
FROM
    cursos c
    JOIN inscripciones i ON c.id_curso = i.id_curso
    JOIN alumnos a on i.id_alumno = a.id_alumno
WHERE
    DATEDIFF(CURDATE(), fecha_nac) / 365 > 20
-- Listar el nombre y apellido de los alumnos junto con los nombres de los cursos
-- en los que están inscritos, pero solo para aquellos que se inscribieron
-- en el 2024
SELECT a.nombre, a.apellido, c.nombre
FROM
    alumnos a
    JOIN inscripciones i ON a.id_alumno = i.id_alumno
    JOIN cursos c ON i.id_curso = c.id_curso
WHERE
    YEAR(i.fecha_nac) > 2024