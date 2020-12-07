class Teacher < ApplicationRecord

  self.inheritance_column = :_type_disabled

  belongs_to :academic_departament
  belongs_to :academic_program
  belongs_to :identification_type

  enum type: [:catedra, :planta]

  validates :full_name, :code, :document_number, :type, presence: true

  def self.import(file, academic_program_id)
    data = Roo::Spreadsheet.open(file.path)
    headers = ["code", "full_name", "identification_type_id", "document_number", "type", "academic_departament_id"]
    data.each_with_index do |row, idx|
      next if idx == 0
      row.pop
      row.unshift(row.slice!(0).to_s)
      row.insert(3, row.slice!(3).to_s)
      teacher_data = Hash[[headers, row].transpose]
      teacher_data["identification_type_id"] = IdentificationType.where(summary_description: teacher_data["identification_type_id"]).ids.first
      teacher_data["academic_departament_id"] = AcademicDepartament.where(code: teacher_data["academic_departament_id"]).ids.first
      type_teacher = teacher_data["type"].downcase
      teacher_data.delete("type")
      teacher_data["academic_program_id"] = academic_program_id
      teacher = Teacher.new(teacher_data)
      teacher.type = type_teacher
      begin
        teacher.save
      rescue StandardError => e
        puts "Error: #{e.inspect}"
        next
      end
    end
  end
end
