use learn;

--@block
CREATE TABLE Users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);

--@block
INSERT INTO Users(email, bio, country) 
VALUES
('test@mail.com', 'I am a test user', 'DE'),
('tesso@mail.com', 'I am a test user', 'MX'),
('tesew@mail.com', 'bar', 'US');

--@block
SELECT email, id FROM Users

WHERE country = 'US'
/* --% search for emails starting with 't' */
and email LIKE 't%'

ORDER BY id ASC
LIMIT 2;

--@block

/* --Index makes the query faster but slows down the insert */
CREATE INDEX email_index ON Users(email);

/* Relational Data */
--@block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);

--@block
INSERT INTO Rooms(street, owner_id)
VALUES
('Main Street 1', 1),
('Maino Street 1', 1),
('Second Street 2', 1),
('Second Street 2', 1),
('Third Street 3', 2);

--@block
/* SET ROOMS ID TO 0 */
TRUNCATE TABLE Rooms;

--@block
/* INNER means you get all  */
SELECT 
    Users.id AS user_id,
    Rooms.id AS room_id,
    email,
    street
FROM Users
INNER JOIN Rooms
ON Rooms.owner_id = Users.id;

--@block
/* LEFT means you get all info from the left table */
SELECT * FROM Users
LEFT JOIN Rooms
ON Rooms.owner_id = Users.id;

--@block
/* RIGHT means you get all info from the right table */
SELECT * FROM Users
RIGHT JOIN Rooms
ON Rooms.owner_id = Users.id;

--@block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);

--@block
INSERT INTO Bookings(guest_id, room_id, check_in)
VALUES
(1, 1, '2020-01-01'),
(1, 2, '2020-01-01'),
(2, 3, '2020-01-01');


--@block
SELECT 
    guest_id,
    street,
    check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id = guest_id;

--@block
SELECT 
    room_id,
    guest_id,
    email,
    Bio
FROM Bookings
INNER JOIN Users ON Users.id = guest_id;

--@block
SELECT 
    room_id,
    street,
    check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id = guest_id
WHERE guest_id = 1;