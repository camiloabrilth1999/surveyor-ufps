class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :code
      t.string :full_name
      t.string :document_number
      t.string :semester
      t.float :average
    end
  end
end
