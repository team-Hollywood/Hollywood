class ChangeCustomerIsValidDefault < ActiveRecord::Migration[5.2]
  def up
  	change_column :customers, :is_registered, :boolean, default: 'true'
  end

  def down
  	change_column :customers, :is_registered, :boolean
  end
end
