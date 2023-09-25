-- Первый факл

CREATE FUNCTION fn_DimEmployee()

Returns Table
as
Return(select EmployeeKey, FirstName, Lastname,Cast(BirthDate as Date) as DOB
from DimEmployee)
  
SELECT * FROM fn_DimEmployee()

CREATE FUNCTION fn_IDC_DimEmployee()
Returns @Table Table(Id int, Name nvarchar(20), DOB Date)
as
Begin
INSERT INTO @Table
SELECT EmployeeKey, FirstName,  Cast(BirthDate as Date)
From DimEmployee
Return
End
  
SELECT * FROM fn_IDC_DimEmployee()

Update fn_DimEmployee() set FirstName = 'Edvard' Where EmployeeKey = 1;

-- Второй файл

CREATE FUNCTION fn_GetEmployeeName(@Id int)
RETURNS nvarchar(20)
as
begin
Return(SELECT FirstName from DimEmployee Where EmployeeKey=@Id)
End

SELECT dbo.fn_GetEmployeeName(1) as Answer

ALTER Function fn_GetEmployeeName(@Id int)
Returns nvarchar(20)
With Encryption
as
Begin
Return(SELECT FirstName from DimEmployee Where EmployeeKey=@Id)
END

SELECT dbo.fn_GetEmployeeName(1) as Answer

ALTER Function fn_GetEmployeeName(@Id int)
Returns nvarchar(20)
With SchemaBinding
as
Begin
Return(SELECT FirstName from dbo.DimEmployee Where EmployeeKey=@Id)
END

SELECT dbo.fn_GetEmployeeName(1) as Answer

--Третий файл

CREATE TABLE #PersonDetails(
Id int,
Name nvarchar(20));

INSERT INTO #PersonDetails(Id,Name)
Values(1,'Mike');
INSERT INTO #PersonDetails(Id,Name)
Values(2,'John');
INSERT INTO #PersonDetails(Id,Name)
Values(3,'Todd');

CREATE PROCEDURE spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))
INSERT INTO #PersonDetails(Id,Name)
Values(1,'Mike');
INSERT INTO #PersonDetails(Id,Name)
Values(2,'John');
INSERT INTO #PersonDetails(Id,Name)
Values(3,'Todd');

SELECT * FROM  #PersonDetails
End

CREATE TABLE ##Employeedetails(Id int, Name nvarchar(20))

--Четвертый файл

SELECT * FROM DimEmployee where SickLeaveHours>30 and SickLeaveHours<60

CREATE index IX_DimEmployee_lHours
ON DimEmployee(SickLeaveHours ASC)

Drop index DimEmployee.NameIndex


--Пятый файл

CREATE TABLE [tblEmployee]
(
id int Primary key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50));

INSERT INTO tblEmployee
Values(3,'John',4500,'Male','New York');
INSERT INTO tblEmployee
Values(1,'Mike',2500,'Male','London');
INSERT INTO tblEmployee
Values(4,'Sara',5500,'Female','Tokyo');
INSERT INTO tblEmployee
Values(5,'Todd',3100,'Male','Toronto');
INSERT INTO tblEmployee
Values(2,'Pam',6500,'Female','Sydney');

CREATE Clustered Index IX_DimEmployee_Name
ON DimEmployee(EmployeeKey)

CREATE Clustered Index IX_tblEmployee_Name
ON tblEmployee(Name)
  
CREATE CLUSTERED INDEX IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender DESC, Salary ASC)

CREATE NONCLUSTERED INDEX IX_tblEmployee_Name
ON tblEmployee(Name)

--Шестой файл

CREATE TABLE [tblEmployee](
id int Primary key,
FirstName nvarchar(50),
LatName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50));

INSERT INTO tblEmployee
Values(1,'Mike','Sandoz',4500,'Male','New York')
INSERT INTO tblEmployee
Values(1,'John','Menco',2500,'Male','London')
--Мне выдало ошибку
--Далее я удалил первичный УНИКАЛЬНЫЙ ключ
-- и ввел эти же данные заново

CREATE UNIQUE NONCLUSTERED INDEX UIX_tblEmployee_FirstName_LastName
ON tblEmployee(FirstName,LatName)

ALTER TABLE tblEmployee
ADD CONSTRAINT UQ_tblEmployee_City
UNIQUE NONCLUSTERED(City)

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

-- Седьмой файл был выполнен по SELECT запросам поэтому в файле приложены только картинки.
