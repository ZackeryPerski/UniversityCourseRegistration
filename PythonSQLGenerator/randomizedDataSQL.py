import names, random, json

f = open("DataInsert.sql","w")
with open('courses.json', 'r') as courses_file:
   coursesComponents = json.load(courses_file)
with open('departments.json', 'r') as departments_file:
   departmentsComponents = json.load(departments_file)

emailEnders = ["@gmail.com","@outlook.com","@hotmail.com","@yahoo.com","@protonmail.com","@msn.com"]

#Hard coded status inserts
#statusInsert = "insert into status(status_type) values ('pending'),('approved'),('denied');"

usersInsert = "insert into users(email, encrypted_password, first_name, last_name, university_id) values ('{email}','{encrypted_password}','{first_name}','{last_name}','{university_id}')"
studentsInsert = "insert into students(major, is_undergraduate, user_id) values ('{department_name}',{is_undergrad},{user_id})"
instructorsInsert = "insert into instructors(ssn, phone_number, department_id, user_id) values ('{ssn}','{phone_number}',{department_id},{user_id})"
departmentsInsert = "insert into departments(name, code, department_head_id) values ('{department_name}','{department_code}',{department_head_id})"
coursesInsert = "insert into courses(title, description, department_id, code, credits) values ('{title}','{description}',{department_id},'{code}', {credits})"
prereqsInsert = "insert into prerequisites(course_id, prerequisite_course_id) values ({course_id},{prerequisite_course_id})"
sectionsInsert = "insert into sections(course_id, instructor_id, capacity, semester, year, days, start_time, end_time) values ({course_id}, {instructor_id}, {capacity}, '{semester}', {year}, '{days}', '{start_time}', '{end_time}')"
sectionsStudentsInsert = "insert into sections_students(section_id, student_id, grade) values ({section_id}, {student_id}, {grade})"
#boilerplate entries to clear the db for demo.

#boilerplate entries to initialize helper tables.

#start with generating 100 users that are students.
i = 0
while i<100:
   firstName = names.get_first_name()
   lastName = names.get_last_name()
   email = firstName[0]+lastName+str(random.randint(1,9999))+random.choice(emailEnders)
   userPassword = str(random.choice(random.choice(emailEnders)))+str(random.randrange(0,100))+str(random.choice(random.choice(emailEnders)))+random.choice(['!',"_","@","#","$","^","&","*","(",")","-","=","+"])
   universityId = "S"+(":09".format(i))
   {email}','{encrypted_password}','{first_name}','{last_name}','{university_id}
   userOutput = usersInsert.format(email=email,encrypted,first_name=fName,last_name=lName,user_password=userPasswordTemp,user_name=userNameTemp)
   
   accountSQL = accountSQL.format(amount=random.random()*1000,account_type_id=random.randint(1,2),user_id=i+1)
   if random.randint(0,1)==1:
      accountSQL = accountSQL + "\n"+accountsInsert.format(amount=random.random()*1000,account_type_id=random.randint(1,2),user_id=i+1)
   f.write(output+"\n")
   f.write(accountSQL+"\n")
   i+=1

f.close()


#ruby reset code for later, drops all tables, recreates, migrates, then seeds.
#rails db:drop db:create db:migrate db:seed
