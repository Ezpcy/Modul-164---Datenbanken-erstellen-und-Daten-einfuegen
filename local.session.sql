/* Übung INSERT INTO */



--@block
use learn;

--@block
create table `schuhe`(
    `id` int not null AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(45) not null,
    `groesse` varchar(4),
    `preis` float not null,
    `farbe` varchar(45)
);

--@block
insert into schuhe (name, groesse, preis, farbe) values
    ('Boots', '42.5', 99.99, 'rot'),
    ('Outdoor King', 'XL', 49.00, NULL),
    ('Outdoor Boss', NULL, 49.40, 'grün'),
    ('Hunter 3', NULL, 99.50, NULL);

--@block
select * from schuhe;