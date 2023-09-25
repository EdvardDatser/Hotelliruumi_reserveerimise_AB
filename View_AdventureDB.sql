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




