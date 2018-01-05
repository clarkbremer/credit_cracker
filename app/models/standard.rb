require 'csv'

class Standard < ApplicationRecord

  def self.import_csv(filename, field)
    header = []
    line = 0

    File.foreach(Rails.root.join(filename)) do |csv_line|
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
      row[:example] = row.delete(:"for example")
      standard = Standard.where(field: field, code: row[:code]).first_or_initialize
      standard.update_attributes(row.slice(:code, :benchmark, :example))
    end
  end

end
