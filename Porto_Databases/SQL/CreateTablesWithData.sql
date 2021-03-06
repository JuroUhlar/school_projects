USE hotels

-- HOTELS
CREATE TABLE hotels (
    hotel_id int NOT NULL PRIMARY KEY,
    name varchar(50),
    region varchar(50),
    category int CHECK (category >= 1 AND category <= 5),
);

INSERT INTO hotels(hotel_id,name,region,category) VALUES
(1,'Carlton','Nevada',4),
(2,'Nova','France',5),
(3,'Bruga','Belgium',3);

-- EQUIPMENT
CREATE TABLE Equipment (
	type varchar(50),
	hotel_id int FOREIGN KEY REFERENCES Hotels(hotel_id)
);

INSERT INTO Equipment(type, hotel_id)
values
('Pool', 1),
('Pool', 2),
('Gym', 3),
('Tennis', 2);

-- TYPES
CREATE TABLE Types (
    type_id int NOT NULL PRIMARY KEY,
    name varchar(50) NOT NULL,
    spring_price int NOT NULL,
	summer_price int NOT NULL,
	fall_price int NOT NULL,
	winter_price int NOT NULL
);

INSERT INTO Types(type_id,name,spring_price,summer_price,fall_price, winter_price)
values
(1,'single',50,60,50,40),
(2,'double',100,120,100,80),
(3,'apartment',200,240,200,160);


-- FACILITIES
CREATE TABLE Facilities(
	name varchar(100) NOT NULL,
	type_id int FOREIGN KEY REFERENCES Types(type_id)
);

INSERT INTO Facilities(name, type_id)
values
('Internet', 1),
('Internet', 2),
('Internet', 3),
('TV', 2),
('TV', 3),
('Fridge',3);

-- CUSTOMERS
CREATE TABLE Customers(
	customer_id int NOT NULL PRIMARY KEY,
	name varchar(50) NOT NULL,
)

INSERT INTO Customers(customer_id, name) VALUES
(1, 'Thomas Shelby'),
(2, 'Naomi Nagata'),
(3, 'Amos Burton'),
(4, 'Alex Blumberg'),
(5, 'Josh Lyman'),
(6, 'Richard Schiff'),
(7, 'Leo McGarry');

-- ORDERS
CREATE TABLE Orders(
	order_id int NOT NULL PRIMARY KEY,
	customer_id int NOT NULL FOREIGN KEY REFERENCES Customers(customer_id),
	start_date date NOT NULL,
	end_date date NOT NULL,
	state varchar(50) NOT NULL CHECK (state in ('requested', 'reserved', 'confirmed', 'cancelled', 'occupied', 'invoiced', 'recieved')),
	CHECK (end_date > start_date)
)

INSERT INTO Orders(order_id, customer_id, start_date, end_date, state) VALUES 
(1, 1, '2019-11-11', '2019-11-13', 'recieved'),
(2, 3, '2019-12-2', '2019-12-3', 'recieved'),
(3, 5, '2019-10-2', '2019-10-3', 'recieved'),
(4, 7, '2019-11-2', '2019-11-3', 'recieved'),
(5, 1, '2019-11-11', '2019-11-13', 'recieved');

-- ACCOMMODATIONS
CREATE TABLE Accommodations(
	accommodation_id int NOT NULL PRIMARY KEY,
	hotel_id int NOT NULL FOREIGN KEY REFERENCES Hotels(hotel_id),
	type_id int NOT NULL FOREIGN KEY REFERENCES Types(type_id),
	capacity int NOT NULL CHECK (capacity >= 1)
)

INSERT INTO Accommodations(accommodation_id, hotel_id, type_id, capacity) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 2, 2),
(4, 1, 2, 2),
(5, 1, 3, 4),
(6, 2, 1, 1),
(7, 2, 1, 1),
(8, 2, 2, 2),
(9, 2, 2, 2),
(10, 2, 3, 4),
(11, 3, 1, 1),
(12, 3, 1, 1),
(13, 3, 2, 2),
(14, 3, 2, 2),
(15, 3, 3, 4);

--ORDER_ACCOMMODATION
CREATE TABLE Order_Accommodation(
	order_accommodation_id int NOT NULL PRIMARY KEY,
	order_ID int NOT NULL FOREIGN KEY REFERENCES Orders(order_id),
	accommodation_id int NOT NULL FOREIGN KEY REFERENCES Accommodations(accommodation_id),
	guest_count int NOT NULL)

 INSERT INTO Order_Accommodation(order_accommodation_id,order_id,accommodation_id,guest_count) VALUES
 (1,1,1,1),
 (2,2,4,2),
 (3,3,5,3),
 (4,4,6,1),
 (5,5,2,1);

 --DAILY_CONSUMPTION
CREATE TABLE Daily_consumption(
	order_accommodation_id int NOT NULL FOREIGN KEY REFERENCES Order_Accommodation(order_accommodation_id),
	consumtion_date date,
	snacks_consumed int CHECK (snacks_consumed >= 0),
	drinks_consumed int CHECK (drinks_consumed >= 0),
	tv_consumed int CHECK (tv_consumed >= 0))

 INSERT INTO Daily_consumption(order_accommodation_id, consumtion_date, snacks_consumed, drinks_consumed, tv_consumed) VALUES
 (1, '2019-11-11', 0, 2, 3),
 (1, '2019-11-12', 5, 5, 5),
 (2, '2019-12-2', 1, 22, 0),
 (3, '2019-10-2', 3, 5, 8),
 (4, '2019-9-2', 13, 9, 3),
 (5, '2019-11-11', 1, 9, 13);