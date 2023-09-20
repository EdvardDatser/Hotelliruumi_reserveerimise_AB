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
