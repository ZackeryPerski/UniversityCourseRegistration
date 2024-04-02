class User < ApplicationRecord
  # dependenicey package for user functionality
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student, dependent: :destroy
  has_one :instructor, dependent: :destroy

  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :instructor

  def student?
    student.present?
  end

  def instructor?
    instructor.present?
  end

  # returns the specific Student or Instructor object
  def person
    return student if student?
    return instructor if instructor?

    nil
  end
end
