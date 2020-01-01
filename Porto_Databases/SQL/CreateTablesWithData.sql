
-- HOTELS
CREATE TABLE Hotels (
    id int NOT NULL PRIMARY KEY,
    name varchar(50),
    region varchar(50),
    category int CHECK (category >= 1 AND category <= 5),
);

INSERT INTO hotels(id,name,region,category) VALUES
(1,'Carlton','Nevada',4),
(2,'Nova','France',5),
(3,'Bruga','Belgium',3);

-- EQUIPMENT
CREATE TABLE Equipment (
	type varchar(50),
	hotelID int FOREIGN KEY REFERENCES Hotels(id)
);

INSERT INTO Equipment(type, hotelID)
values
('Pool', 1),
('Pool', 2),
('Gym', 3),
('Tennis', 2);

-- TYPES
CREATE TABLE Types (
    id int NOT NULL PRIMARY KEY,
    name varchar(50) NOT NULL,
    spring_price int NOT NULL,
	summer_price int NOT NULL,
	fall_price int NOT NULL,
	winter_price int NOT NULL
);

INSERT INTO Types(id,name,spring_price,summer_price,fall_price, winter_price)
values
(1,'single',50,60,50,40),
(2,'double',100,120,100,80),
(3,'apartment',200,240,200,160);


-- FACILITIES
CREATE TABLE Facilities(
	name varchar(100) NOT NULL,
	typeID int FOREIGN KEY REFERENCES Types(id)
);

INSERT INTO Facilities(name, typeID)
values
('Internet', 1),
('Internet', 2),
('Internet', 3),
('TV', 2),
('TV', 3),
('Fridge',3);

-- CUSTOMERS
CREATE TABLE Customers(
	id int NOT NULL PRIMARY KEY,
	name varchar(50) NOT NULL,
)

INSERT INTO Customers(id, name) VALUES
(1, 'Thomas Shelby'),
(2, 'Naomi Nagata'),
(3, 'Amos Burton'),
(4, 'Alex Blumberg'),
(5, 'Josh Lyman'),
(6, 'Richard Schiff'),
(7, 'Leo McGarry');

-- ORDERS
CREATE TABLE Orders(
	id int NOT NULL PRIMARY KEY,
	customerID int NOT NULL FOREIGN KEY REFERENCES Customers(id),
	start_date date NOT NULL,
	end_date date NOT NULL,
	state varchar(50) NOT NULL CHECK (state in ('requested', 'reserved', 'confirmed', 'cancelled', 'occupied', 'invoiced', 'recieved')),
	CHECK (end_date > start_date)
)

INSERT INTO Orders(id, customerID, start_date, end_date, state) VALUES 
(1, 1, '2019-11-11', '2019-11-13', 'recieved'),
(2, 3, '2019-12-2', '2019-12-3', 'recieved');

-- ACCOMMODATIONS
CREATE TABLE Accommodations(
	id int NOT NULL PRIMARY KEY,
	hotelID int NOT NULL FOREIGN KEY REFERENCES Hotels(id),
	typeID int NOT NULL FOREIGN KEY REFERENCES Types(id),
	capacity int NOT NULL CHECK (capacity >= 1)
)

INSERT INTO Accommodations(id, hotelID, typeID, capacity) VALUES
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