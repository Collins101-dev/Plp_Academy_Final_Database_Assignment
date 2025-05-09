# Plp Academy Final Database Assignment

## Project Overview
This project is part of the Plp Academy curriculum and focuses on designing, implementing, and managing a database system. The goal is to apply database concepts and best practices to solve real-world problems.

## Features
- Database schema design
- Data manipulation and querying
- Implementation of relationships and constraints
- Optimization of database performance

## Prerequisites
- Basic understanding of SQL
- Familiarity with database management systems (e.g., MariaDB, MySQL, PostgreSQL)
- Installed database software on your local machine

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/Collins101-dev/Plp_Academy_Final_Database_Assignment.git
    ```
2. Navigate to the project directory:
    ```bash
    cd Plp_Academy_Final_Database_Assignment
    ```

## Usage
1. Run the database server.
2. Execute the provided SQL scripts to interact with the database.
3. Modify or extend the schema as needed for your assignment.

## Testing

This project uses MariaDB as the database management system. Below are the sample tests to verify the functionality of the database:

### 1. Verify Database and Tables
Ensure the database and tables are correctly created:
```sql
SHOW DATABASES;
SHOW TABLES;
```

### 2. Test Data Insertion
Insert sample data into the tables:
```sql
INSERT INTO Courses (CourseName, CourseDescription, Credits)
VALUES ('Introduction to Programming', 'Learn the basics of programming using Python.', 3);
```

### 3. Test Data Retrieval
Retrieve data using `SELECT` queries:
```sql
SELECT * FROM Students;
```

### 4. Verify Constraints
Test the following constraints:
- **NOT NULL**: Attempt to insert `NULL` into a column with a `NOT NULL` constraint.
```sql
INSERT INTO Students (FirstName, LastName, DateOfBirth) VALUES ('Alice', 'Johnson', '1999-08-23');
```

- **UNIQUE**: Try inserting duplicate values into a column with a `UNIQUE` constraint.
```sql
INSERT INTO Students (FirstName, LastName, DateOfBirth, Email) 
VALUES ('Bob', 'Williams', '2001-01-01', 'john.doe@example.com');
```

- **FOREIGN KEY**: Test referential integrity by inserting or deleting related records.
```sql
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade)
VALUES (999, 1, '2025-09-01', 'A');
```

### 5. Test Relationships
Use `JOIN` to find all courses a student is enrolled in:
```sql
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE s.StudentID = 1;
```

These tests ensure the database is functioning as expected and adheres to the defined schema and constraints.



## Contributing
Contributions are welcome! Please fork the repository and submit a pull request.

