class AddAttrToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :code, :string
    add_column :users, :document_number, :string
    add_column :users, :contact_number, :string
  end
end
