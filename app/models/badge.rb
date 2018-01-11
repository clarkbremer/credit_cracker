class Badge < ApplicationRecord
  has_many :badge_standards, dependent: :destroy
  has_many :standards, through: :badge_standards
  has_many :student_badges, dependent: :destroy
  has_many :students, through: :student_badges
end
