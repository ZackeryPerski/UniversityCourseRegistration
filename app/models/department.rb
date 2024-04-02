class Department < ApplicationRecord
  has_many :courses, dependent: :destroy

  belongs_to :department_head, class_name: 'Instructor', optional: true
end