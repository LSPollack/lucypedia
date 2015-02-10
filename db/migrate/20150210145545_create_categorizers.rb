class CreateCategorizers < ActiveRecord::Migration
  def change
    create_table :categorizers do |t|
      t.integer :column_id
      t.integer :category_id
      t.timestamps
    end
  end
end
