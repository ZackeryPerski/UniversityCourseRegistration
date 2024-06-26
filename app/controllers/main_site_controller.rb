class MainSiteController < ApplicationController
  before_action :set_user, only: [ :my_courses, :register, :unregister, :change_grade]
  before_action :authenticate_user!, only: [:my_courses, :register, :unregister, :change_grade]
  before_action :require_student!, only: [:register, :unregister]
  before_action :require_instructor!, only: [:change_grade]

  # GET /main_site/my_courses
  def my_courses
    @person = @user.person
    current_semester_args = { semester: 'Winter', year: 2024 }
    semester_sort_order = {'Winter' => 1, 'Summer' => 2, 'Fall' => 3}

    @current_sections = @person.sections.where(current_semester_args).includes(:course) # person's current sections (instructor or student)

    if @user.instructor?
      @current_sections = @current_sections.includes(sections_students: :student).all # inlude section_students if they are an instructor
    end

    @past_sections = @person.sections.where.not(current_semester_args).includes(:course) # student's sections from the past
    @past_sections = @past_sections.sort_by { |s| [-s.year, semester_sort_order[s.semester]] } # sort based on semester-year descending
    @past_sections = @past_sections.group_by { |s| [s.year, s.semester] } # group by semester-year pairs
  end

  # PATCH/PUT /main_site/register/:section_id
  def register
    student = @user.student
    section_id = params[:section_id]
    section = Section.find(section_id)
    if SectionsStudent.where(section_id: section_id, student_id: @user.student.id).any? # if already registered
      redirect_to sections_path, notice: 'Error: You are already registered for this section'
    elsif student.sections.where(course: section.course).any? # if already registered under different section
      redirect_to sections_path, notice: 'Error: You are already for this course under another section.'
    elsif section.sections_students.count >= section.capacity # if section full
      redirect_to sections_path, notice: 'Error: Cannot register for this section, already at full capacity'
    else
      @user.student.sections_students.create(section_id: section_id)
      course_name = section.course.full_course_title
      redirect_to main_site_my_courses_path, notice: "Successfully registered for #{course_name}."
    end
  end

  # PATCH/PUT /main_site/unregister/:section_id
  def unregister
    section_id = params[:section_id]
    section_student = @user.student.sections_students.find_by(section_id: section_id)
    course_name = section_student.section.course.full_course_title
    section_student.destroy if section_student.present?
    redirect_to main_site_my_courses_path, notice: "Successfully unregistered from #{course_name}."
  end

  # PATCH/PUT /main_site/change_grade/:section_id/:section_id
  def change_grade
    section_id, student_id, grade = params[:section_id], params[:student_id],  params[:grade]
    section_student = SectionsStudent.find_by(section_id: section_id, student_id: student_id)
    course_name = section_student.section.course.full_course_title
    student_name = section_student.student.full_name
    section_student.update(grade: grade) if section_student.present?
    redirect_to main_site_my_courses_path, notice: "Successfully changed grade for #{student_name} in #{course_name}."
  end

  private 

  def set_user
    @user = current_user
  end

  def require_student!
    unless current_user.student?
      flash[:alert] = "You must be an student to access this action."
      redirect_to root_path
    end
  end

  def require_instructor!
    unless current_user.instructor?
      flash[:alert] = "You must be an instructor to access this action."
      redirect_to root_path
    end
  end
end
