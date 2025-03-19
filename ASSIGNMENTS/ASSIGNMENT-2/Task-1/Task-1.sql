CREATE DATABASE SISDB
USE SISDB

CREATE TABLE Students (
    student_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    CONSTRAINT PK_Students PRIMARY KEY (student_id)
);

CREATE TABLE Teacher (
    teacher_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    CONSTRAINT PK_Teacher PRIMARY KEY (teacher_id)
);

CREATE TABLE Courses (
    course_id INT NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    teacher_id INT NOT NULL,
    CONSTRAINT PK_Courses PRIMARY KEY (course_id),
    CONSTRAINT FK_Courses_Teacher FOREIGN KEY (teacher_id) 
    REFERENCES Teacher(teacher_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Enrollments (
    enrollment_id INT NOT NULL,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE DEFAULT GETDATE(),
    CONSTRAINT PK_Enrollments PRIMARY KEY (enrollment_id),
    CONSTRAINT FK_Enrollments_Student FOREIGN KEY (student_id) 
    REFERENCES Students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Enrollments_Course FOREIGN KEY (course_id) 
    REFERENCES Courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Payments (
    payment_id INT NOT NULL,
    student_id INT NOT NULL,
    amount DECIMAL(10, 2) CHECK (amount > 0),
    payment_date DATE DEFAULT GETDATE(),
    CONSTRAINT PK_Payments PRIMARY KEY (payment_id),
    CONSTRAINT FK_Payments_Student FOREIGN KEY (student_id) 
    REFERENCES Students(student_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)  
VALUES 
(1, 'Dan', 'Brown', '2002-05-14', 'dan.brown@example.com', '1234567890'),
(2, 'Jane', 'Smith', '2003-03-22', 'jane.smith@example.com', '1234567891'),
(3, 'Alex', 'Brown', '2001-11-10', 'alex.brown@example.com', '1234567892'),
(4, 'Emily', 'Davis', '2000-07-30', 'emily.davis@example.com', '1234567893'),
(5, 'Michael', 'Johnson', '2002-09-15', 'michael.j@example.com', '1234567894'),
(6, 'Sarah', 'Wilson', '2001-04-20', 'sarah.w@example.com', '1234567895'),
(7, 'David', 'Taylor', '2003-06-05', 'david.t@example.com', '1234567896'),
(8, 'Emma', 'Martinez', '2000-12-11', 'emma.m@example.com', '1234567897'),
(9, 'Daniel', 'Anderson', '2002-08-19', 'daniel.a@example.com', '1234567898'),
(10, 'Sophia', 'Thomas', '2003-10-25', 'sophia.t@example.com', '1234567899');

INSERT INTO Teacher (teacher_id, first_name, last_name, email)  
VALUES 
(1, 'Robert', 'King', 'robert.king@example.com'),
(2, 'Linda', 'Moore', 'linda.moore@example.com'),
(3, 'James', 'White', 'james.white@example.com'),
(4, 'Patricia', 'Lee', 'patricia.lee@example.com'),
(5, 'Charles', 'Harris', 'charles.harris@example.com'),
(6, 'Elizabeth', 'Clark', 'elizabeth.clark@example.com'),
(7, 'William', 'Lewis', 'william.lewis@example.com'),
(8, 'Barbara', 'Walker', 'barbara.walker@example.com'),
(9, 'Joseph', 'Hall', 'joseph.hall@example.com'),
(10, 'Susan', 'Allen', 'susan.allen@example.com');

INSERT INTO Courses (course_id, course_name, credits, teacher_id)  
VALUES 
(1, 'Mathematics', 4, 1),
(2, 'Physics', 3, 2),
(3, 'Chemistry', 4, 3),
(4, 'Biology', 3, 4),
(5, 'Computer Science', 5, 5),
(6, 'History', 3, 6),
(7, 'Geography', 2, 7),
(8, 'Economics', 4, 8),
(9, 'Psychology', 3, 9),
(10, 'Philosophy', 2, 10);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)  
VALUES 
(1, 1, 1, '2024-01-15'),
(2, 2, 2, '2024-01-16'),
(3, 3, 3, '2024-01-17'),
(4, 4, 4, '2024-01-18'),
(5, 5, 5, '2024-01-19'),
(6, 6, 6, '2024-01-20'),
(7, 7, 7, '2024-01-21'),
(8, 8, 8, '2024-01-22'),
(9, 9, 9, '2024-01-23'),
(10, 10, 10, '2024-01-24');

INSERT INTO Payments (payment_id, student_id, amount, payment_date)  
VALUES 
(1, 1, 500.00, '2024-02-01'),
(2, 2, 450.00, '2024-02-02'),
(3, 3, 600.00, '2024-02-03'),
(4, 4, 550.00, '2024-02-04'),
(5, 5, 700.00, '2024-02-05'),
(6, 6, 480.00, '2024-02-06'),
(7, 7, 520.00, '2024-02-07'),
(8, 8, 620.00, '2024-02-08'),
(9, 9, 530.00, '2024-02-09'),
(10, 10, 610.00, '2024-02-10');

SELECT * FROM Students

SELECT * FROM Teacher

SELECT * FROM Courses

SELECT * FROM Enrollments

SELECT * FROM Payments