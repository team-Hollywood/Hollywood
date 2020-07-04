class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.boolean :is_valid
      t.string :name
      t.integer :tax_excluded_price
      t.text :discription
      t.string :image_id

      t.timestamps
    end
  end
end
