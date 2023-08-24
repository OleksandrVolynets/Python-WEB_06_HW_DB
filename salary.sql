DROP TABLE IF EXISTS students;
CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT,
                        name varchar(70) NOT NULL,
                        group_id_fk INTEGER,
                        FOREIGN KEY (group_id_fk) REFERENCES groups (id));



DROP TABLE IF EXISTS groups;
CREATE TABLE groups (id INTEGER PRIMARY KEY AUTOINCREMENT,
                        group_name varchar(70) NOT NULL                        
                    );


DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (id INTEGER PRIMARY KEY AUTOINCREMENT,
                        name varchar(70) NOT NULL
                    );


DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (id INTEGER PRIMARY KEY AUTOINCREMENT,
                        name varchar(255) NOT NULL,
                        teacher_id_fk INTEGER,
                        FOREIGN KEY (teacher_id_fk) REFERENCES teachers (id)                   
                        );


DROP TABLE IF EXISTS grade_book;
CREATE TABLE grade_book (student_id_fk INTEGER,
                        subject_id_fk INTEGER,
                        grade INTEGER,
                        grade_date DATE,
                        FOREIGN KEY(student_id_fk) REFERENCES students (id),
                        FOREIGN KEY(subject_id_fk) REFERENCES subjects (id)                  
                        );



                   





