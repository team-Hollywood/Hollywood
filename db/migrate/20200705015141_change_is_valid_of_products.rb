class ChangeIsValidOfProducts < ActiveRecord::Migration[5.2]
  def change
  	def up
	    change_column :products, :is_valid, :boolean, default: 'true'
	end

	def down
	    change_column :products, :is_valid, :boolean
	end
  end
end
