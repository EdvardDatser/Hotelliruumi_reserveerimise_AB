-- Первый файл "View"

CREATE TABLE tblEmployee(
id int Primary key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int);

CREATE TABLE tblDepartment(
DeptId int primary key,
DeptName nvarchar(20));

INSERT INTO tblDepartment
Values(1,'IT')
INSERT INTO tblDepartment
Values(2,'Payroll')
INSERT INTO tblDepartment
Values(3,'HR')
INSERT INTO tblDepartment
Values(4,'Admin')

INSERT INTO tblEmployee
Values(1,'John', 5000, 'Male',3)
INSERT INTO tblEmployee
Values(2,'Mike', 3400, 'Male',2)
INSERT INTO tblEmployee
Values(3,'Pam', 6000, 'Female',1)
INSERT INTO tblEmployee
Values(4,'Todd', 4800, 'Male',4)
INSERT INTO tblEmployee
Values(5,'Sara', 3200, 'Female',1)
INSERT INTO tblEmployee
Values(6,'Ben', 4800, 'Male',3)

SELECT Id, Name, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartment
ON tblEmployee.DepartmentId=tblDepartment.DeptId

CREATE VIEW vWEmployeesByDepartment
as
SELECT Id,Name,Salary, Gender, DeptName
FROM tblEmployee
join tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.DeptId

SELECT * FROM vWEmployeesByDepartment

CREATE VIEW vWITDepartmeńt_Employees
as
SELECT Id, Name, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.DeptId
WHERE tblDepartment.DeptName = 'IT'

SELECT * FROM vWITDepartmeńt_Employees

CREATE View vWEmployeesNonConfidentialData
AS
SELECT Id, Name, Gender, DeptName
FROM tblEmployee
join tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.DeptId

SELECT * FROM vWEmployeesNonConfidentialData

CREATE VIEW vWEmployeesCountByDepartment
AS
SELECT DeptName, COUNT(Id) as TotalEmployees
FROM tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
Group By DeptName

--Второй файл "View"

CREATE VIEW VweEmployeesDataExceptSalary
AS
SELECT Id, Name, Gender, DepartmentId 
FROM tblEmployee

UPDATE VweEmployeesDataExceptSalary
SET Name = 'Mikey' Where Id = 2

SELECT * FROM  VweEmployeesDataExceptSalary

DELETE FROM VweEmployeesDataExceptSalary where Id = 2
INSERT INTO VweEmployeesDataExceptSalary
VALUES(2, 'Mikey', 'Male',2)

SELECT * FROM  VweEmployeesDataExceptSalary

CREATE VIEW vwEmployeeDetailsByDepartment
AS
SELECT Id, Name, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.DeptId

SELECT * FROM vwEmployeeDetailsByDepartment

UPDATE vwEmployeeDetailsByDepartment
SET DeptName = 'IT' Where Name = 'John'


--Третий файл "View"

CREATE TABLE tblProduct(
ProductId int primary key,
Name nvarchar(20),
UnitPrice int);

INSERT INTO tblProduct
Values(1, 'Books', 20)
INSERT INTO tblProduct
Values(2, 'Pens', 14)
INSERT INTO tblProduct
Values(3, 'Pencils', 11)
INSERT INTO tblProduct
Values(4, 'Clips', 10)

CREATE TABLE tblProductSales(
ProductId int,
QuantitySold int);

INSERT INTO tblProductSales
Values(1,10)
INSERT INTO tblProductSales
Values(3,23)
INSERT INTO tblProductSales
Values(4,21)
INSERT INTO tblProductSales
Values(2,12)
INSERT INTO tblProductSales
Values(1,13)
INSERT INTO tblProductSales
Values(3,12)
INSERT INTO tblProductSales
Values(4,13)
INSERT INTO tblProductSales
Values(1,11)
INSERT INTO tblProductSales
Values(2,12)
INSERT INTO tblProductSales
Values(1,14)

SELECT * FROM tblProductSales;
SELECT * FROM tblProduct;

CREATE VIEW vWTotalSalesByProduct
with SchemaBinding
AS
SELECT Name,
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales,
Count_BIG(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name

SELECT * FROM vWTotalSalesByProduct

CREATE UNIQUE CLUSTERED INDEX UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)


--Четвёртый файл

CREATE TABLE tblEmployee(
id int Primary key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int);

Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)

SELECT * FROM tblEmployee

Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)

Select * from dbo.fnEmployeeDetails('Male')

Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

SELECT * FROM ##TestTempTable



