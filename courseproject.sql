set search_path="courseprojectv3";


CREATE TABLE hotel_chain (
    chain_id SERIAL PRIMARY KEY,
    chain_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    num_hotels INTEGER NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(255) NOT NULL
);

-- DELETE FROM hotel;
-- DROP TABLE hotel;
CREATE TABLE hotel (
    hotel_id INT PRIMARY KEY,
    area VARCHAR(255) NOT NULL,
    chain_id INTEGER NOT NULL,
    hotel_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(255) NOT NULL,
    num_rooms INTEGER NOT NULL,
    star_rating INTEGER NOT NULL,
    FOREIGN KEY (chain_id) REFERENCES hotel_chain(chain_id) ON DELETE CASCADE
);

-- DELETE FROM ROOM;
-- DROP TABLE room;
CREATE TABLE room (
    room_id SERIAL PRIMARY KEY,
    hotel_id INTEGER NOT NULL,
    room_capacity INTEGER NOT NULL,
    room_price NUMERIC(8,2) NOT NULL,
    has_view VARCHAR(5) NOT NULL,
    has_amenities VARCHAR(5),
    is_expendible VARCHAR(5) NOT NULL,
    is_available VARCHAR(5) NOT NULL DEFAULT 'true',
    has_problem VARCHAR(5),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);

-- DROP TABLE customer;
CREATE TABLE IF NOT EXISTS customer (
    ssn_sin VARCHAR(20) PRIMARY KEY NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    registration_date VARCHAR(255) NOT NULL
);

-- drop table employee;
CREATE TABLE CREATE TABLE IF NOT EXISTS employee (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    ssn_sin VARCHAR(20) NOT NULL,
    role_position VARCHAR(255),
    hotel_id INTEGER NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);
-- DROP TABLE booking;
DELETE FROM booking;
CREATE TABLE IF NOT EXISTS booking (
    booking_id SERIAL PRIMARY KEY,
    customer_sin VARCHAR(20) NOT NULL,
    hotel_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    booking_date VARCHAR(255) NOT NULL,
    checkin_date VARCHAR(255) NOT NULL,
    checkout_date VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_sin) REFERENCES customer(ssn_sin) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES room(room_id) ON DELETE CASCADE,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);
DROP TABLE renting;
CREATE TABLE IF NOT EXISTS renting (
    renting_id SERIAL PRIMARY KEY,
    customer_sin VARCHAR(20) NOT NULL,
    hotel_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    renting_date VARCHAR(255) NOT NULL,
    checkin_date VARCHAR(255) NOT NULL,
    checkout_date VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_sin) REFERENCES customer(SSN_SIN) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES room(room_id) ON DELETE CASCADE,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE
);
-------------------------------------------------------------------

-- DROP TABLE archived_booking;
-- DELETE FROM archived_booking;
CREATE TABLE IF NOT EXISTS archived_booking (
    archived_booking_id SERIAL PRIMARY KEY,
    room_id INTEGER NOT NULL,
    hotel_id INTEGER NOT NULL,
    room_capacity INTEGER NOT NULL,
    room_price NUMERIC(8,2) NOT NULL,
	customer_sin VARCHAR(20) NOT NULL,
    booking_date VARCHAR(255) NOT NULL,
    checkin_date VARCHAR(255) NOT NULL,
    checkout_date VARCHAR(255) NOT NULL
);
-- DROP TABLE archived_renting;
CREATE TABLE IF NOT EXISTS archived_renting (
    archived_renting_id SERIAL PRIMARY KEY,
    room_id INTEGER NOT NULL,
    hotel_id INTEGER NOT NULL,
    room_capacity INTEGER NOT NULL,
    room_price NUMERIC(8,2) NOT NULL,
	customer_sin VARCHAR(20) NOT NULL,
    booking_date VARCHAR(255) NOT NULL,
    checkin_date VARCHAR(255) NOT NULL,
    checkout_date VARCHAR(255) NOT NULL
);

select * from hotel_chain;
select * from hotel;
select * from room;
select * from employee;
select * from customer;
select * from booking;
select * from renting;
select * from customer;
select * from archived_booking;
select * from archived_renting;
------------------------------------------------------------------------------------------------------------
INSERT INTO hotel_chain (chain_id, chain_name, address, num_hotels, contact_email, contact_phone)
VALUES 
  (1, 'Marriott International', '10400 Fernwood Road Bethesda, MD 20817', 20, 'marriott@marriott.com', '+1-301-380-3000'),
  (2, 'Hilton Worldwide', '7930 Jones Branch Drive McLean, VA 22102', 15, 'hilton@hilton.com', '+1-703-883-1000'),
  (3, 'InterContinental Hotels Group', '3 Ravinia Drive Atlanta, Georgia 30346-2149', 18, 'ihg@ihg.com', '+1-770-604-2000'),
  (4, 'Accor', '110 Avenue de France, 75013 Paris, France', 22, 'accor@accor.com', '+33 1 45 38 86 00'),
  (5, 'Hyatt Hotels Corporation', '150 North Riverside Plaza Chicago, IL 60606', 14, 'hyatt@hyatt.com', '+1-312-750-1234');

-- Insert data for Hotel Chain 1's hotels
INSERT INTO hotel (hotel_id, area, chain_id, hotel_name, address, contact_email, contact_phone, num_rooms, star_rating)
VALUES
    (1, 'New York', 1, 'Marriott Marquis', '1535 Broadway', 'marriott@marquis.com', '555-1234', 2000, 5),
    (2, 'Los Angeles', 2, 'Hilton Los Angeles', '555 Universal Hollywood Drive', 'hilton@losangeles.com', '555-5678', 1500, 4),
    (3, 'San Francisco', 3, 'Fairmont San Francisco', '950 Mason St', 'fairmont@sanfrancisco.com', '555-9101', 1000, 4),
    (4, 'Las Vegas', 4, 'Bellagio Las Vegas', '3600 S Las Vegas Blvd', 'bellagio@lasvegas.com', '555-1212', 3000, 5),
    (5, 'Chicago', 1, 'JW Marriott Chicago', '151 W Adams St', 'jwmarriott@chicago.com', '555-9999', 1000, 4)
	
-- Insert data for Hotel Chain 1's rooms
INSERT INTO room (hotel_id, room_capacity, room_price, has_view, has_amenities, is_expendible, is_available, has_problem)
VALUES 
    (1, 2, 100.00, 'YES', 'NO', 'YES', 'NO'),
    (1, 2, 120.00, 'YES', 'YES', 'YES', 'NO'),
    (1, 3, 180.00, 'NO', 'YES', 'YES', 'NO'),
    (2, 2, 90.00, 'YES', 'NO', 'YES', 'NO'),
    (2, 2, 110.00, 'YES', 'YES', 'YES', 'NO'),
    (2, 3, 170.00, 'NO', 'YES', 'YES', 'YES'),
    (3, 2, 95.00, 'YES', 'NO', 'YES', 'NO'),
    (3, 2, 115.00, 'YES', 'YES', 'YES', 'NO'),
    (3, 3, 175.00, 'NO', 'YES', 'YES', 'NO'),
    (4, 2, 105.00, 'YES', 'NO', 'YES', 'YES'),
    (4, 2, 125.00, 'YES', 'YES', 'YES', 'YES'),
    (4, 3, 185.00, 'NO', 'YES', 'YES', 'YES'),
    (5, 2, 100.00, 'YES', 'NO', 'YES', 'NO'),
    (5, 2, 120.00, 'YES', 'YES', 'YES', 'NO'),
    (5, 3, 180.00, 'NO', 'YES', 'YES', 'YES');
	
	INSERT INTO room (hotel_id, room_capacity, room_price, has_view, has_amenities, is_expendible, is_available, has_problem)
	VALUES (1, 4, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(1, 3, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(2, 3, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(3, 1, 180.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(4, 2, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(5, 4, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(5, 5, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(4, 2, 110.00, 'NO', 'YES', 'YES', 'true', 'NO'),
	(3, 1, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(2, 6, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(1, 5, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(2, 1, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(3, 2, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(4, 2, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(5, 3, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(1, 4, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(2, 4, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(3, 3, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(4, 2, 110.00, 'YES', 'NO', 'YES', 'true', 'NO')
	
		INSERT INTO room (hotel_id, room_capacity, room_price, has_view, has_amenities, is_expendible, is_available, has_problem)
	VALUES (1, 4, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(1, 3, 1150.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(2, 3, 1610.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(3, 1, 6180.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(4, 2, 1510.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(5, 4, 15610.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(5, 5, 1610.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(4, 2, 15.00, 'NO', 'YES', 'YES', 'true', 'NO'),
	(3, 1, 113.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(2, 6, 150.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(1, 5, 1130.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(2, 1, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(3, 2, 1120.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(4, 2, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(5, 3, 1160.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(1, 4, 1110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(2, 4, 11250.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(3, 3, 110.00, 'YES', 'NO', 'YES', 'true', 'NO'),
	(4, 2, 1130.00, 'YES', 'NO', 'YES', 'true', 'NO')
    
INSERT INTO employee (employee_id, full_name, address, ssn_sin, role_position, hotel_id)
VALUES (1, 'John Smith', '123 Main St, Anytown USA', '123-45-6789', 'Front Desk Agent', 1),
       (2, 'Jane Doe', '456 Maple St, Anytown USA', '987-65-4321', 'Housekeeper', 2),
       (3, 'Bob Johnson', '789 Oak St, Anytown USA', '456-78-9012', 'General Manager', 1);


-- View 1
CREATE VIEW available_rooms_per_area AS
SELECT hotel.area, COUNT(*) AS num_available_rooms
FROM hotel
JOIN room ON hotel.hotel_id = room.hotel_id
WHERE room.is_available = 'true'
GROUP BY hotel.area;

select * from available_rooms_per_area;
-- View 2
CREATE VIEW room_capacity_by_hotel AS
SELECT hotel.hotel_name, SUM(room.room_capacity) AS total_capacity
FROM hotel
JOIN room ON hotel.hotel_id = room.hotel_id
GROUP BY hotel.hotel_name;

select * from room_capacity_by_hotel;

-- Query 1
SELECT r.room_id, r.room_capacity, r.room_price 
FROM room r, hotel h
WHERE r.hotel_id = h.hotel_id
    AND r.is_available = 'true';

-- Query 2
UPDATE room 
SET room_price = 2000
WHERE hotel_id = 2
AND room_capacity >= 2;

-- Query 3
DELETE FROM booking 
WHERE customer_id = <customer_id>;

-- Query 4
INSERT INTO hotel_chain (chain_id, chain_name, address, num_hotels, contact_email, contact_phone)
VALUES (6, 'New Hotel Chain', '10400 Fernwood Road Bethesda, MD 20817', 30, 'newhotel@gmail.com', '613-111-1111');

-- Trigger 1: Update the number of available rooms when a new booking is made:
CREATE FUNCTION update_room_availability() RETURNS TRIGGER AS
$BODY$
BEGIN
    UPDATE room 
    SET is_available = 'false' 
    WHERE room_id = NEW.room_id;
    
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER after_booking_insert 
    AFTER INSERT ON booking 
        FOR EACH ROW
            EXECUTE FUNCTION update_room_availability();
			
DROP TRIGGER after_booking_insert ON booking;
-- Trigger 2: Updates the number of available rooms when a new booking is made
CREATE FUNCTION update_available_rooms() RETURNS TRIGGER AS
$BODY$
BEGIN
        UPDATE hotel
    SET num_available_rooms = num_available_rooms - 1
    WHERE hotel_id = (SELECT hotel_id FROM room WHERE room_id = NEW.room_id);
    
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER update_num_available_rooms
    AFTER INSERT ON booking
        FOR EACH ROW
            EXECUTE FUNCTION update_available_rooms();

DROP TRIGGER update_num_available_rooms ON booking;
-- filter option in the UI
SELECT room.room_id, room.room_capacity, room.room_price, hotel.hotel_name, hotel.area, hotel_chain.chain_name
FROM room
JOIN hotel ON room.hotel_id = hotel.hotel_id
JOIN hotel_chain ON hotel.chain_id = hotel_chain.chain_id
WHERE room.is_available = 'true'
AND (room.room_capacity >= 2)
AND (hotel.area = 'New York')
AND (hotel_chain.chain_name = 'Marriott International')
-- AND (hotel.num_rooms >= <num_rooms> OR <num_rooms> IS NULL)
-- AND (room.room_price <= <room_price> OR <room_price> IS NULL)
-- AND room.room_id NOT IN (
--     SELECT booking.room_id
--     FROM booking
--     WHERE booking.checkin_date <= '<end_date>' AND booking.checkout_date >= '<start_date>'
-- )
-- select * from room
--     where room.is_available = 'false';

