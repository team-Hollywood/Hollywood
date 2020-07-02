class RemoveColumnsFromAddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    drop_table :add_columns_to_customers
  end
end
