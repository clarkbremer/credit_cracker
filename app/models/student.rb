class Student < ApplicationRecord
  has_many :student_badges
  has_many :badges, through: :student_badges
  has_many :standards, through: :badges
end
