set search_path to public ;

DROP VIEW IF EXISTS races_at_le_mans; 

-- Drop Triggers
DROP TRIGGER IF EXISTS trigger_set_player_id ON player;
DROP TRIGGER IF EXISTS trigger_set_raceID ON races;
DROP TRIGGER IF EXISTS trigger_set_trackid ON tracks;
DROP TRIGGER IF EXISTS trigger_set_playerraceid ON playerrace;
DROP TRIGGER IF EXISTS trigger_set_car_id ON car;
 
-- Drop Trigger Functions
DROP FUNCTION IF EXISTS set_player_id();
DROP FUNCTION IF EXISTS set_raceID();
DROP FUNCTION IF EXISTS set_trackid();
DROP FUNCTION IF EXISTS set_playerraceid();
DROP FUNCTION IF EXISTS set_car_id();

DROP SEQUENCE SEQ_PlayerRaceID;
DROP SEQUENCE SEQ_raceID;
DROP SEQUENCE SEQ_trackID;
DROP SEQUENCE SEQ_PlayerID;
DROP SEQUENCE SEQ_carid ;

DROP TABLE playerRace ;
DROP TABLE races ;
DROP TABLE tracks ;
DROP TABLE Locations ;
DROP TABLE CAR ;
DROP TABLE PLAYER ;


CREATE TABLE PLAYER (
  PlayerID INT primary key NOT NULL,
  username VARCHAR (30) NOT NULL,
  password VARCHAR NOT NULL,
  email VARCHAR,
  playerLevel NUMERIC,
  create_date DATE
) ;
 
CREATE TABLE CAR (
carID INT primary key, 
make VARCHAR NOT NULL,
model VARCHAR NOT NULL,
year INT,
car_cost NUMERIC,
speed NUMERIC,
handling NUMERIC,
durability INT
) ;
 
CREATE TABLE locations (
    city VARCHAR(50) PRIMARY KEY NOT NULL,
    state VARCHAR(50) NOT NULL,
    altitude INT,
    climate VARCHAR(50),
    country VARCHAR(50) NOT NULL
) ;
 
CREATE TABLE tracks (
    trackID INT PRIMARY KEY NOT NULL,
    track_name VARCHAR(100) NOT NULL,
    track_length FLOAT,
    track_difficulty INT, -- Assuming difficulty is rated on a scale of 1-10
    track_layout VARCHAR(50),
    city VARCHAR(50) NOT NULL, -- Adding the 'city' column
    CONSTRAINT fk_city FOREIGN KEY (city) REFERENCES locations(city) -- Foreign key constraint
) ;
 
CREATE TABLE races (
    raceID INT PRIMARY KEY NOT NULL,
    trackID INT NOT NULL,
    start_time TIME,
    end_time TIME,
    race_date DATE,
    winner INT NOT NULL-- Assuming winner is a reference to a driver's ID
) ;
 
 
CREATE TABLE PlayerRace (
    playerRaceID INT PRIMARY KEY NOT NULL, -- Unique identifier for each PlayerRace entry
    playerID INT NOT NULL, -- Foreign key to identify the player
    position INT NOT NULL, -- Position achieved in the race
    points INT NOT NULL, -- Points earned in the race
    time FLOAT NOT NULL, -- Time taken in the race in seconds
    raceID INT NOT NULL, -- Foreign key to identify the race
	carID INT NOT NULL, -- Foreign key to identify the car
    CONSTRAINT fk_player FOREIGN KEY (playerID) REFERENCES Player(playerID), -- Assuming Players table exists
    CONSTRAINT fk_race FOREIGN KEY (raceID) REFERENCES races(raceID), -- Assuming Races table exists
	CONSTRAINT fk_car FOREIGN KEY (carID) REFERENCES car(carID)
) ;
 
 
CREATE SEQUENCE SEQ_carID
INCREMENT BY 1
START WITH 1
MAXVALUE 5000
MINVALUE 0
NO CYCLE ;
 
CREATE SEQUENCE SEQ_PlayerID
INCREMENT BY 1
START WITH 1
MAXVALUE 100
MINVALUE 0
NO CYCLE ;
 
CREATE SEQUENCE SEQ_trackID
INCREMENT BY 1
START WITH 1
MAXVALUE 100
MINVALUE 0
NO CYCLE ;
 
CREATE SEQUENCE SEQ_raceID
INCREMENT BY 1
START WITH 1
MAXVALUE 100
MINVALUE 0
NO CYCLE ;
 
CREATE SEQUENCE SEQ_PlayerRaceID
INCREMENT BY 1
START WITH 1
MAXVALUE 100
MINVALUE 0
NO CYCLE ;
 
CREATE OR REPLACE FUNCTION set_player_id()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.PlayerID IS NULL THEN
    NEW.PlayerID := NEXTVAL('SEQ_PlayerID');
  END IF;
  IF NEW.create_date IS NULL THEN
    NEW.create_date := CURRENT_DATE;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trigger_set_player_id
BEFORE INSERT ON PLAYER
FOR EACH ROW
EXECUTE FUNCTION set_player_id();
 
 
CREATE OR REPLACE FUNCTION set_raceID()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.raceID IS NULL THEN
    NEW.raceID := NEXTVAL('SEQ_raceID');
  END IF;
  IF NEW.race_date IS NULL THEN
    NEW.race_date := CURRENT_DATE;
  END IF;
    IF NEW.start_time IS NULL THEN
    NEW.start_time := CURRENT_TIMESTAMP;
  END IF;
 
  IF NEW.end_time IS NULL THEN
    NEW.end_time := NEW.start_time + (floor(50 + (random() * (70 - 50))) || ' minutes')::interval;   
	END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trigger_set_raceID
BEFORE INSERT ON races
FOR EACH ROW
EXECUTE FUNCTION set_raceID();
 
 
CREATE OR REPLACE FUNCTION set_trackid()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.trackID IS NULL THEN
    NEW.trackID := NEXTVAL('SEQ_trackID');
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trigger_set_trackid
BEFORE INSERT ON tracks
FOR EACH ROW
EXECUTE FUNCTION set_trackid();
 
 
CREATE OR REPLACE FUNCTION set_playerraceid()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.playerraceID IS NULL THEN
    NEW.playerraceID := NEXTVAL('SEQ_playerraceid');
  END IF;
  IF NEW.time IS NULL THEN
    NEW.time := 3000 + (random() * (3600 - 3000)) AS random_float;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trigger_set_playerraceid
BEFORE INSERT ON playerrace
FOR EACH ROW
EXECUTE FUNCTION set_playerraceid();


CREATE OR REPLACE FUNCTION set_car_id()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.carID IS NULL THEN
    NEW.carID := nextval('SEQ_carid');
  END IF;
 
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trigger_set_car_id
BEFORE INSERT ON car
FOR EACH ROW
EXECUTE FUNCTION set_car_id();

CREATE VIEW races_at_le_mans AS
SELECT r.race_date, r.start_time, r.end_time, r.winner, t.track_name, t.track_length, t.track_difficulty
FROM races r
JOIN tracks t ON r.trackID = t.trackid -- Assuming `trackID` references `track_name`
JOIN locations l ON t.city = l.city
WHERE l.city = 'Le Mans';