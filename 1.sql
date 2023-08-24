SELECT
	s.Name AS 'Student name'
	,AVG(grade) AS 'average_grade' 
FROM grade_book AS gb  	
LEFT JOIN students s ON s.id = gb.student_id_fk 
GROUP BY student_id_fk
ORDER BY average_grade DESC
LIMIT 5;
