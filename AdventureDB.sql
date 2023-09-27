CREATE TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
	PRINT 'NEW TABLE CREATED'
END

create table TestTable (Id int)

DROP TABLE Test;

ALTER TRIGGER trMyFirstTrigger
ON DATABASE 
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	PRINT ' A TABLE JUST BEEN CREATED, MODIFIED OR DELETED'
END

ALTER TRIGGER trMyFirstTrigger
ON DATABASE 
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	ROLLBACK
	PRINT 'YOU CANNOT CREATE, ALTER OR DROP A TABLE'
END

DISABLE TRIGGER trMyFirstTrigger ON DATABASE

DROP TRIGGER trMyFirstTrigger

CREATE TRIGGER trRenameTable
ON DATABASE
FOR RENAME 
AS
BEGIN
	PRINT 'YOU JUSTRENAMED SOMETHING'
END

sp_rename 'TestTable','NewTestTable'

-- Начало файла 93


CREATE TRIGGER tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE,DROP_TABLE
AS
BEGIN
	ROLLBACK
	PRINT 'You cannot create, alter or drop a table in the current database'
END

CREATE TABLE TESTT (ID INT)

CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
	ROLLBACK
	PRINT'You cannot create, alter or drop a table in any database on the server'
END

ENABLE TRIGGER tr_ServerScopteTrigger ON ALL SERVER

DROP TRIGGER tr_ServerScopteTrigger ON ALL SERVER

--Начало файла 94


CREATE TRIGGER tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
	PRINT 'DATABASE SCOPE TRIGGER'
END
GO

CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE
AS
BEGIN
	PRINT 'SERVER SCOPE TRIGGER'
END
GO

CREATE TABLE TESTS(ID INT)

EXEC sp_settriggerorder
@triggername = 'tr_DatabaseScopeTrigger',
@order='none',
@stmttype='CREATE_TABLE',
@namespace='DATABASE'
GO

--Начало файла 96

CREATE TRIGGER tr_LogonAuditTriggers
ON ALL SERVER
FOR LOGON
AS
BEGIN
	DECLARE @LoginName nvarchar(100)

	SET @LoginName = ORIGINAL_LOGIN()

	IF(SELECT COUNT(*) FROM sys.dm_exec_sessions
		WHERE is_user_process = 1
		AND original_login_name = @LoginName) >3
	BEGIN
		PRINT 'Fourth connection of' + @LoginName + 'blocked'
		ROLLBACK
	END
END

Execute sp_readerrorlog
