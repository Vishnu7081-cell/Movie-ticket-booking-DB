-- Create Roles Table


CREATE TABLE Roles (
    RoleID INT,
    RoleName VARCHAR(50) NOT NULL UNIQUE
);

-- Create Users Table
CREATE TABLE Users (
    UserID INT,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    RoleID INT
);

-- Create EventTypes Table
CREATE TABLE EventTypes (
    EventTypeID INT,
    TypeName VARCHAR(100) UNIQUE NOT NULL
);

-- Create Genres Table
CREATE TABLE Genres (
    GenreID INT,
    GenreName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Movies Table
CREATE TABLE Movies (
    MovieID INT,
    Title VARCHAR(255) NOT NULL,
    GenreID INT,
    Duration INT,
    Language VARCHAR(50),
    ReleaseDate DATE,
    EventTypeID INT
);

-- Create Events Table
CREATE TABLE Events (
    EventID INT,
    MovieID INT,
    EventDate DATE,
    Venue VARCHAR(255),
    Description TEXT
);

-- Create Showtimes Table
CREATE TABLE Showtimes (
    ShowtimeID INT,
    EventID INT,
    Showtime DATETIME
);

-- Create Seats Table
CREATE TABLE Seats (
    SeatID INT,
    ShowtimeID INT,
    SeatNumber VARCHAR(10)
);

-- Create Bookings Table
CREATE TABLE Bookings (
    BookingID INT,
    UserID INT,
    ShowtimeID INT,
    BookingTime DATETIME,
    TotalAmount DECIMAL(10, 2)
);

-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT,
    BookingID INT,
    PaymentTime DATETIME,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50)
);

-- Create Booking_Seats Table
CREATE TABLE Booking_Seats (
    BookingSeatID INT,
    BookingID INT,
    SeatID INT
);

-- Insert sample roles
INSERT INTO Roles VALUES (1, 'Admin'), (2, 'Customer');

-- Insert sample users
INSERT INTO Users (UserID, UserName, Email, Password, RoleID) 
VALUES
    (1, 'John Doe', 'john@example.com', 'pass123', 2),
    (2, 'Jane Smith', 'jane@example.com', 'pass456', 2);

-- Insert sample event types
INSERT INTO EventTypes (EventTypeID, TypeName) 
VALUES 
    (1, 'Movie'), 
    (2, 'Stand-up Comedy'), 
    (3, 'Concert'), 
    (4, 'Theater Play');

-- Insert sample genres
INSERT INTO Genres (GenreID, GenreName) 
VALUES 
    (1, 'Action'), 
    (2, 'Comedy'), 
    (3, 'Drama'), 
    (4, 'Horror');

-- Insert sample movies
INSERT INTO Movies (MovieID, Title, GenreID, Duration, Language, ReleaseDate, EventTypeID) 
VALUES
    (1, 'Avengers: Endgame', 1, 181, 'English', '2019-04-26', 1),
    (2, 'Jumanji: Next Level', 2, 123, 'English', '2019-12-13', 1),
    (3, 'Laugh Riot Night', 2, 90, 'English', '2024-06-01', 2),
    (4, 'Rock Concert Blast', 3, 120, 'English', '2024-07-10', 3),
    (5, 'Shakespeare Reimagined', 3, 130, 'English', '2024-08-05', 4);

-- Insert sample events
INSERT INTO Events (EventID, MovieID, EventDate, Venue, Description) 
VALUES
    (1, 1, '2024-06-01', 'PVR Koramangala', 'Blockbuster Movie Event'),
    (2, 2, '2024-06-05', 'INOX Indiranagar', 'Adventure Comedy Movie'),
    (3, 3, '2024-06-10', 'Rangashankara', 'Stand-up comedy night with local artists'),
    (4, 4, '2024-06-15', 'Chowdiah Memorial Hall', 'Live rock music concert'),
    (5, 5, '2024-06-20', 'Jagriti Theatre', 'A modern take on Shakespeare');

-- Insert sample showtimes
INSERT INTO Showtimes (ShowtimeID, EventID, Showtime) 
VALUES
    (1, 1, '2024-06-01 18:00:00'),
    (2, 1, '2024-06-01 21:00:00'),
    (3, 2, '2024-06-05 19:00:00'),
    (4, 3, '2024-06-10 20:00:00'),
    (5, 4, '2024-06-15 19:30:00'),
    (6, 5, '2024-06-20 18:30:00');

-- Insert sample seats
INSERT INTO Seats (SeatID, ShowtimeID, SeatNumber) 
VALUES
    (1, 1, 'A1'), (2, 1, 'A2'), (3, 1, 'A3'),
    (4, 2, 'B1'), (5, 2, 'B2'), (6, 2, 'B3'),
    (7, 3, 'C1'), (8, 3, 'C2'), (9, 3, 'C3'),
    (10, 4, 'D1'), (11, 4, 'D2'), (12, 4, 'D3'),
    (13, 5, 'E1'), (14, 5, 'E2'), (15, 5, 'E3'),
    (16, 6, 'F1'), (17, 6, 'F2'), (18, 6, 'F3');

-- Insert sample bookings
INSERT INTO Bookings (BookingID, UserID, ShowtimeID, BookingTime, TotalAmount) 
VALUES
    (1, 1, 1, GETDATE(), 300.00),
    (2, 2, 3, GETDATE(), 200.00);

-- Insert sample payments
INSERT INTO Payments (PaymentID, BookingID, PaymentTime, Amount, PaymentMethod) 
VALUES
    (1, 1, GETDATE(), 300.00, 'Credit Card'),
    (2, 2, GETDATE(), 200.00, 'UPI');

-- Insert sample Booking_Seats
INSERT INTO Booking_Seats (BookingSeatID, BookingID, SeatID) 
VALUES
    (1, 1, 1), (2, 1, 2),
    (3, 2, 7), (4, 2, 8);
