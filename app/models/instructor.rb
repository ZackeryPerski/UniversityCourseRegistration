class Instructor < ApplicationRecord
  belongs_to :department
  belongs_to :user

  has_many :sections

  has_one :headed_department, class_name: 'Department', foreign_key: 'department_head_id'
end
