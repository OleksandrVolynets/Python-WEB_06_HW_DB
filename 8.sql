-- Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT 
	t.name AS 'Teacher name'
	,s.name AS 'Student name'
	,avg(gb.grade) AS 'Average_grade'
FROM teachers t 
LEFT JOIN subjects s ON s.teacher_id_fk = t.id 
LEFT JOIN grade_book gb ON gb.subject_id_fk = s.id 
WHERE t.id = 2
GROUP BY t.name, s.name;