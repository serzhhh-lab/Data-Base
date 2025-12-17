--функциональные зависимости: book_id - title, author_name, publisher_id, publisher_name, publisher_city; publisher_id - publisher_name, publisher_city
--косвенная зависимость book_id - publisher_id - publisher_city. publisher_name и publisher_city зависят не напрямую от первичного ключа, а через publisher_id
CREATE TABLE publishers (
    publisher_id int PRIMARY KEY,
    publisher_name VARCHAR(255),
    peblisher_city VARCHAR(100)
);

CREATE Table books (
    book_id int PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id int,
    Foreign Key (publisher_id) REFERENCES publishers(publisher_id)
);
--функциональные зависимости: (race_id, driver_id) - car_model, finish_time; car_model - car_manufacturer; (race_id, driver_id) - car_manufacturer
--косвенная зависимость (race_id, driver_id) - car_model - car_manufacturer. car_manufacturer зависит не напрямую от первичного ключа, а через car_model
CREATE TABLE Cars (
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100)
);
CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    finish_time TIME,
    car_model VARCHAR(100),
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model) REFERENCES Cars(car_model)
);

--Зависимость event_type - room_name нарушает НФБК, потому что: 1) event_type не является суперключом 2) room_name является частью потенциального ключа 3) в НФБК запрещены зависимости, где левая часть не является суперключом
CREATE TABLE EventTypes (
    event_type VARCHAR(50) PRIMARY KEY,
    room_name VARCHAR(150)
);
CREATE TABLE Events (
    event_name VARCHAR(255) PRIMARY KEY,
    event_type VARCHAR(50),
    FOREIGN KEY (event_type) REFERENCES EventTypes(event_type)
);
CREATE TABLE RoomBookings (
    booking_time DATETIME,
    event_name VARCHAR(255),
    PRIMARY KEY (booking_time, event_name)
);