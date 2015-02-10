class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.text :unparsed_html_body
      t.datetime :publication_timestamp
      t.string :headline
      t.text :parsed_question
      t.text :parsed_answer

      t.timestamps
    end
  end
end
