class MainSiteController < ApplicationController
  def index
  end

  def my_courses
    @user = Student.find(6).user
    @person = @user.person
    current_semester_args = { semester: 'Winter', year: 2024 }
    semester_sort_order = {'Winter' => 1, 'Summer' => 2, 'Fall' => 3}

    @current_sections = @person.sections.where(current_semester_args).includes(:course)

    if @user.instructor?
      @current_sections = @current_sections.includes(sections_students: :student).all
    end

    @past_sections = @person.sections.where.not(current_semester_args).includes(:course)
    @past_sections = @past_sections.sort_by { |s| [-s.year, semester_sort_order[s.semester]] }
    @past_sections = @past_sections.group_by { |s| [s.year, s.semester] }
  end

  def unregister
    @user = Student.find(6).user
    section_id = params[:section_id]
    section_student = @user.student.sections_students.find_by(section_id: section_id)
    course_name = section_student.section.course.full_course_title
    section_student.destroy if section_student.present?
    redirect_to main_site_my_courses_path, notice: "Successfully unregistered from #{course_name}."
  end

  def register
    @user = Student.find(6).user
    student = @user.student
    section_id = params[:section_id]
    section = Section.find(section_id)
    if SectionsStudent.where(section_id: section_id, student_id: @user.student.id).any?
      redirect_to sections_path, notice: 'Error: You are already registered for this section'
    elsif student.sections.where(course: section.course).any?
      redirect_to sections_path, notice: 'Error: You are already for this course under another section.'
    elsif section.sections_students.count >= section.capacity
      redirect_to sections_path, notice: 'Error: Cannot register for this section, already at full capacity'
    else
      @user.student.sections_students.create(section_id: section_id)
      course_name = section.course.full_course_title
      redirect_to main_site_my_courses_path, notice: "Successfully registered for #{course_name}."
    end
  end

  def change_grade
    @user = Instructor.find(1).user
    section_id, student_id, grade = params[:section_id], params[:student_id],  params[:grade]
    section_student = SectionsStudent.find_by(section_id: section_id, student_id: student_id)
    course_name = section_student.section.course.full_course_title
    student_name = section_student.student.full_name
    section_student.update(grade: grade) if section_student.present?
    redirect_to main_site_my_courses_path, notice: "Successfully changed grade for #{student_name} in #{course_name}."
  end
end
