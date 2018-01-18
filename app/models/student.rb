class Student < ApplicationRecord
  has_many :student_badges, dependent: :destroy
  has_many :badges, through: :student_badges
  has_many :standards, through: :badges

  def credits
    credit_report = []
    Subject.find_each do |subject|
      subject_standards = standards.where(subject_id: subject.id).uniq.count
      fraction = subject_standards.to_f / subject.standards.count
      credit_report << {subject: subject.name, credits: fraction * subject.credits}
    end
    credit_report
  end
end
