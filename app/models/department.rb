class Department < ApplicationRecord
  has_many :courses

  belongs_to :department_head, class_name: 'Instructor', optional: true
end