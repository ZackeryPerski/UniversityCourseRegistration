class Student < ApplicationRecord
  belongs_to :user

  has_many :sections_students, dependent: :destroy
  has_many :sections, through: :sections_students


  majors = ["Business","Computer Science","Computer Engineering","Data Science","Math","Cyber Security"]
  enum major: majors.map { |major| [major.to_sym, major] }.to_h

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
end
