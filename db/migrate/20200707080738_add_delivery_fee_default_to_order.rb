class AddDeliveryFeeDefaultToOrder < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :delivery_fee, :integer, default: 800
  end
  def down
    change_column :orders, :delivery_fee, :integer
  end
end
