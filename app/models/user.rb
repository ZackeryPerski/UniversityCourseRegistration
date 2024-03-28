class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student, dependent: :destroy
  has_one :instructor

  accepts_nested_attributes_for :student

  def student?
    student.present?
  end

  def instructor?
    instructor.present?
  end

  def person
    return student if student?
    return instructor if instructor?

    nil
  end

  private

  def create_student_record
    Student.create(user: self)
  end
end
