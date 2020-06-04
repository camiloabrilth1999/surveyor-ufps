json.extract! user, :uuid, :name, :lastname, :code, :email, :document_number, :contact_number,
  :identification_type_id, :academic_departament_id, :academic_program_id, :created_at, :updated_at
json.url user_url(user, format: :json)
