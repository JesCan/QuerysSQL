/* --- Trabajando con Vistas ----- */

/* Crear Base de Datos DEMO */
CREATE DATABASE Demo
GO

/* Crear tabla */
USE Demo
GO
CREATE TABLE Empleado
(
    idEmp INT NOT NULL PRIMARY KEY, -- primary key column
    NomEmp [NVARCHAR](50) NOT NULL,
    ApeEmp [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
GO

/* Insertar registro */
INSERT INTO Empleado
( idEmp,NomEmp,ApeEmp)
VALUES
( 1, 'Pedro', 'Campos'),
( 2, 'Rosa', 'Vasquez')
GO

/* Ver registros agregados */
SELECT *
FROM Empleado
GO

/* Crear Vista empleados */
CREATE VIEW vw_Empleados
AS
    SELECT *
    FROM Empleado
GO

/* Ver registros en vista empleados*/
SELECT * FROM vw_Empleados
GO

/* Insertar registros a empleados */
INSERT INTO Empleado
( idEmp,NomEmp,ApeEmp)
VALUES
( 3, 'Carlos', 'Suárez'),
( 4, 'Claudia', 'Portocarrero')
GO

/* Ver registros en tabla empleados*/
SELECT *
FROM Empleado
GO

/* Ver registros en vista empleados*/
SELECT *
FROM vw_Empleados
GO

/* Poniendo en uso DB AdventureWorks2016 */
Use AdventureWorks2016
GO

/* Crear una vista que permita visualizar l  */