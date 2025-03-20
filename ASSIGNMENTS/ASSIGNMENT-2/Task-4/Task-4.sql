SELECT 
    AVG(student_count) AS average_students_per_course
FROM (
    SELECT 
        course_id,
        COUNT(student_id) AS student_count
    FROM Enrollments
    GROUP BY course_id
) AS course_enrollment_counts;

SELECT 
    s.first_name,
    s.last_name,
    p.amount AS highest_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount) FROM Payments);

SELECT 
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) = (
    SELECT MAX(course_enrollment_count) 
    FROM (
        SELECT COUNT(student_id) AS course_enrollment_count 
        FROM Enrollments 
        GROUP BY course_id
    ) AS enrollment_counts
);

SELECT 
    t.first_name,
    t.last_name,
    SUM(p.amount) AS total_payments
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id
LEFT JOIN Enrollments e ON c.course_id = e.course_id
LEFT JOIN Payments p ON e.student_id = p.student_id
GROUP BY t.first_name, t.last_name;

SELECT 
    s.first_name,
    s.last_name
FROM Students s
WHERE (
    SELECT COUNT(DISTINCT e.course_id)
    FROM Enrollments e
    WHERE e.student_id = s.student_id
) = (
    SELECT COUNT(*) 
    FROM Courses
);

SELECT 
    first_name,
    last_name
FROM Teacher t
WHERE t.teacher_id NOT IN (
    SELECT DISTINCT teacher_id 
    FROM Courses
    WHERE teacher_id IS NOT NULL
);

SELECT 
    AVG(
        (SELECT DATEDIFF(YEAR, s.date_of_birth, GETDATE()))
    ) AS avg_age
FROM Students s;

SELECT course_id, course_name 
FROM Courses c
WHERE course_id NOT IN (
    SELECT DISTINCT course_id 
    FROM Enrollments
);

SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    (
        SELECT SUM(p.amount)
        FROM Payments p
        WHERE p.student_id = s.student_id
    ) AS total_payment
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY s.student_id, c.course_name;

SELECT student_id, first_name, last_name
FROM Students s
WHERE student_id IN (
    SELECT p.student_id
    FROM Payments p
    GROUP BY p.student_id
    HAVING COUNT(p.payment_id) > 1
);

SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    SUM(p.amount) AS total_payments
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

SELECT 
    c.course_name,
    COUNT(e.student_id) AS student_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    AVG(p.amount) AS average_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;


