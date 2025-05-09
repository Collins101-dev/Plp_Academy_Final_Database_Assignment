-- Creating the Student Record System Database
CREATE DATABASE IF NOT EXISTS StudentRecordSystem;
USE StudentRecordSystem;

-- Table for storing student information
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,  -- Email must be unique
    PhoneNumber VARCHAR(15) UNIQUE,  -- Phone number is optional but unique
    Address VARCHAR(255)  -- Student's address
);

-- Table for storing course information
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    CourseName VARCHAR(255) NOT NULL,
    CourseDescription TEXT,
    Credits INT NOT NULL CHECK (Credits > 0)  -- Course must have a positive credit value
);

-- Table for storing instructor information
CREATE TABLE Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,  -- Email must be unique
    PhoneNumber VARCHAR(15)
);

-- Table for tracking which instructor teaches which course (1:M relationship)
CREATE TABLE CourseInstructors (
    InstructorID INT,
    CourseID INT,
    PRIMARY KEY (InstructorID, CourseID),  -- Composite Primary Key
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Table for storing enrollment records (M:M relationship)
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Optional: Create a table to store student's address if it's needed separately (1:1 relationship)
CREATE TABLE StudentAddresses (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT UNIQUE,  -- One address per student
    Street VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);

-- Example: Insert sample data
INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, PhoneNumber)
VALUES ('John', 'Doe', '2000-05-15', 'john.doe@example.com', '555-1234');

INSERT INTO Courses (CourseName, CourseDescription, Credits)
VALUES ('Introduction to Programming', 'Learn the basics of programming using Python.', 3);

INSERT INTO Instructors (FirstName, LastName, Email, PhoneNumber)
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '555-5678');

-- Assign instructor to a course
INSERT INTO CourseInstructors (InstructorID, CourseID)
VALUES (1, 1);

-- Enroll a student in a course
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade)
VALUES (1, 1, '2025-09-01', 'A');
