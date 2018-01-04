class Badge < ApplicationRecord
  has_many :badge_standards
  has_many :standards, through: :badge_standards
end
