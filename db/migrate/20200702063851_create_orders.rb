class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customers_id
      t.string :name
      t.string :zip_code
      t.string :address
      t.integer :order_status
      t.integer :delivery_fee
      t.integer :total
      t.integer :payment_method

      t.timestamps
    end
  end
end
