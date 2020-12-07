class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :code
      t.string :full_name
      t.string :document_number
      t.integer :type
      t.belongs_to :academic_departament
      t.belongs_to :academic_program
      t.belongs_to :identification_type
    end
  end
end
