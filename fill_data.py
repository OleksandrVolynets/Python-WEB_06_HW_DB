from datetime import date
from faker import Faker
from random import randint, choice
import sqlite3


MAX_KOLVO_GRADES = 20
NUMBER_GROUPS = 3
NUMBER_STUDENTS = 50
NUMBER_SUBJECTS = 8
NUMBER_TEACHERS = 5


def randletter(x, y): #generate random letter in range x-y
    return chr(randint(ord(x), ord(y)))


def generate_fake_data(number_students, number_teachers, number_groups):
    fake_students = list()
    fake_teachers = list()
    fake_groups = list()
    fake_subjects = ['astronomy', 'biology', 'chemistry', 'computer science', 'engineering', 'geology', 'medicine', 'physics']

    fake_data = Faker('uk-UA')

    for _ in range(number_students):
        fake_students.append(fake_data.name())

    for _ in range(number_teachers):
        fake_teachers.append(fake_data.name())

    for _ in range(number_groups):
        group_name = str()

        while len(group_name) < 5:
            group_name += randletter('A', 'Z')

        group_name += '-20'
        fake_groups.append(group_name)
        group_name = ''

    return fake_groups, fake_students, fake_subjects, fake_teachers


def prepare_data(groups, students, subjects, teachers):
    fake = Faker('uk-UA')

    for_students = list()  # for table 'students'

    for student in students:
        for_students.append((student, randint(1, NUMBER_GROUPS)))

    for_groups = list()  # for table 'groups'

    for group in groups:
        for_groups.append((group, ))

    for_teachers = list()  # for table 'teachers'

    for teacher in teachers:
        for_teachers.append((teacher, ))



    for_subjects = list()  # for table 'subjects'
    teacher_number = 1

    for subject in subjects:
        if teacher_number <= 5:
            for_subjects.append((subject, teacher_number))  # this is for all teachers to take part
            teacher_number += 1
        else:
            for_subjects.append((subject, randint(1, NUMBER_TEACHERS)))

    for_grade_book = list()  # for table 'grade_book' 

    for id in range(1, NUMBER_STUDENTS+1):
        i = 1
        while i <= randint(1, MAX_KOLVO_GRADES):  # how many grades the same number of records a student has
            for_grade_book.append((id, randint(1, NUMBER_SUBJECTS), randint(1, 12), fake.date_between_dates(date(2022,1,1), date(2023,8,1))))
            i += 1
    return for_grade_book, for_groups, for_students, for_subjects, for_teachers


def insert_data_to_db(grade_book, groups, students, subjects, teachers):
    
    with sqlite3.connect('salary.db') as con:

        cur = con.cursor()

        sql_to_grade_book = """INSERT INTO grade_book(student_id_fk, subject_id_fk, grade, grade_date) VALUES (?, ?, ?, ?)"""
        cur.executemany(sql_to_grade_book, grade_book)

        sql_to_groups = """INSERT INTO groups(group_name) VALUES (?)"""
        cur.executemany(sql_to_groups, groups)

        sql_to_students = """INSERT INTO students(name, group_id_fk) VALUES (?, ?)"""
        cur.executemany(sql_to_students, students)

        sql_to_subjects = """INSERT INTO subjects(name, teacher_id_fk) VALUES (?, ?)"""
        cur.executemany(sql_to_subjects, subjects)

        sql_to_teachers = """INSERT INTO teachers(name) VALUES (?)"""
        cur.executemany(sql_to_teachers, teachers)
    
        con.commit()


def run():
    grade_book, groups, students, subjects, teachers = prepare_data(*generate_fake_data(NUMBER_STUDENTS, NUMBER_TEACHERS, NUMBER_GROUPS))
    insert_data_to_db(grade_book, groups, students, subjects, teachers)



if __name__ == '__main__':
    run()