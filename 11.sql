-- Середній бал, який певний викладач ставить певному студентові.
SELECT
	t.name AS 'Teacher name'
	,s2.name AS 'Student name'
	,AVG(gb.grade) AS 'Average grade' 	
FROM teachers t 
LEFT JOIN subjects s ON s.teacher_id_fk = t.id 
LEFT JOIN grade_book gb ON gb.subject_id_fk = s.id 
INNER JOIN students s2 ON s2.id = gb.student_id_fk AND s2.id = 8
WHERE t.id = 2
GROUP BY t.name, s2.name;