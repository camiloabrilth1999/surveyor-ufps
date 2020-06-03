class CreateIdentificationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :identification_types do |t|
      t.string :description
      t.string :summary_description

      t.timestamps
    end

    change_table :users do |t|
      t.references :identification_type
    end

    change_table :students do |t|
      t.references :identification_type
    end
  end
end
