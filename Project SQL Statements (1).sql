-- Query 1: Select all columns and all rows from one table 
SELECT * FROM player;

-- Query 2: Select five columns and all rows from one table 
SELECT make, model, year, car_cost, speed
FROM car;

-- Query 3: Select all columns from all rows from one view 
SELECT * FROM races_at_le_mans;

-- Query 4: Using a join on 2 tables, select all columns and all rows from the tables without the use of a Cartesian product 
SELECT * 
FROM races r
JOIN tracks t ON r.trackID = t.trackID;

-- Query 5: Select and order data retrieved from one table 
SELECT * FROM car
ORDER BY (speed) DESC;

-- Query 6: Using a join on 3 tables, select 5 columns from the 3 tables. Use syntax that would limit the output to 3 rows 
SELECT r.race_date, r.winner, t.track_name, t.track_length, l.city
FROM races r
JOIN tracks t ON r.trackID = t.trackID
JOIN locations l ON t.city = l.city
LIMIT 3;

-- Query 7: Select distinct rows using joins on 3 tables 
SELECT DISTINCT r.race_date, r.winner, t.track_name, l.city
FROM races r
JOIN tracks t ON r.trackID = t.trackID
JOIN locations l ON t.city = l.city;

-- Query 8: Use GROUP BY and HAVING in a select statement using one or more tables 
SELECT t.track_name, COUNT(r.raceID) AS total_races
FROM races r
JOIN tracks t ON r.trackID = t.trackID
GROUP BY t.track_name
HAVING COUNT(r.raceID) > 2;

-- Query 9: Use IN clause to select data from one or more tables 
SELECT r.raceID, r.race_date, r.winner, t.track_name
FROM races r
JOIN tracks t ON r.trackID = t.trackID
WHERE r.trackID IN (1, 2, 3);

-- Query 10: Select length of one column from one table (use LENGTH function) 
SELECT username, LENGTH(username) AS username_length
FROM player;

-- Query 11: Delete one record from one table. Use select statements to demonstrate the table contents before and after the DELETE statement. Make sure you use ROLLBACK afterwards so that the data will not be physically removed

-- view table before deletion
SELECT * FROM playerrace;

-- deleting record
BEGIN TRANSACTION; -- Start a transaction
DELETE FROM playerrace
WHERE playerID = 10 and raceID = 1;

-- view after delete
SELECT * FROM playerrace;

-- rolling back deletion
ROLLBACK;

-- Query 12: Update one record from one table. Use select statements to demonstrate the table contents before and after the UPDATE statement. Make sure you use ROLLBACK afterwards so that the data will not be physically removed 

-- check current record
SELECT * FROM playerrace WHERE playerID = 10 AND raceID = 1;

-- updating record
BEGIN TRANSACTION;
UPDATE playerrace
SET points = 5
WHERE playerID = 10 AND raceID = 1;

-- check record after update
SELECT * FROM playerrace WHERE playerID = 10 AND raceID = 1;

-- rollback transaction
ROLLBACK;



-- Query 13: Return all the usernames, make and model of the car such that these players have points greater than 10 and order them by track difficulties
SELECT p.username, c.make, c.model, t.track_difficulty
FROM playerrace pr
JOIN player p ON pr.playerID = p.playerID
JOIN races r ON pr.raceID = r.raceID
JOIN tracks t ON r.trackID = t.trackID
JOIN car c ON pr.carID = c.carID 
WHERE pr.points > 10
ORDER BY t.track_difficulty DESC;




-- Query 14: Identify the top 3 players with the highest total points across all races, displaying their usernames, total points, and the number of races they participated in.
SELECT 
    p.username,
    SUM(pr.points) AS total_points,
    COUNT(pr.raceID) AS total_races
FROM 
    Player p
JOIN 
    PlayerRace pr ON p.playerID = pr.playerID
GROUP BY 
    p.username
ORDER BY 
    total_points DESC
LIMIT 3; 