INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

SELECT * FROM Students

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)  
VALUES (11, 1, 5, '2024-03-19');
SELECT * FROM Enrollments

UPDATE Teacher SET email = 'joseph.hall_updated@example.com' where teacher_id = 9 and email = 'joseph_hall@example.com'
SELECT * FROM Teacher

DELETE FROM Enrollments WHERE student_id = 1 and course_id = 5
SELECT * FROM Enrollments

UPDATE Courses SET teacher_id = 7 WHERE course_id = 3
SELECT * FROM Courses

DELETE FROM Enrollments WHERE student_id = 10
DELETE FROM Students WHERE student_id = 10

SELECT * FROM Enrollments
SELECT * FROM Students

SELECT * FROM Payments
UPDATE Payments SET amount = 550 WHERE student_id = 1