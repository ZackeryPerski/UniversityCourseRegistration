class Course < ApplicationRecord
  belongs_to :department
  has_many :sections

  has_many :course_prerequisites, class_name: 'Prerequisite', foreign_key: 'course_id'
  has_many :prerequisites, through: :course_prerequisites, source: :prerequisite_course

  has_many :prerequisite_for_courses, class_name: 'Prerequisite', foreign_key: 'prerequisite_course_id'
  has_many :courses, through: :prerequisite_for_courses, source: :course
end
