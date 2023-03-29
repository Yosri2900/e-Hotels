set search_path="courseproject";

CREATE TABLE IF NOT EXISTS hotel_chain(
	chain_brand VARCHAR(100),
 	phone_number VARCHAR(14),
	address VARCHAR(100),
	contact_email VARCHAR(40),
	logo_img VARCHAR(2048),
	num_of_hotel int,
	PRIMARY KEY(chain_brand)
);
-- need 5 hotel_chain
INSERT INTO hotel_chain (chain_brand, phone_number, address, contact_email, logo_img, num_of_hotel)
	VALUES ('Hilton Worldwide', '1-800-123-4567', '3556 St. Paul Street. Ontario. Canada', 'hiltonww@gmail.com', 'https://logos-world.net/wp-content/uploads/2021/02/Hilton-Worldwide-Logo-2009-2016.png',10),
			('Accor S.A.', '1-800-456-7890', '276 Country Road. Ontario. Canada', 'accordsa@gmail.com', 'https://cdn.cookielaw.org/logos/a9a7c29d-9ac6-471d-9d50-9e5237da1bab/e2d1b028-f01a-4a0a-b25c-26d2e9e77a02/47654e12-6331-48a4-b9fa-edab87102bbc/ACCORlogoHorizontalGRADIENT_RGB_digital.png',12),
			('Kimpton Hotels & Restaurants', '1-800-321-7654', '4988 Heritage Drive. Ontario. Canada', 'kimptonhotelsres@gmail.com', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Kimpton_Hotels_%26_Restaurants_logo.svg/2560px-Kimpton_Hotels_%26_Restaurants_logo.svg.png',8),
			('Hyatt Hotels & Resorts', '(360)-262-9550', '797 Koontz Rd. Washington. USA', 'hyatthotelres@gmail.com', 'https://1000logos.net/wp-content/uploads/2019/11/Hyatt-Logo.png',15),
			('marriott international', '(740)-494-2331', '121 Creekside Dr. New York. USA', 'marriottinterna@gmail.com', 'https://logos-world.net/wp-content/uploads/2020/11/Marriott-International-Logo-1993-2016.png',11)

select * from hotel;
delete from hotel;
drop table hotel;
CREATE TABLE IF NOT EXISTS hotel(
	hotel_name VARCHAR(100),
	member_of VARCHAR(100),
	rating int CHECK (rating > 0 and rating < 6),
	num_of_room int NOT NULL,
	email VARCHAR(40),
	phone_num VARCHAR(14),
	address VARCHAR(100),
	
	PRIMARY KEY (hotel_name),
	FOREIGN KEY (member_of) REFERENCES hotel_chain(chain_brand)
);

INSERT INTO hotel (hotel_name, member_of, rating, num_of_room, email, address, phone_num)
	VALUES 
INSERT INTO VALUES hotel (hotel_name,member_of,rating,num_of_room,email,phone_num,address)
('Kimpton Hotels','Kimpton Hotels & Restaurants',4,199,'hiltonww@gmail.com','1-800-321-7654','1052 St George Street. British Columbia. Canada'),
('Hilton Worldwide Hotels','Hilton Worldwide',5,100,'hiltonww@gmail.com','1-800-123-4567','3065 Duke Street. Quebec. Canada'),
('Accor Hotels','Accor S.A.',4,120,'accordsa@gmail.com','1-800-456-7890','1303 James Street. Ontario Canada'),
('James Accord-SA','Accor S.A.',4,120,'accordsa_James@gmail.com','1-800-456-7890','1303 James Street. Ontario Canada'),
('Wellington Accord-SA','Accor S.A.',5,110,'accordsa_wellington@gmail.com','1-800-458-9230','230 Wellington Street. Ontario Canada'),
('Timothy Accord-SA','Accor S.A.',5,320,'accordsa_Timothy@gmail.com','1-800-400-2234','500 Timothy Street. Quebec Canada'),
('Harper Accord-SA','Accor S.A.',3,40,'accordsa_harper@gmail.com','1-800-396-7070',' 2300 Harper Street. Manitoba Canada'),
('York Accord-SA','Accor S.A.',4,509,'accordsa_york@gmail.com','1-800-935-7990','3 york Street. New Brunswick Canada'),
('King Accord-SA','Accor S.A.',2,25,'accordsa_kingedward@gmail.com','1-800-600-8220','12 King Edward Street. Ontario Canada'),
('Hill Accord-SA','Accor S.A.',5,550,'accordsa_hill@gmail.com','1-800-500-2350','1000 Hill Boulevard. British Colombia Canada'),
('Oakland Accord-SA','Accor S.A.',3,100,'accordsa_oakland@gmail.com','1-800-552-1982','5 Oakland Way. Nunavut Canada'),
('Qubebec Hilton Worldwide','Hilton Worldwide',5,100,'hiltonww@gmail.com','1-800-123-4567','3065 Duke Street. Quebec Canada'),
('Octa hilton-worldwide','Hilton Worldwide',4,80,'hiltonww_octa@gmail.com','1-800-888-7987','8 Octa Street. Quebec Canada'),
('John hilton-worldwide','Hilton Worldwide',3,150,'hiltonww_John@gmail.com','1-800-122-9237','306 John Street. Nova Scotia Canada'),
('Carling hilton-worldwide','Hilton Worldwide',2,180,'hiltonww_carling@gmail.com','1-800-129-9807','65 Carling Street. Ontario Canada'),
('Piper hilton-worldwide','Hilton Worldwide',3,550,'hiltonww_piper@gmail.com','1-800-113-4127','65 Piper Street. Quebec Canada'),
('David hilton-worldwide','Hilton Worldwide',2,170,'hiltonww@gmail.com','1-800-122-7767','35 David Street. New Brunswick Canada'),
('Wall hilton-worldwide','Hilton Worldwide',5,100,'hiltonww_wall@gmail.com','1-800-333-2567','5 wall Street. Quebec. Canada'),
('Elder hilton-worldwide','Hilton Worldwide',5,690,'hiltonww_elder@gmail.com','1-800-122-6333','8 Elder Street. British Columbia Canada'),
('George Kimpton Hotels & Restaurants','Hyatt Hotels & Resorts',4,199,'KHR_george@gmail.com','1-800-321-7654','1052 St George Street. British Columbia Canada'),
('Bell Kimpton Hotels & Restaurants','Hyatt Hotels & Resorts',5,95,'KHR_bell@gmail.com','1-800-331-7774','52 Bell Street. Ontario Canada'),
('Lincoln Kimpton Hotels & Restaurants','Hyatt Hotels & Resorts',1,6,'KHR_lincoln@gmail.com','1-800-333-8778','2 lincoln Drive. Quebec Canada'),
('Edgar Kimpton Hotels & Restaurants','Hyatt Hotels & Resorts',5,535,'KHR_edgar@gmail.com','1-800-931-9928','22 edgar Street. Ontario Canada'),
('Fisher Kimpton Hotels & Restaurants','Hyatt Hotels & Resorts',3,700,'KHR_fisher@gmail.com','1-800-833-4554','7 Fisher Street. Ontario Canada'),
('Park Kimpton Hotels & Restaurants','Hyatt Hotels & Resorts',4,455,'KHR_park@gmail.com','1-800-541-9874','34 park Street. British Columbia Canada'),
('Club Kimpton Hotels & Restaurants','Hyatt Hotels & Resorts',3,22,'KHR_club@gmail.com','1-800-200-2974','8 Club Road. Manitoba Canada'),
('Algoma Kimpton Hotels & Restaurants','Hyatt Hotels & Resorts',4,35,'KHR_algoma@gmail.com','1-800-555-6775','400 Algoma Street. Alberta Canada'),
('Rocher marriott international','marriott international',5,300,'mariott_rocher@gmail.com','1-800-888-7987','80 Rocher Street. Ontario Canada'),
('Peter marriott international','marriott international',4,700,'mariott_peter@gmail.com','1-800-700-4387','345 Peter Street. British Columbia Canada'),
('Wood marriott international','marriott international',3,555,'mariott_wood@gmail.com','1-800-290-2087','65 Woodburn Street. Ontario Canada'),
('Daisy marriott international','marriott international',4,700,'mariott_daisy@gmail.com','1-800-100-9944','75  Daily Street. Ontario Canada'),
('Highland marriott international','marriott international',4,780,'mariott_highland@gmail.com','1-800-110-5944','5 Highland Street. Manitoba Canada'),
('Blackburn marriott international','marriott international',2,15,'mariott_blackburn@gmail.com','1-800-220-9224','20 Blackburn Street. Ontario Canada'),
('Bathgate marriott international','marriott international',5,60,'mariott_bathgate@gmail.com','1-800-999-9944','22 Bathgate Street. Ontario Canada'),
('Rise marriott international','marriott international',4,100,'mariott_rise@gmail.com','1-800-500-5344','33 Rise Street. Nunavut Canada'),
('Sunshine Hyatt Hotels & Resorts','Hyatt Hotels & Resorts',2,101,'hyatthotelres_sunshine@gmail.com','1-800-969-9644','3 Sunshine Street. Yukon Canada'),
('Gate Hyatt Hotels & Resorts','Hyatt Hotels & Resorts',4,200,'hyatthotelres_gate@gmail.com','1-800-109-9646','68 Gate Street. Yukon Canada'),
('Mont Hyatt Hotels & Resorts','Hyatt Hotels & Resorts',3,101,'hyatthotelres_mont@gmail.com','1-800-966-5586','25 Mont Street. Ontario Canada'),
('Beaverpond Hyatt Hotels & Resorts','Hyatt Hotels & Resorts',3,150,'hyatthotelres_beaverpond@gmail.com','1-800-262-2654','1512 Beaverpond Street. Ontario Canada'),
('Hide Hyatt Hotels & Resorts','Hyatt Hotels & Resorts',5,400,'hyatthotelres_hide@gmail.com','1-800-866-9954','100 Hide Street. Nova Scotia Canada'),
('Hillary Hyatt Hotels & Resorts','Hyatt Hotels & Resorts',4,111,'hyatthotelres_hillary@gmail.com','1-800-339-4454','22 Hillary Street. Yukon Canada'),
('Nile Hyatt Hotels & Resorts','Hyatt Hotels & Resorts',5,151,'hyatthotelres_nile@gmail.com','1-800-239-9214','2 Nile Street. Alberta Canada'),
('Andy Hyatt Hotels & Resorts','Hyatt Hotels & Resorts',4,101,'hyatthotelres_andy@gmail.com','1-800-339-1128','65 Andy Street. Yukon Canada');


CREATE TABLE IF NOT EXISTS employee(
	employee_id int,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(40),
	manager_id int,
	
	PRIMARY KEY (employee_id),
	FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);
INSERT INTO employee(employee_id, first_name, last_name, email, manager_id) 
	VALUES (4529 ,'Nancy', 'Young', 'nancyyoung@gmail.com', 4125),
			(4238 ,'Jhon', 'Simon', 'jhonsimon@gmail.com', 4125),
			(4329 ,'Martina', 'Candreva', 'martinacandreva@gmail.com', 4125)

select * from hotel_chain;
select * from hotel;
select * from employee;

-- DROP TABLE customer;
DELETE FROM customer;
select * from customer;
	
DELETE FROM BOOKING WHERE booking_id=2180;DELETE FROM customer WHERE sin IN (SELECT customer_sin FROM booking WHERE booking_id=2180);
 
CREATE TABLE IF NOT EXISTS customer(
	sin VARCHAR(11),
	address VARCHAR(100),
	first_name VARCHAR(100) UNIQUE,
	last_name VARCHAR(100),
	
	PRIMARY KEY(sin)
);
-- dates in postgresql are YYYY-MM-DD
INSERT INTO customer(sin, address, first_name, last_name)
	VALUES ('111-11-1111', '2023-01-01', '3306 St Marys Rd. Manitoba. Canada', 'Marco', 'Polo')
	
CREATE TABLE IF NOT EXISTS customer_account(
	cemail VARCHAR(255) NOT NULL,
	cpwd VARCHAR(16) NOT NULL
	
);
-- drop table customer_account;
select * from customer_account;
select * from customer;
-- DELETE FROM booking;
select * from booking;
DROP TABLE booking;
CREATE TABLE IF NOT EXISTS booking (
	booking_id int,
	tdate VARCHAR(10),
	period_of_time int,
	customer_sin VARCHAR(11),
	employee_id int,
	
	PRIMARY KEY (booking_id),
	FOREIGN KEY (customer_sin) REFERENCES customer(sin),
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
	
);
-- DROP TABLE booking;
INSERT INTO booking (booking_id, tdate, chain_name, period_of_time, customer_sin, employee_id)
	VALUES (123456789, '2023-01-01', 12, '111-11-1111', 4529)

select * from room;
-- drop table room;
-- delete from room;

CREATE TABLE IF NOT EXISTS room (
	room_id VARCHAR(100),
	member_of VARCHAR(100),
	is_available VARCHAR(5),
	is_expandible VARCHAR(5),
	has_view VARCHAR(5),
	has_problems VARCHAR(5),
	has_amenities VARCHAR(5),
	capacity int,
	room_img VARCHAR(2048),
	
	PRIMARY KEY (room_id),
	FOREIGN KEY (member_of) REFERENCES hotel_chain(chain_brand)
);
INSERT INTO room(room_id, member_of, is_available, is_expandible, has_view, has_problems, has_amenities, capacity, room_img)
	VALUES ('352001001', 'Hilton Worldwide', 'true', 'false', 'true', 'false', 'false', 2,'https://media.cntraveler.com/photos/5a29568bb70da5581cb857e4/16:9/w_1280,c_limit/hilton-memphis-cr-courtesy.jpg'),
															 
			('553200001', 'Kimpton Hotels & Restaurants', 'true', 'false', 'false', 'true', 'true', 3, 'https://ihg.scene7.com/is/image/ihg/kimpton-enso-king-corner-teaser-carousel'),
																								 
			('663001002', 'Accor S.A.', 'false', 'true', 'true', 'true', 'false', 5, 'https://group.accor.com/-/media/Corporate/News-images/2019/09/18/201910-innovations-smartroom.jpg?version=1')
INSERT INTO room(room_id, member_of, is_available, is_expandible, has_view, has_problems, has_amenities, capacity, room_img)
	VALUES ('663001003', 'Accor S.A.', 'true', 'false', 'false', 'true', 'true', 5, 'https://media.istockphoto.com/id/843823656/photo/hotel-room.jpg?s=612x612&w=0&k=20&c=8-ZNA52e5GlPuuQPXqZRgsTO9WRZwZgFtDotyC6CGHY='),
	('553200003', 'Kimpton Hotels & Restaurants', 'true', 'false', 'false', 'true', 'true', 3, 'https://www.thespruce.com/thmb/iMt63n8NGCojUETr6-T8oj-5-ns=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/PAinteriors-7-cafe9c2bd6be4823b9345e591e4f367f.jpg')

DROP TABLE renting;
DROP TABLE archive;
CREATE TABLE IF NOT EXISTS renting (
	room_id VARCHAR(100),
	period_of_time int,
	customer_name VARCHAR(100),
	booking_id int
	
-- 	FOREIGN KEY (room_id) REFERENCES room(room_id),
-- 	FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
);



CREATE TABLE IF NOT EXISTS archive (
	room_id VARCHAR(100),
	period_of_time int,
	customer_name VARCHAR(100),
	booking_id int

-- 	FOREIGN KEY (room_id) REFERENCES room(room_id),
-- 	FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
);

-- SELECT hotel_name, COUNT(*) FROM 
-- 	hotel h
-- 		join room r
-- 			on h.hotel_name = r.member_of
-- 			GROUP BY hotel_name;
			
-- SELECT * FROM room WHERE room.member_of = 'Kimpton Hotels & Restaurants';
			
SELECT * FROM booking, customer WHERE booking.customer_sin = customer.sin;
DELETE FROM booking WHERE booking_id = 4468;
