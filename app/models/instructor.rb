class Instructor < ApplicationRecord
  belongs_to :department
  belongs_to :user

  has_many :sections,  dependent: :destroy

  has_one :headed_department, class_name: 'Department', foreign_key: 'department_head_id'

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
end
