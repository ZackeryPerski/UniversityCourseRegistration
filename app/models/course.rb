class Course < ApplicationRecord
  belongs_to :department
  has_many :sections

  def full_course_title
    "#{department.code} #{code}: #{title}"
  end
end
