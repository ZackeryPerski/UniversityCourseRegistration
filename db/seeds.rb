# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#TO USE EFFECTIVELY
#First, run: rails db:drop db:create db:migrate  db:seed
#Second, run: 

STUDENT_COUNT = 100
FACULTY_COUNT = 30
SECTIONS_PER_CLASS = 3
SECTION_CAPACITY = 30


names_file = File.read('jsonSeeds/names.json') #has 100 names.
departments_file = File.read('jsonSeeds/departments.json')
courses_file = File.read('jsonSeeds/courses.json') #assumption that it runs from db/migrate/.

names = JSON.parse(names_file)
departments = JSON.parse(departments_file)
courses = JSON.parse(courses_file)

emailEnders = ["@gmail.com","@outlook.com","@hotmail.com","@yahoo.com","@protonmail.com","@msn.com"]

#
#usersInsert = "insert into users(email, encrypted_password, first_name, last_name, university_id) values ('{email}','{encrypted_password}','{first_name}','{last_name}','{university_id}')"
#studentsInsert = "insert into students(major, is_undergraduate, user_id) values ('{department_name}',{is_undergrad},{user_id})"
#instructorsInsert = "insert into instructors(ssn, phone_number, department_id, user_id) values ('{ssn}','{phone_number}',{department_id},{user_id})"
#departmentsInsert = "insert into departments(name, code, department_head_id) values ('{department_name}','{department_code}',{department_head_id})"
#coursesInsert = "insert into courses(title, description, department_id, code, credits) values ('{title}','{description}',{department_id},'{code}', {credits})"
#prereqsInsert = "insert into prerequisites(course_id, prerequisite_course_id) values ({course_id},{prerequisite_course_id})"
#sectionsInsert = "insert into sections(course_id, instructor_id, capacity, semester, year, days, start_time, end_time) values ({course_id}, {instructor_id}, {capacity}, '{semester}', {year}, '{days}', '{start_time}', '{end_time}')"
#sectionsStudentsInsert = "insert into sections_students(section_id, student_id, grade) values ({section_id}, {student_id}, {grade})"
#

#Goal is 80 students, 20 faculty members.
#First generate student names.

count = 1 #independent tracker variable for the auto-incrementing id field in users.
while count <= STUDENT_COUNT
    fname = names["first_names"].sample()
    lname = names["last_names"].sample()
    email = fname+"."+lname+emailEnders.sample()
    uid = "%09d"%count #formatting input.
    uid = "S"+uid
    pw = fname+lname+"1"
    maj = departments["department_names"].sample()
    under_status = [true, false].sample()

    User.create(email: email, password: pw, first_name: fname, last_name: lname, university_id: uid)
    Student.create(major: maj, is_undergraduate: under_status, user_id: count)
    #TODO: Finish adding the ruby code to do insert the user+associated student data.
    count = count + 1 #apparently no incrementer
end

#before instructors, we need to add the different departments
for i in (0...departments["department_names"].size)
    dname = departments["department_names"][i]
    dcode = departments["department_codes"][i]
    
    result = Department.create(code: dcode, name: dname)
end

while count <= FACULTY_COUNT+STUDENT_COUNT
    fname = names["first_names"].sample()
    lname = names["last_names"].sample()
    email = fname+"."+lname+emailEnders.sample()
    uid = "%09d"%count #formatting input.
    uid = "F"+uid
    pw = fname+lname+"1"
    ssn = 100000000+count*3
    phone = 1000000000+count*5

    User.create(email: email, password: pw, first_name: fname, last_name: lname, university_id: uid)
    Instructor.create(ssn: ssn, phone_number: phone, department_id: (count%Department.count())+1, user_id: count)
    #TODO Finish adding the ruby code to add entries.
    count = count+1
end

#creating the courses here.
for i in (0...Department.count())
    d_id = i+1
    d_name = departments["department_names"][i]
    d_code = departments["department_codes"][i]
    option_count = courses["title_starters"].size
    for title in courses["title_starters"]
        for j in (0...option_count)
            full_title = title + d_name + courses["title_enders"][j]
            desc = courses["descriptions"][j]+d_name
            credits = j>1? 3:4
            Course.create(title: full_title, description: desc, department_id: d_id, code: d_code, credits: credits)
        end
    end
end

#followed by sections here.
#to make things easier here...
count = 1 #this will sync us back up to faculty_id pk section for generated instructors.
for i in (0...Course.count())
    currentCourse = Course.find(i+1)
    c_id = currentCourse.id
    for j in (0...SECTIONS_PER_CLASS)
        currentInstructor = Instructor.find((count%FACULTY_COUNT)+1)
        i_id = currentInstructor.id
        semester = ["Fall", "Winter"].sample()
        year = [2024,2023,2022].sample()
        days = ["MW","TR","MWF"].sample()
        start_hour = [9,10,11,12,13,14,15].sample()
        start_month = semester=="Fall"? 8:1
        end_month = semester=="Fall"? 12:4
        start_day = semester=="Fall"? 30:1 
        end_day = semester=="Fall"? 31:30
        start_time = Time.new(year,start_month,start_day,start_hour,0,0)
        end_time = Time.new(year,end_month,end_day,start_hour+2,0,0)
        Section.create(course_id: c_id, instructor_id: i_id, capacity: SECTION_CAPACITY, semester: semester, year: year, days: days, start_time: start_time, end_time: end_time)
        count = count + 1 #once we've created a section, move onto the next instructor to give a class to.
    end
end

#final section, inserting students into the join table.
count = 1

for i in (0...Section.count())
    currentSection = Section.find(i+1)
    s_id = currentSection.id
    for j in (0...SECTION_CAPACITY)
        currentStudent = Student.find((count%STUDENT_COUNT)+1)
        st_id = currentStudent.id
        #funky looking, but statistically speaking, this allows for a bell curve distribution.
        grade = ['A','A','B','B','B','C','C','C','D','D','E','E'].sample()
        SectionsStudent.create(section_id: s_id, student_id: st_id, grade: grade)
        count = count + 1
    end
end
