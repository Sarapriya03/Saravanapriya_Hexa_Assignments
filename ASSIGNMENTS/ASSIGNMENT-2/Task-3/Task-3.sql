SELECT 
    s.first_name, 
    s.last_name, 
    SUM(p.amount) AS total_payments  
FROM Students s  
JOIN Payments p ON s.student_id = p.student_id  
WHERE s.student_id = 4  
GROUP BY s.first_name, s.last_name;

SELECT 
    c.course_id,  
    c.course_name,  
    COUNT(e.student_id) AS student_count  
FROM Courses c  
LEFT JOIN Enrollments e ON c.course_id = e.course_id  
GROUP BY c.course_id, c.course_name  
ORDER BY student_count DESC;

SELECT
	s.first_name, s.last_name as student_name,
	e.course_id
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id IS NULL

SELECT 
    s.first_name,
    s.last_name,
    c.course_name
FROM Students s  
JOIN Enrollments e ON s.student_id = e.student_id  
JOIN Courses c ON e.course_id = c.course_id  
ORDER BY s.last_name, s.first_name;

SELECT 
    t.first_name,
    t.last_name,
    c.course_name
FROM Teacher t  
JOIN Courses c ON t.teacher_id = c.teacher_id  
ORDER BY t.last_name, t.first_name;

SELECT 
    s.first_name,
    s.last_name,
    e.enrollment_date,
    c.course_name
FROM Students s  
JOIN Enrollments e ON s.student_id = e.student_id  
JOIN Courses c ON e.course_id = c.course_id  
WHERE c.course_name = 'Mathematics'  
ORDER BY e.enrollment_date;

SELECT 
    s.first_name,
    s.last_name
FROM Students s  
LEFT JOIN Payments p ON s.student_id = p.student_id  
WHERE p.payment_id IS NULL  
ORDER BY s.last_name, s.first_name;

SELECT
	c.course_id,
	c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.Course_id
WHERE e.enrollment_id IS NULL
ORDER BY c.course_name;

SELECT
	t.first_name,
	t.last_name,
	c.course_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id is NULL