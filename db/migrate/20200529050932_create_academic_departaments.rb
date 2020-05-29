class CreateAcademicDepartaments < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_departaments do |t|
      t.string :name
      t.string :code
      t.belongs_to :faculty

      t.timestamps
    end

    change_table :users do |t|
      t.references :academic_departament
    end
  end
end
