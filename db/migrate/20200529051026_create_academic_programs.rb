class CreateAcademicPrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_programs do |t|
      t.string :name
      t.string :code
      t.string :email
      t.belongs_to :faculty

      t.timestamps
    end

    change_table :users do |t|
      t.references :academic_program
    end
  end
end
