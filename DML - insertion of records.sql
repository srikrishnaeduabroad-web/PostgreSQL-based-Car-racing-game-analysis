set search_path to public ;

INSERT INTO player (username, password, email, playerLevel) VALUES
('player1', 'password1', 'player1@example.com', 5),
('player2', 'password2', 'player2@example.com', 3),
('player3', 'password3', 'player3@example.com', 7),
('player4', 'password4', 'player4@example.com', 4),
('player5', 'password5', 'player5@example.com', 6),
('player6', 'password6', 'player6@example.com', 2),
('player7', 'password7', 'player7@example.com', 8),
('player8', 'password8', 'player8@example.com', 1),
('player9', 'password9', 'player9@example.com', 9),
('player10', 'password10', 'player10@example.com', 10),
('player11', 'password11', 'player11@example.com', 4),
('player12', 'password12', 'player12@example.com', 6),
('player13', 'password13', 'player13@example.com', 7),
('player14', 'password14', 'player14@example.com', 3),
('player15', 'password15', 'player15@example.com', 5),
('player16', 'password16', 'player16@example.com', 8),
('player17', 'password17', 'player17@example.com', 2),
('player18', 'password18', 'player18@example.com', 9),
('player19', 'password19', 'player19@example.com', 1),
('player20', 'password20', 'player20@example.com', 10);

INSERT INTO car (make, model, year, car_cost, speed, handling, durability) VALUES
('Toyota', 'Supra', 2020, 50000, 9.2, 8.5, 7.8),
('Honda', 'Civic', 2019, 20000, 7.5, 8.0, 9.0),
('Ford', 'Mustang', 2021, 55000, 9.0, 7.5, 8.0),
('Chevrolet', 'Camaro', 2022, 60000, 8.8, 7.8, 8.2),
('Nissan', 'GT-R', 2020, 90000, 9.8, 8.8, 7.5),
('Tesla', 'Model S', 2021, 80000, 9.5, 8.5, 9.0),
('BMW', 'M3', 2020, 70000, 8.9, 8.2, 8.3),
('Audi', 'R8', 2021, 120000, 9.6, 9.0, 8.5),
('Porsche', '911', 2022, 150000, 9.7, 9.2, 8.9),
('Mazda', 'Miata', 2019, 25000, 7.8, 8.3, 8.7),
('Ferrari', '488 GTB', 2021, 250000, 9.9, 9.2, 8.1),
('Lamborghini', 'Huracan', 2022, 280000, 9.8, 9.0, 8.0),
('McLaren', '720S', 2020, 310000, 9.7, 9.3, 8.5),
('Dodge', 'Charger', 2019, 45000, 8.0, 7.5, 8.0),
('Subaru', 'WRX', 2021, 32000, 8.5, 8.2, 8.9),
('Volkswagen', 'Golf R', 2020, 40000, 8.4, 8.5, 9.0),
('Kia', 'Stinger', 2021, 35000, 8.0, 8.0, 8.5),
('Hyundai', 'Veloster N', 2022, 29000, 7.9, 8.1, 8.7),
('Jaguar', 'F-Type', 2020, 80000, 9.0, 8.7, 8.3),
('Maserati', 'Ghibli', 2021, 85000, 8.8, 8.5, 8.2);

INSERT INTO locations (city, state, altitude, climate, country) VALUES
('Austin', 'Texas', 489, 'Temperate', 'USA'),
('Monaco', 'Monaco', 0, 'Mediterranean', 'Monaco'),
('Tokyo', 'Tokyo', 131, 'Humid', 'Japan'),
('Berlin', 'Berlin', 115, 'Temperate', 'Germany'),
('Sydney', 'New South Wales', 19, 'Warm', 'Australia'),
('Montreal', 'Quebec', 233, 'Cold', 'Canada'),
('Le Mans', 'Pays de la Loire', 65, 'Temperate', 'France'),
('Sao Paulo', 'Sao Paulo', 760, 'Tropical', 'Brazil'),
('Cape Town', 'Western Cape', 15, 'Warm', 'South Africa'),
('Mumbai', 'Maharashtra', 46, 'Humid', 'India'),
('San Francisco', 'California', 52, 'Temperate', 'USA'),
('Las Vegas', 'Nevada', 2000, 'Hot', 'USA'),
('Barcelona', 'Catalonia', 12, 'Mediterranean', 'Spain'),
('Shanghai', 'Shanghai', 4, 'Humid', 'China'),
('Milan', 'Lombardy', 400, 'Temperate', 'Italy'),
('Dubai', 'Dubai', 16, 'Hot', 'UAE'),
('Buenos Aires', 'Buenos Aires', 82, 'Humid', 'Argentina'),
('Mexico City', 'Mexico City', 7350, 'Temperate', 'Mexico'),
('Seoul', 'Seoul', 38, 'Humid', 'South Korea'),
('Athens', 'Attica', 70, 'Mediterranean', 'Greece');


INSERT INTO tracks (track_name, track_length, track_difficulty, track_layout, city) VALUES
('Circuit of the Americas', 5.513, 7, 'Road', 'Austin'),
('Monaco Grand Prix', 3.337, 9, 'Street', 'Monaco'),
('Suzuka International', 5.807, 8, 'Road', 'Tokyo'),
('Nürburgring', 20.832, 10, 'Road', 'Berlin'),
('Mount Panorama', 6.213, 8, 'Road', 'Sydney'),
('Canadian Grand Prix', 4.361, 6, 'Road', 'Montreal'),
('Le Mans', 13.626, 9, 'Road', 'Le Mans'),
('Interlagos', 4.309, 7, 'Road', 'Sao Paulo'),
('Killarney Raceway', 3.267, 5, 'Road', 'Cape Town'),
('Mumbai Street Circuit', 4.345, 8, 'Street', 'Mumbai'),
('Golden Gate Circuit', 4.5, 6, 'Road', 'San Francisco'),
('Vegas Speedway', 5.0, 7, 'Oval', 'Las Vegas'),
('Circuit de Catalunya', 4.7, 8, 'Road', 'Barcelona'),
('Shanghai International', 5.4, 9, 'Road', 'Shanghai'),
('Monza Circuit', 5.8, 8, 'Road', 'Milan'),
('Yas Marina Circuit', 5.5, 9, 'Street', 'Dubai'),
('Autódromo de Buenos Aires', 3.9, 6, 'Road', 'Buenos Aires'),
('Hermanos Rodríguez', 4.6, 8, 'Road', 'Mexico City'),
('Seoul Circuit', 4.3, 7, 'Street', 'Seoul'),
('Athens Raceway', 4.2, 6, 'Road', 'Athens');;

INSERT INTO races (trackID, start_time, end_time, race_date, winner) VALUES
(1, '10:00:00', '12:00:00', '2024-01-15', 1),
(2, '14:00:00', '16:00:00', '2024-01-22', 3),
(3, '12:00:00', '14:30:00', '2024-02-05', 2),
(4, '11:00:00', '13:30:00', '2024-02-12', 5),
(5, '09:00:00', '11:00:00', '2024-03-01', 6),
(6, '13:00:00', '15:00:00', '2024-03-15', 7),
(7, '10:30:00', '12:30:00', '2024-03-28', 8),
(8, '15:00:00', '17:00:00', '2024-04-10', 9),
(9, '08:00:00', '10:00:00', '2024-04-20', 10),
(10, '16:00:00', '18:00:00', '2024-05-05', 11),
(11, '09:00:00', '11:00:00', '2024-06-01', 2),
(12, '14:00:00', '16:00:00', '2024-06-15', 3),
(13, '13:00:00', '15:30:00', '2024-07-10', 4),
(14, '10:30:00', '12:30:00', '2024-07-22', 5),
(15, '16:00:00', '18:30:00', '2024-08-05', 6),
(16, '12:00:00', '14:00:00', '2024-08-15', 7),
(17, '15:30:00', '17:30:00', '2024-09-01', 8),
(18, '11:00:00', '13:30:00', '2024-09-20', 9),
(19, '09:30:00', '11:30:00', '2024-10-10', 10),
(20, '10:00:00', '12:00:00', '2024-10-25', 1),
(1, '09:30:00', '11:30:00', '2024-06-01', 5),  
(1, '15:00:00', '17:00:00', '2024-07-15', 3),  
(2, '10:00:00', '12:00:00', '2024-08-10', 7),  
(2, '14:00:00', '16:30:00', '2024-09-05', 8),  
(3, '11:00:00', '13:30:00', '2024-06-25', 4),  
(4, '09:00:00', '11:00:00', '2024-08-15', 6),  
(4, '13:30:00', '15:30:00', '2024-09-20', 2),  
(5, '08:00:00', '10:00:00', '2024-10-05', 9),  
(5, '10:30:00', '12:30:00', '2024-11-01', 1),  
(6, '16:00:00', '18:00:00', '2024-12-10', 10); 


INSERT INTO playerrace (playerID, position, points, raceid, carid) VALUES
(1, 1, 25, 1, 8),
(2, 2, 18, 1, 5),
(3, 3, 15, 1, 4),
(4, 4, 12, 1, 2),
(5, 5, 10, 1, 9),
(6, 6, 8, 1, 11),
(7, 7, 6, 1, 12),
(8, 8, 4, 1, 16),
(9, 9, 2, 1, 19),
(10, 10, 1, 1, 9),
(1, 1, 25, 2, 9),
(2, 2, 18, 2, 11),
(3, 3, 15, 2, 9),
(4, 4, 12, 2, 11),
(5, 5, 10, 3, 12),
(6, 6, 8, 3, 8),
(7, 7, 6, 3, 6),
(8, 8, 4, 4, 5),
(9, 9, 2, 4, 2),
(10, 10, 1, 4, 14);


select * from player
select * from car
select * from playerrace
select * from races
select * from tracks
select * from locations

