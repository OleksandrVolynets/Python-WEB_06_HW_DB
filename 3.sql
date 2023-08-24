-- Знайти середній бал у групах з певного предмета.
SELECT 
	g.group_name
	,avg(grade) AS 'Average_grade_by_group'
FROM grade_book gb 
LEFT JOIN students s ON s.id = gb.student_id_fk 
LEFT JOIN groups g ON g.id = s.group_id_fk 
LEFT JOIN subjects s2 ON s2.id = gb.subject_id_fk 
WHERE s2.name = 'biology'
GROUP BY g.group_name 
ORDER BY Average_grade_by_group DESC;