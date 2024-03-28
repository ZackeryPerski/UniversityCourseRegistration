class MainSiteController < ApplicationController
  def index
  end

  def my_courses
    @user = Instructor.find(1).user
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
end
