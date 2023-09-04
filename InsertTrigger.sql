CREATE TRIGGER guestLisamine
ON guest
FOR INSERT 
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER,
CONCAT(inserted.first_name,',',inserted.last_name),'guest on lisatud'
FROM inserted

INSERT INTO guest(first_name,last_name, member_since)
Values('Edvard', 'Datser', '2020-03-22')

SELECT * FROM logi;
