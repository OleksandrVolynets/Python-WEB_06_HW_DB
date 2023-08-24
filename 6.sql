-- Знайти список студентів у певній групі.
SELECT 
	g.group_name
	,s.name AS 'Student name'
FROM students s 
INNER JOIN groups g ON s.group_id_fk = g.id AND g.id = 2;