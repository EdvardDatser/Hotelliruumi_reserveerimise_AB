
--LISAMINE PROTSEDUUR-
go
CREATE PROCEDURE lisaGuest
@imja varchar(30),
@familija varchar(30)
AS
BEGIN
INSERT INTO guest(first_name,last_name)
VALUES(@imja, @familija);
SELECT * FROM guest;
END

EXEC lisaGuest @imja='EdaK', @familija='Datser';


--KUTSUTA PROTSEDUUR--

CREATE PROCEDURE deleteGuest
@id int
AS
BEGIN
SELECT * FROM guest;
DELETE FROM guest
WHERE @id = id;
SELECT * FROM guest;
END

exec deleteGuest 1;


--UPDATE PROTSEDUUR--

CREATE PROCEDURE AndmedUpdate
@ans varchar(20),
@ans2 varchar(20),
@id varchar(20)
AS
BEGIN
UPDATE guest SET first_name=@ans, last_name=@ans2
WHERE @id=id;
END
SELECT * FROM guest;
