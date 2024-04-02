class Course < ApplicationRecord
  belongs_to :department
  has_many :sections,  dependent: :destroy

  def full_course_title
    "#{department.code} #{code}: #{title}"
  end
end
