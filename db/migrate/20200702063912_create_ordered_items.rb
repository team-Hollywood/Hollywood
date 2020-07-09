class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :amount
      t.integer :tax_included_price
      t.integer :production_status, default: 0

      t.timestamps
    end
  end
end
