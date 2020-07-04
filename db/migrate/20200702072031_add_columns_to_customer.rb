class AddColumnsToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :lastname, :string
    add_column :customers, :firstname, :string
    add_column :customers, :lastname_kana, :string
    add_column :customers, :firstname_kana, :string
    add_column :customers, :zip_code, :string
    add_column :customers, :address, :string
    add_column :customers, :phone, :string
    add_column :customers, :is_registered, :boolean
  end
end
