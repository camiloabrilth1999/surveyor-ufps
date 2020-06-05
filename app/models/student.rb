class Student < ApplicationRecord

  belongs_to :academic_program
  belongs_to :identification_type

  validates :full_name, :code, :document_number, :semester, :average, presence: true
  validates :code, :document_number, uniqueness: true

  def self.import(file, academic_program_id)
    data = Roo::Spreadsheet.open(file.path)
    headers = ["code", "full_name", "identification_type_id", "document_number", "semester", "average"]
    data.each_with_index do |row, idx|
      next if idx == 0
      row.pop
      row.unshift(row.slice!(0).to_s)
      row.insert(3, row.slice!(3).to_s)
      student_data = Hash[[headers, row].transpose]
      student_data["identification_type_id"] = IdentificationType.where(summary_description: student_data["identification_type_id"]).ids.first
      student_data["academic_program_id"] = academic_program_id
      student = Student.new(student_data)
      begin
        student.save
      rescue StandardError => e
        binding.pry
        puts "Error: #{e.inspect}"
        next
      end
    end
  end
end
