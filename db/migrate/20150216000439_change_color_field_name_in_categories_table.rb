class ChangeColorFieldNameInCategoriesTable < ActiveRecord::Migration
  def change
    remove_column :categories, :color_id, :integer
    add_column :categories, :color, :string
  end
end
