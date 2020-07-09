class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :zip_code
      t.string :address
      t.integer :order_status, default: 0
      t.integer :delivery_fee, default: 800
      t.integer :total
      t.integer :payment_method

      t.timestamps
    end
  end
end
