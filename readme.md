# Movie Ticket Booking System Database

This project defines the database schema for a **Movie Ticket Booking System**. The schema is designed to support booking tickets for different shows across various theatres and screens. It adheres to standard normalization principles (1NF, 2NF, 3NF, and BCNF) to ensure data consistency and integrity.

## Database Structure

The schema includes the following key entities:

### 1. Movie
Represents the movies available in the system.

- **Attributes**:
  - `MovieID` (Primary Key)
  - `MovieName`
  - `Duration` (in minutes)
  - `Genre`
  - `Language`
  - `Rating` (out of 10)

### 2. Theatre
Represents the theatres where the movies are screened.

- **Attributes**:
  - `TheatreID` (Primary Key)
  - `TheatreName`
  - `Location` (Address)

### 3. Screen
Represents individual screens within a theatre.

- **Attributes**:
  - `ScreenID` (Primary Key)
  - `TheatreID` (Foreign Key to `Theatre`)
  - `ScreenName`

### 4. Shows
Represents the movie shows available on specific screens at certain times.

- **Attributes**:
  - `ShowID` (Primary Key)
  - `MovieID` (Foreign Key to `Movie`)
  - `ScreenID` (Foreign Key to `Screen`)
  - `ShowDate`
  - `StartTime`
  - `EndTime`

### 5. Ticket
Represents individual tickets for a show.

- **Attributes**:
  - `TicketID` (Primary Key)
  - `ShowID` (Foreign Key to `Shows`)
  - `SeatNumber`
  - `Price`

## SQL Schema

The SQL schema is written to fit into a relational database and follows normalization rules. You can find the SQL table creation and sample queries in the files listed below.

### Table Creation

- **Movie Table**:
  ```sql
  CREATE TABLE movie (
      MovieID INT PRIMARY KEY,
      MovieName VARCHAR(255) NOT NULL,
      Duration INT NOT NULL,
      Genre VARCHAR(100),
      Language VARCHAR(100),
      Rating DECIMAL(3, 1)
  );
