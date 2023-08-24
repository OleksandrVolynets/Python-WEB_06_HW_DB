-- Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT 
	g.group_name
	,s.name AS 'Student name'
	,max(gb.grade_date) AS 'Date_last_grade'
	,s2.name 
	,(SELECT gb2.grade  FROM grade_book gb2 
				WHERE gb2.student_id_fk = gb.student_id_fk AND gb2.subject_id_fk = gb.subject_id_fk
				AND gb2.grade_date = gb.grade_date) AS 'Last grade'
FROM groups g 
LEFT JOIN students s ON s.group_id_fk = g.id
LEFT JOIN grade_book gb ON gb.student_id_fk = s.id 
INNER JOIN subjects s2 ON s2.id = gb.subject_id_fk AND s2.name = 'medicine'
WHERE g.id = 1
GROUP BY s.name;