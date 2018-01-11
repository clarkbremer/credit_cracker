require 'csv'

class Standard < ApplicationRecord
  has_many :badge_standards, dependent: :destroy
  has_many :badges, through: :badge_standards
  belongs_to :subject

  def self.import_csv(filename, subject)
    header = []
    line = 0

    File.foreach(Rails.root.join('data', filename)) do |csv_line|
      line += 1
      begin
        row = CSV.parse(csv_line).first
      rescue CSV::MalformedCSVError => e
        puts "Error reading line #{line} of csv file"
        byebug
        next
      end
      if header.empty?
        header = row.map{|h| h.downcase.to_sym}
        next
      end
      row = Hash[header.zip(row)]
      standard = Standard.where(subject: subject, code: row[:code]).first_or_initialize
      standard.update_attributes(row.slice(:code, :benchmark, :standard))
    end
  end

end
