

<-----------------Таблица-reservation-------------->
INSERT INTO reservation(date_in, date_out, made_by,guest_id)
Values('2023-04-22', '2023-04-30','F',1);
INSERT INTO reservation(date_in, date_out, made_by,guest_id)
Values('2021-05-22', '2022-05-30','M',2);
INSERT INTO reservation(date_in, date_out, made_by,guest_id)
Values('2020-12-02', '2021-05-30','M',3);
INSERT INTO reservation(date_in, date_out, made_by,guest_id)
Values('2018-12-02', '2021-05-30','F',4);
INSERT INTO reservation(date_in, date_out, made_by,guest_id)
Values('2022-01-02', '2022-02-30','F',5);
<------------------------------------------------->


<-----------------Таблица-guest------------------->
INSERT INTO guest(first_name,last_name, member_since)
Values('Edvard', 'Datser', '2020-03-22')
INSERT INTO guest(first_name,last_name, member_since)
Values('Irina', 'Mazakova', '2012-03-22')
INSERT INTO guest(first_name,last_name, member_since)
Values('Irina', 'Mazakova', '2012-03-22')
INSERT INTO guest(first_name,last_name, member_since)
Values('Vin', 'Diesel', '2000-11-11')
INSERT INTO guest(first_name,last_name, member_since)
Values('Kiriko', 'Shimada', '2014-05-16')
<------------------------------------------------->

<-----------------Таблица-room_type--------------->
INSERT INTO room_type(description, max_capacity)
Values('Lux-klass',50)
INSERT INTO room_type(description, max_capacity)
Values('Budget',2)
INSERT INTO room_type(description, max_capacity)
Values('Econom',10)
<------------------------------------------------->


<-----------------Таблица-room-------------------->
INSERT INTO room(number,name,status,smoke,room_type_id)
Values('A11','CornerRoom','Occupied',0,1)
INSERT INTO room(number,name,status,smoke,room_type_id)
Values('A12','BigRoom','Free',0,2)
INSERT INTO room(number,name,status,smoke,room_type_id)
Values('A13','SmallRoom','Occupied',1,3)
INSERT INTO room(number,name,status,smoke,room_type_id)
Values('A14','SmallRoom','Free',2,1)
INSERT INTO room(number,name,status,smoke,room_type_id)
Values('A15','GreatViewRoom','Occupied',1,1)
<-------------------------------------------------->

<--------------Таблица-occupied_room--------------->










