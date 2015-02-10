class Categorizer < ActiveRecord::Base
  belongs_to :columns
  belongs_to :categories
end
