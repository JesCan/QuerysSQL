/* Crear base de datos */
CREATE DATABASE DemoDB;
GO

/* Crear base de datos Hospital */
CREATE DATABASE Hospital;
GO

/* Crear base de datos Inventario con parámetros */
CREATE DATABASE InventarioEquipos  
ON   
( NAME = Sales_dat,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\InventarioEquipos.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = Sales_log,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\InventarioEquipos.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB ) ;  
GO 

/* Poner en uso una base de datos DemoDB*/
Use DemoDB;
GO

/* Poner en uso Hospital */
Use Hospital;
GO

/* Ver listado de Base de Datos */
SELECT database_id, name, create_date  
FROM sys.databases;
GO 

/* Eliminar base de datos DemoDB */
USE master; --- Se sugiere poner en uso la base de datos master antes de eliminar nuestra base de datos
DROP DATABASE DemoDB;
GO

/* Ver información de Base de Datos Hospital */
EXEC sp_helpdb Hospital;
GO

/* Ver información de Base de Datos Inventario */
EXEC sp_helpdb InventarioEquipos;
GO

/* Restaurar base de datos AdventureWorks2016.bak */
Revisar el link: 

/* Ver las tablas de la base de datos AdventureWorks2016 */
USE AdventureWorks2016;
Select [NAME] from sys.tables
Select [NAME] from sys.views
select name from sysobjects where type='U';
GO

SELECT * FROM Production.Product;


/* Podremos ver tambien las vistas de una base de datos */

