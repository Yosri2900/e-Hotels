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

CREATE TABLE IF NOT EXISTS hotel(
	hotel_name VARCHAR(100),
	rating int CHECK (rating > 0 and rating < 6),
	num_of_room int NOT NULL,
	email VARCHAR(40),
	phone_num VARCHAR(14),
	address VARCHAR(100),

	
	PRIMARY KEY (hotel_name)
);

-- need hotels in 14 different locations
INSERT INTO hotel (hotel_name, rating, num_of_room, email, address, phone_num)
	VALUES ('Kimpton Hotels & Restaurants', 4, 199, 'hiltonww@gmail.com', '1052 St George Street. British Columbia. Canada', '1-800-321-7654'),
																								 
	('hilton-worldwide', 5, 100, 'hiltonww@gmail.com', '3065 Duke Street. Quebec. Canada', '1-800-123-4567'),
															 
	('Accord-SA', 4, 120, 'accordsa@gmail.com','1303 James Street. Ontario Canada', '1-800-456-7890')
-- 	(),
-- 	(),
-- 	(),
-- 	(),
-- 	(),
-- 	(),
-- 	(),
-- 	(),
-- 	(),
-- 	(),
-- 	(),
-- 	(),

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

DROP TABLE customer;
CREATE TABLE IF NOT EXISTS customer(
	sin VARCHAR(11),
	booking_date DATE,
	address VARCHAR(100),
	first_name VARCHAR(100) UNIQUE,
	last_name VARCHAR(100),
	
	PRIMARY KEY(sin)
);
-- dates in postgresql are YYYY-MM-DD
INSERT INTO customer(sin, booking_date, address, first_name, last_name)
	VALUES ('111-11-1111', '2023-01-01', '3306 St Marys Rd. Manitoba. Canada', 'Marco', 'Polo')
	

CREATE TABLE IF NOT EXISTS booking (
	booking_id int,
	tdate DATE,
	chain_name VARCHAR(100),
	period_of_time int,
	customer_sin VARCHAR(11),
	employee_id int,
	
	PRIMARY KEY (booking_id),
	FOREIGN KEY (chain_name) REFERENCES hotel_chain(chain_brand),
	FOREIGN KEY (customer_sin) REFERENCES customer(sin),
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
	
);
-- DROP TABLE booking;
INSERT INTO booking (booking_id, tdate, chain_name, period_of_time, customer_sin, employee_id)
	VALUES (123456789, '2023-01-01', 'Hilton Worldwide', 12, '111-11-1111', 4529)


CREATE TABLE IF NOT EXISTS room (
	room_id VARCHAR(100),
	member_of VARCHAR(100),
	is_available BOOLEAN,
	is_expandible BOOLEAN,
	has_view BOOLEAN,
	has_problems BOOLEAN,
	has_amenities BOOLEAN,
	capacity int,
	room_img TEXT[],
	
	PRIMARY KEY (room_id),
	FOREIGN KEY (member_of) REFERENCES hotel_chain(chain_brand)
);
INSERT INTO room(room_id, member_of, is_available, is_expandible, has_view, has_problems, has_amenities, capacity, room_img)
	VALUES ('352001001', 'Hilton Worldwide', TRUE, FALSE, TRUE, FALSE, FALSE, 2, ARRAY['https://media.cntraveler.com/photos/5a29568bb70da5581cb857e4/16:9/w_1280,c_limit/hilton-memphis-cr-courtesy.jpg',
															 'https://i.insider.com/5bd89709beb6701ac738d47f?width=700',
															 'https://imageio.forbes.com/specials-images/imageserve/5d4c280137f1f90008eca9c4/Conrad-Guangzhou/960x0.jpg?height=397&width=711&fit=bounds']),
															 
			('553200001', 'Kimpton Hotels & Restaurants', TRUE, FALSE, FALSE, TRUE, TRUE, 3, ARRAY['https://ihg.scene7.com/is/image/ihg/kimpton-enso-king-corner-teaser-carousel',
																								 'https://www.kimptonsaintgeorge.com/images/1700-960/yyz-gr-003-e5e61330.jpg',
																								 'https://media.cntraveler.com/photos/5b33ec79598c335848c214f4/16:9/w_2560,c_limit/Kimpton-St-George_Naomi-Finlay-for-Kimpton-Hotels-&-Restaurants_2018_yyz_gr_002.jpg']),
																								 
			('663001002', 'Accor S.A.', FALSE, TRUE, TRUE, TRUE, FALSE, 5, ARRAY['https://group.accor.com/-/media/Corporate/News-images/2019/09/18/201910-innovations-smartroom.jpg?version=1',
																											 'https://group.accor.com/-/media/Corporate/News-images/2019/09/18/201910-innovations-swissotelVitalityRoom.jpg?version=1',
																											 'https://qtxasset.com/quartz/qcloud1/media/image/hotelmanagement/1568814373/Accor-Greet-Hotel.jpg?VersionId=cjBbpjZfKiU4VA0oD0MaV8nCZaCZ9ku8'])

CREATE TABLE IF NOT EXISTS renting (
	room_id VARCHAR(100),
	period_of_time int,
	customer_name VARCHAR(100),
	booking_id int,
	chain_name VARCHAR(100),
	
	FOREIGN KEY (room_id) REFERENCES room(room_id),
	FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
);



CREATE TABLE IF NOT EXISTS archive (
	room_id VARCHAR(100),
	period_of_time int,
	customer_name VARCHAR(100),
	booking_id int,
	chain_name VARCHAR(100),
	
	FOREIGN KEY (room_id) REFERENCES room(room_id),
	FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
);