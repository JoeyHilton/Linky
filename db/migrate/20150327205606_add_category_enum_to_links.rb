class AddCategoryEnumToLinks < ActiveRecord::Migration
  def change
    add_column :links, :category, :integer, default: 0, null: false
  end
end
