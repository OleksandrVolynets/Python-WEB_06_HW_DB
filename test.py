import sqlite3

DB = 'salary.db'
QUERY_FILE = '12.sql'

with open(QUERY_FILE, 'r') as f:
    sql = f.read()

db = sqlite3.connect(DB)

cursor = db.cursor()
cursor.execute(sql)
records = cursor.fetchall()
for record in records:
    print(record)
    
cursor.close()













