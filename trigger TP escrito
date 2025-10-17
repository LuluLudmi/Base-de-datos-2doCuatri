CREATE DATABASE testDisparador;
USE testDisparador;
CREATE TABLE  alumnos(
  `idAlumno` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  nota int(10) NOT NULL
 );
 SELECT*FROM alumnos;
 INSERT INTO alumnos (nombre, apellido, nota) VALUES 
('María', 'Gómez', 9),
('Juan', 'Pérez', 7),
('Lucía', 'Martínez', 8),
('Carlos', 'Rodríguez', 6),
('Ana', 'López', 10),
('Pedro', 'Sánchez', 5),
('Sofía', 'Fernández', 9),
('Diego', 'Ramírez', 4),
('Laura', 'Díaz', 7),
('Andrés', 'Torres', 6);

INSERT INTO alumnos (nombre, apellido, nota) VALUES ('Camila', 'Núñez', -5);


DELIMITER //

CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    -- Si la nota es menor que 0, la ajustamos a 0
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    END IF;

    -- Si la nota es mayor que 10, la ajustamos a 10
    IF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END//

DELIMITER ;
SHOW CREATE TRIGGER trigger_check_nota_before_insert



