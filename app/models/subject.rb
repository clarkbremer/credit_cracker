class Subject < ApplicationRecord
  has_many :standards

  def import
    Standard.import_csv("#{name}_Standards.csv", self)
  end
end
