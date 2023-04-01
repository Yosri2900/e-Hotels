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
	VALUES ('Kimpton Hotels', 'Kimpton Hotels & Restaurants', 4, 199, 'hiltonww@gmail.com', '1052 St George Street. British Columbia. Canada', '1-800-321-7654'),
																								 
	('Hilton Worldwide Hotels', 'Hilton Worldwide',5, 100, 'hiltonww@gmail.com', '3065 Duke Street. Quebec. Canada', '1-800-123-4567'),
															 
	('Accor Hotels', 'Accor S.A.', 4, 120, 'accordsa@gmail.com','1303 James Street. Ontario Canada', '1-800-456-7890')

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
	
-- DELETE FROM BOOKING WHERE booking_id=2180;DELETE FROM customer WHERE sin IN (SELECT customer_sin FROM booking WHERE booking_id=2180);
 
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
DELETE FROM booking;
select * from booking;
-- DROP TABLE booking;
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
	VALUES 
	('111111102', 'Accor S.A.', 'false', 'true', 'true', 'true', 'false',4, 'https://group.accor.com/-/media/Corporate/News-images/2019/09/18/201910-innovations-smartroom.jpg?version=1');
	
DROP TABLE renting;
-- DROP TABLE archive;
select * from renting;

CREATE TABLE IF NOT EXISTS renting (
	period_of_time int,
	customer_sin VARCHAR(11),
	booking_id int
	
-- 	FOREIGN KEY (room_id) REFERENCES room(room_id),
-- 	FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
);

DELETE FROM archive;
select * from archive;
CREATE TABLE IF NOT EXISTS archive (
	booking_id int,
	period_of_time int,
	customer_sin VARCHAR(11),
	employee_id int,
	typ VARCHAR(7)

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
SELECT * FROM booking WHERE booking_id = 2810;


DELETE FROM room
	WHERE room.room_id = '999999999';


CREATE VIEW room_capacity_in_ontario AS
SELECT h.hotel_name, SUM(r.capacity) AS total_capacity
FROM hotel h
JOIN room r ON h.hotel_name = r.member_of
WHERE h.address LIKE '%Ontario%'
GROUP BY h.hotel_name;

SELECT * FROM room_capacity_in_ontario;
--------------------------------


CREATE VIEW available_rooms_try AS
SELECT r.capacity, r.room_id
FROM room r
JOIN hotel h ON h.member_of = r.member_of
WHERE h.hotel_name = 'Accor Hotels';


SELECT * from available_rooms_try;

		
-- View 1 [DONE]
CREATE VIEW available_rooms_in_ontario AS
SELECT h.hotel_name, COUNT(r.room_id) AS num_available_rooms
FROM hotel h
JOIN room r ON h.member_of = r.member_of
WHERE r.is_available = 'true' AND h.address LIKE '%Ontario%'
GROUP BY h.hotel_name;

SELECT * FROM available_rooms_in_ontario;


--Filter 
SELECT r.room_capacity, h.area, h.chain_id, h.star_rating, h.num_rooms, r.room_price, r.room_id
FROM room r
INNER JOIN hotel h ON r.hotel_id = h.hotel_id
WHERE r.room_capacity >= 2 
  AND h.area = 'Las Vegas'
  AND h.chain_id = 4 
  AND h.star_rating = 5 
  AND h.num_rooms >= 3000  
  AND r.room_price <= 200.00
  AND r.room_id NOT IN (
    SELECT b.room_id
    FROM booking b
    WHERE (checkin_date, checkout_date) OVERLAPS ('2023-08-10', '2023-08-15') 
  );


		
