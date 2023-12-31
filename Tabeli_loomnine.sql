# Hotelliruumi_reserveerimise_AB

  
CREATE TABLE guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date
);


CREATE TABLE room_type(
id int primary key identity(1,1),
description varchar(80),
max_capacity int
);

CREATE TABLE reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references  guest(id));


CREATE TABLE reserved_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key (room_type_id) REFERENCES room_type(id),
foreign key (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE room(
id int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke BIT,
room_type_id int,
foreign key (room_type_id) REFERENCES room_type(id)
);

CREATE TABLE occupied_room(
id int primary key identity(1,1),
check_in datetime,
check_out datetime,
room_id int,
reservation_id int,
foreign key (room_id) REFERENCES room(id),
foreign key (reservation_id) REFERENCES reservation(id)
);


CREATE TABLE hosted_at(
id int primary key identity(1,1),
guest_id int,
occupied_room_id int,
foreign key (guest_id) REFERENCES guest(id),
foreign key (occupied_room_id) REFERENCES occupied_room(id)
);
