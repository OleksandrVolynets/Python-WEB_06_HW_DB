-- Список курсів, які певному студенту читає певний викладач.
SELECT DISTINCT 
	s.name AS 'Student name'
	,s2.name AS 'Subjects'
FROM students s 
LEFT JOIN grade_book gb ON gb.student_id_fk = s.id 
LEFT JOIN subjects s2 ON s2.id  = gb.subject_id_fk 
INNER JOIN teachers t ON t.id = s2.teacher_id_fk AND t.id = 1
WHERE s.id = 48;