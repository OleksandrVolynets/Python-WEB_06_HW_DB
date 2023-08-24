-- Знайти оцінки студентів в окремій групі з певного предмета.
SELECT 
	g.group_name 
	,s.name AS 'Student name'
	,s2.name AS 'Subject name'
	,gb.grade 
FROM grade_book gb
LEFT JOIN students s ON s.id = gb.student_id_fk 
INNER JOIN groups g ON g.id = s.group_id_fk AND g.id  = 3
INNER JOIN subjects s2 ON s2.id = gb.subject_id_fk AND s2.name = 'astronomy';