class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.boolean :is_primary, :default => false
      t.boolean :live, :default => true
      t.integer :color_id

      t.timestamps
    end
  end
end
