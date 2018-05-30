/* Poner en uso la base de datos AdventureWorks */
USE AdventureWorks2016
GO

/* Listado de esquemas */
SELECT name FROM sys.schemas
ORDER BY name
GO

/* Listado de tablas */
SELECT name FROM sys.tables
ORDER BY name
GO

/* Visualizar todos los registros de la tabla Products */
SELECT *
FROM Production.Product
GO

/* Ver estructura de tabla */
EXEC sp_help 'Production.Product'
GO

/* Ver todos los registros de la tabla productos */
SELECT * 
FROM Production.Product
GO

/* Cuantos productos no pertenecen a una sub categoría */
SELECT COUNT(*) AS Total
FROM Production.Product
WHERE Production.Product.ProductSubcategoryID IS NULL
GO

/* Ver listado de Subcategoría de productos */
SELECT *
FROM Production.ProductCategory
GO

/* Ver listado de Subcategoría */
SELECT *
FROM Production.ProductSubcategory
GO

/* Visualizar las subcategorías con sus respectivas categorías */
SELECT Production.ProductSubcategory.Name AS 'Subcategoría', Production.ProductCategory.Name AS 'Categoría'
FROM Production.ProductSubcategory
INNER JOIN Production.ProductCategory
ON ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID
ORDER BY Production.ProductCategory.Name ASC

/* Ver cantidad de productos por subcategoría */
SELECT Production.ProductSubcategory.Name AS 'Subcategoría', COUNT(Production.Product.ProductSubcategoryID) AS 'Total'
FROM Production.Product 
INNER JOIN Production.ProductSubcategory
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
GROUP BY Production.ProductSubcategory.Name
ORDER BY Total, Production.ProductSubcategory.Name
GO

/* Ver precio promedio de productos por categoría */
SELECT Production.ProductCategory.name AS 'Categoría', AVG(Production.Product.ListPrice)  AS 'Precio Promedio'
FROM Production.Product
INNER JOIN Production.ProductSubcategory 
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
INNER JOIN Production.ProductCategory
ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID
GROUP BY Production.ProductCategory.Name
GO

/* Ver cantidad de productos por categoría */
SELECT Production.ProductCategory.name AS 'Categoría', SUM(Production.Product.ProductSubcategoryID)  AS 'Cantidad Productos'
FROM Production.Product
INNER JOIN Production.ProductSubcategory 
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
INNER JOIN Production.ProductCategory
ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID
GROUP BY Production.ProductCategory.Name
GO

/* Ver cantidad de productos de la categoría Components */
SELECT Production.ProductCategory.name AS 'Categoría', SUM(Production.Product.ProductSubcategoryID)  AS 'Precio Promedio'
FROM Production.Product
INNER JOIN Production.ProductSubcategory 
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
INNER JOIN Production.ProductCategory
ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID
WHERE Production.ProductCategory.Name = 'Components'
GROUP BY Production.ProductCategory.Name
GO

/* Ver cantidad total de empleados */
SELECT COUNT(BusinessEntityID)
FROM HumanResources.Employee
GO
/* Cantidad de Empleados Solteros y Casados */
SELECT MaritalStatus AS 'Estado Civil', COUNT(MaritalStatus) AS 'Cantidad'
FROM HumanResources.Employee
GROUP BY MaritalStatus
GO

/* Cantidad de Empleados por género */
SELECT HumanResources.Employee.Gender AS 'Género', COUNT(Employee.Gender) AS 'Total'
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.Gender
GO

/* Ver listado de Departamentos */
SELECT *
FROM HumanResources.Department

/* Listado de empleados por departamento y año en el que estuvieron en dicho departamento */
SELECT Person.LastName AS Empleado, HumanResources.Department.Name AS Departamento, 
YEAR(HumanResources.EmployeeDepartmentHistory.StartDate) AS AñO
FROM HumanResources.Employee
INNER JOIN Person.Person
ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory
ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
ORDER BY YEAR(HumanResources.EmployeeDepartmentHistory.StartDate) ASC
GO

/* Cantidad de empleados por departamento */
SELECT HumanResources.Department.GroupName AS Departamento, count(HumanResources.Employee.BusinessEntityID) AS Total
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory 
ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Department.GroupName
GO

/* Ranking de los métodos de envío utilizados */ 
SELECT Purchasing.ShipMethod.Name, COUNT(Purchasing.PurchaseOrderHeader.ShipMethodID)Total
FROM Purchasing.PurchaseOrderHeader
INNER JOIN Purchasing.ShipMethod
ON Purchasing.PurchaseOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name
ORDER BY COUNT(Purchasing.PurchaseOrderHeader.ShipMethodID) DESC
GO

/* Listar la cantidad de órdenes ventas por año */
SELECT YEAR(Sales.SalesOrderHeader.OrderDate) AS Año, COUNT(YEAR(Sales.SalesOrderHeader.OrderDate)) AS Cantidad 
FROM Sales.SalesOrderHeader
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate)
GO

/* Listar la cantidad de órdenes ventas por año y detallado por mes respectivo */
SELECT YEAR(Sales.SalesOrderHeader.OrderDate) AS Año, DATENAME(MONTH, Sales.SalesOrderHeader.OrderDate) AS Mes,
    COUNT(YEAR(Sales.SalesOrderHeader.OrderDate)) AS Cantidad
FROM Sales.SalesOrderHeader
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate), DATENAME(MONTH, Sales.SalesOrderHeader.OrderDate), MONTH(Sales.SalesOrderHeader.OrderDate)
ORDER BY YEAR(Sales.SalesOrderHeader.OrderDate), MONTH(Sales.SalesOrderHeader.OrderDate) ASC
GO
