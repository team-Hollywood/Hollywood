class ChangeIsValidOfGenres < ActiveRecord::Migration[5.2]
  def up
    change_column :genres, :is_valid, :boolean, default: 'true'
  end

  def down
    change_column :genres, :is_valid, :boolean
  end
end
