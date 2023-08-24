-- Знайти, які курси читає певний викладач.
SELECT 
	t.name AS 'Teacher name'
	,s.name	 AS 'Subject name'
FROM teachers t 
LEFT JOIN subjects s ON s.teacher_id_fk = t.id 
WHERE t.id = 2;