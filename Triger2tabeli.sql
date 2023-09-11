--Для задания я выбрал две следующие таблицы--
--"room", "room_type".

--Создание таблицы для отслеживания данных--

CREATE TABLE logi(
roomID int primary key identity(1,1),
andmed TEXT,
kuupaev DATETIME,
kasutaja varchar(100));

--Cоздание первого триггера--
CREATE TRIGGER roomLisamine --Название триггера--
ON room --Ссылаясь на таблицу room--
FOR INSERT --Выполнение функции--
AS
INSERT INTO logi(kuupaev, andmed, kasutaja) -- Заполнение значений--
SELECT GETDATE(), --Функция получения даты--
CONCAT(inserted.number,',',inserted.name,',',inserted.status,',',inserted.smoke,',', rt.description,',',rt.max_capacity), --Указываются значения в функции CONCAT(), которые будут заполняться в столбец "andmed" в таблицу "logi". Расставленны знаки препинания и тд.
USER --функция USER
FROM inserted
INNER JOIN room_type rt ON inserted.room_type_id=rt.id --Связь таблиц, связываю таблицу "room_type" и обзываю ее rt, и указываю что введеный "id" в таблице "room" равен "id" в таблице "room_type_id".

--Проверка--
INSERT INTO room(number,name,status,smoke,room_type_id)
Values('B66','TestRoom','Occupied',1,1)
SELECT * FROM room_type;
SELECT * FROM room;
SELECT * FROM logi;

--Второй триггер--
CREATE TRIGGER roomStatusUpdate --Имя--
ON room --Таблица--
FOR DELETE --Действие--
AS
INSERT INTO logi(kuupaev,andmed,kasutaja) --Таблица для отчета--
SELECT GETDATE(), --Функция для получения даты--
CONCAT('VANAD ANDMED - ',deleted.number,',',deleted.name,',',deleted.status,',',deleted.smoke,rt1.description,',',rt1.max_capacity,',', 
' UUED - ', inserted.number,',', inserted.name,',',inserted.status,',',inserted.smoke,rt2.description,rt2.max_capacity), --Заполнение значений--
USER
FROM deleted
INNER JOIN inserted ON deleted.id=inserted.id
INNER JOIN room_type rt1 ON deleted.id=rt1.id
INNER JOIN room_type rt2 ON inserted.id=rt2.id --Связи--

--Проверка--
SELECT * FROM room;
UPDATE room set room_type_id=2
WHERE name='CornerRoom';
SELECT * FROM room;
SELECT * FROM logi;


--XAMPP--

--Первый триггер-- 

INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT NOW(),
CONCAT(NEW.number,',',NEW.name,',',NEW.status,',',NEW.smoke,',', rt.description,',',rt.max_capacity),
USER()
FROM room r
INNER JOIN room_type rt 
ON r.room_type_id=rt.id
WHERE r.id=NEW.id

--Проверка--
  
INSERT INTO room(number,name,status,smoke,room_type_id) Values('B44','TestRoom','Occupied',1,1); 

--Второй триггер--

INSERT INTO logi(kuupaev,andmed,kasutaja)
SELECT NOW(),
CONCAT('VANAD ANDMED - ',OLD.number,',',OLD.name,',',OLD.status,',',OLD.smoke,rt1.description,',',rt1.max_capacity,',', 
' UUED - ', NEW.number,',', NEW.name,',',NEW.status,',',NEW.smoke,rt2.description,rt2.max_capacity),
USER()
FROM deleted
INNER JOIN NEW ON OLD.id=NEW.id
INNER JOIN room_type rt1 ON OLD.id=rt1.id
INNER JOIN room_type rt2 ON NEW.id=rt2.id

--Проверка--
UPDATE room set room_type_id=2
WHERE name='CornerRoom';





