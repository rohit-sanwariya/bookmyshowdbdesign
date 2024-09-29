CREATE SCHEMA `bookmyshow` ;
use bookmyshow;
CREATE TABLE movie (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(255) NOT NULL,
    Duration INT NOT NULL,
    Genre VARCHAR(100),
    Language VARCHAR(100),
    Rating DECIMAL(3, 1)
);


CREATE TABLE theatre (
    TheatreID INT PRIMARY KEY,
    TheatreName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

CREATE TABLE screen (
    ScreenID INT PRIMARY KEY,
    TheatreID INT NOT NULL,
    ScreenName VARCHAR(255) NOT NULL,
    FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID)
);


CREATE TABLE shows (
    ShowID INT PRIMARY KEY,
    MovieID INT NOT NULL,
    ScreenID INT NOT NULL,
    ShowDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (ScreenID) REFERENCES Screen(ScreenID)
);

CREATE TABLE ticket (
    TicketID INT PRIMARY KEY,
    ShowID INT NOT NULL,
    SeatNumber VARCHAR(10) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ShowID) REFERENCES shows(ShowID)
);

INSERT INTO movie (MovieID, MovieName, Duration, Genre, Language, Rating)
VALUES (1, 'Inception', 148, 'Sci-Fi', 'English', 8.8);

INSERT INTO movie (MovieID, MovieName, Duration, Genre, Language, Rating)
VALUES (2, 'Interstellar', 169, 'Sci-Fi', 'English', 8.6);


INSERT INTO Theatre (TheatreID, TheatreName, Location)
VALUES (1, 'PVR Cinemas', 'MG Road, Bengaluru');

INSERT INTO Theatre (TheatreID, TheatreName, Location)
VALUES (2, 'INOX', 'Orion Mall, Bengaluru');

INSERT INTO Screen (ScreenID, TheatreID, ScreenName)
VALUES (1, 1, 'Screen 1');

INSERT INTO Screen (ScreenID, TheatreID, ScreenName)
VALUES (2, 1, 'Screen 2');

INSERT INTO shows (ShowID, MovieID, ScreenID, ShowDate, StartTime, EndTime)
VALUES (1, 1, 1, '2024-09-29', '18:00:00', '20:30:00');

INSERT INTO shows (ShowID, MovieID, ScreenID, ShowDate, StartTime, EndTime)
VALUES (2, 2, 2, '2024-09-29', '21:00:00', '23:49:00');

INSERT INTO ticket (TicketID, ShowID, SeatNumber, Price)
VALUES (1, 1, 'A10', 300.00);

INSERT INTO ticket (TicketID, ShowID, SeatNumber, Price)
VALUES (2, 1, 'A11', 300.00);


SELECT S.ShowID, M.MovieName, S.ShowDate, S.StartTime, S.EndTime, T.TheatreName, SCR.ScreenName
FROM shows S
JOIN movie M ON S.MovieID = M.MovieID
JOIN screen SCR ON S.ScreenID = SCR.ScreenID
JOIN theatre T ON SCR.TheatreID = T.TheatreID
WHERE S.ShowDate = '2024-09-29' AND T.TheatreID = 1;




