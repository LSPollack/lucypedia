class ChangeDatatypeForPublisheddateInColumns < ActiveRecord::Migration
  def change
    remove_column :columns, :publication_timestamp, :datetime
    add_column :columns, :publication_timestamp, :date
  end
end
