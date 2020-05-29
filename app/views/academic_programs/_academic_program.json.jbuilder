json.extract! academic_program, :id, :name, :code, :email, :created_at, :updated_at
json.url academic_program_url(academic_program, format: :json)
