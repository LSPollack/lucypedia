class AddPrimaryCategoryIdToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :primary_category_id, :integer
  end
end
