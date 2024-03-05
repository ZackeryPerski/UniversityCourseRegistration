class Section < ApplicationRecord
  belongs_to :course
  belongs_to :instructor

  has_many :sections_students
  has_many :students, through: :sections_students

end
