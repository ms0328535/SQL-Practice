-- CREATE DATABASE AS SRM_ALPHA_300
create table CITIES(
NAME VARCHAR(30);
COUNTRY VARCHAR(20);
POPULATION INTEGER;
AREA INTEGER
);
select * from CITIES;

INSERT INTO cities VALUES ('Tokyo', 'Japan', 45000, 3459);
INSERT INTO cities VALUES ('DELHI', 'INDIA', 56000, 3400);
INSERT INTO cities VALUES ('PARIS', 'FRANCE', 1200, 6700);

-- Selecting data

select * from cities;

select name , country from cities;

select name , name, population , country from cities;

-- exercise 1

select * from movies;

-- math operations

select name , population / area as population_density from cities;

select name , population + area  from  cities;

select name , population - area from cities;

select name , population * area from cities;

select name , population ^ area from cities; -- exponentiation

select name , population |/ area from cities; -- square root

select name , population @ area from cities; -- absolute value

select name , population % area from cities;  -- modulo

--exercise 2

select name , price * units_sold as revenue from phones;

-- string operations and functions

select name || country from cities;

select name || ', ' || country from cities;

select name || ', ' || country as location from cities;


select name , country , concat(name, ' is a city in ', country) as description from cities;

select name , country , length(name) as name_length from cities;

select name , country , lower(name) as lower_name from cities;

select name , country , upper(name) as upper_name from cities;

-- exercise problem--

CREATE TABLE phones (
    name VARCHAR(50),
    manufacturer VARCHAR(50),
    price INT,
    units_sold INT
);

INSERT INTO phones (name, manufacturer, price, units_sold)
VALUES
('N1280', 'Nokia', 199, 1925),
('Iphone 4', 'Apple', 399, 9436),
('Galaxy S', 'Samsung', 299, 2359),
('S5620 Monte', 'Samsung', 250, 2385),
('N8', 'Nokia', 150, 7543),
('Droid', 'Motorola', 150, 8395),
('Wave S8500', 'Samsung', 175, 9259);

SELECT
    name,
    price * units_sold AS revenue
FROM phones;