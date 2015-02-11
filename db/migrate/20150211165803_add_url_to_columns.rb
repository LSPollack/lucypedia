class AddUrlToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :story_url, :string
  end
end
