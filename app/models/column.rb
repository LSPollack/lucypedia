class Column < ActiveRecord::Base
  has_many :categorizers, dependent: :destroy
  has_many :categories, through: :categorizers

  belongs_to :primary_category, class_name: 'Category'


  

end
