DROP DATABASE testDisparador;
CREATE DATABASE testDisparador;
USE testDisparador;

CREATE TABLE alumnos(
  `idAlumno` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  nota FLOAT NOT NULL 
);
INSERT INTO alumnos (nombre, apellido, nota) VALUES 
('Isabella', 'Gómez', 9),
('Francisco', 'Pérez', 7),
('Lucía', 'Martínez', 8),
('Mateo', 'Rodríguez', 6),
('Cloe', 'López', 10),
('Tiago', 'Sánchez', 5),
('Sofía', 'Fernández', 9),
('Diego', 'Ramírez', 4),
('Martina', 'Díaz', 7),
('Joel','Acosta',10),
('Santino', 'Torres', 6.5);


DELIMITER //

CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    END IF;

    IF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END//

DELIMITER ;

INSERT INTO alumnos (nombre, apellido, nota) VALUES ('Prueba1', 'Negativa', -5);

INSERT INTO alumnos (nombre, apellido, nota) VALUES ('Prueba2', 'Excesiva', 12);

SELECT idAlumno, nombre, apellido, nota FROM alumnos WHERE nombre LIKE 'Prueba%';

SHOW CREATE TRIGGER trigger_check_nota_before_insert;

USE testDisparador;

DELIMITER //

CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    END IF;
    IF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END//

DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

UPDATE alumnos 
SET nota = -2.5 
WHERE nombre = 'Cloe';

UPDATE alumnos 
SET nota = -8.0 
WHERE idAlumno = 6;
SET SQL_SAFE_UPDATES = 1;

SELECT nombre, nota FROM alumnos WHERE nombre IN ('Cloe', 'Tiago');

