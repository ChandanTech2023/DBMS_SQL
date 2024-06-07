import mysql.connector as con
db =con.connect(host="localhost",user="root",password='9113',database="MYCOMPANY")
print("Connection created")
#create cursor which point to my database

cur= db.cursor()
# cur.execute("create database MYCOMPANY")
# print("database created ")

# cur.execute("use MYCOMPANY")
# cur.execute("create table student(rollNo int ,name varchar(30))")
# print("Table created")
# cur.execute("desc student")

# cur.execute("insert into student values(%s,%s)",(12,"Chandan"))
# db .commit()
# print("row inserted succesfully !!")

# query="insert into  student values(%s,%s)"
# list=[(2,"Sunita") ,(3,"Rahul")]
# cur.executemany(query,list)
# db.commit()
# print("record  Inserted sucessfully ",cur.rowcount)
# select =cur.fetchone()

# # Udate record+++++++++++++++
# update = "update student set name =%s where rollNo =%s" 
# value=("Aadi",3)
# cur.execute(update,value)
# db.commit()

# cur.execute("select *from student")
# select =cur.fetchall()
# print(select)

#  +++++++++++++Deletion ++++++++
delete ="delete from student where rollNo =%s"
value=(2,)
cur.execute(delete,value)
db.commit()
