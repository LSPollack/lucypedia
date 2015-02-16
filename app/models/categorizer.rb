class Categorizer < ActiveRecord::Base
  belongs_to :column
  belongs_to :category
end
