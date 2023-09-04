CREATE TRIGGER guestUpdate
ON guest
FOR DELETE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER,
CONCAT('VANAD ANDMED - ',deleted.first_name,',',deleted.last_name, ' UUED - ', inserted.first_name,',', inserted.last_name),'guest on uuendatud'
FROM deleted INNER JOIN inserted
ON deleted.id=inserted.id

UPDATE guest
set first_name = 'Polina'
where id =1;
