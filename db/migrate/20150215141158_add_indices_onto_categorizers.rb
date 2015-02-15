class AddIndicesOntoCategorizers < ActiveRecord::Migration
  def change
    add_index :categorizers, :column_id
    add_index :categorizers, :category_id
    add_index :categorizers, [:column_id, :category_id], unique: true
  end
end
