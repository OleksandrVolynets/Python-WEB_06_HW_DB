--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT
	s2.name AS 'Subject'
	,s.Name AS 'Student name'
	,AVG(grade) AS 'average_grade' 
FROM grade_book AS gb  	
LEFT JOIN students s ON s.id = gb.student_id_fk 
INNER JOIN subjects s2 ON gb.subject_id_fk = s2.id AND s2.name LIKE 'biology'

GROUP BY student_id_fk
ORDER BY subject_id_fk, average_grade DESC
LIMIT 1;