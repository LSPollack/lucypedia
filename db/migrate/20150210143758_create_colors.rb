class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex_code
      t.string :color_name

      t.timestamps
    end
  end
end
