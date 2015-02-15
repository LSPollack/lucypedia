class ChangeColorIdInCategoriesTableToString < ActiveRecord::Migration
  def change
    remove_column :categories, :color_id, :integer
    add_column :categories, :color_id, :string
  end
end
