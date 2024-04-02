class Student < ApplicationRecord
  belongs_to :user

  has_many :sections_students
  has_many :sections, through: :sections_students

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
end
