class Column < ActiveRecord::Base
  has_many :categorizers, dependent: :destroy
  has_many :categories, through: :categorizers

  accepts_nested_attributes_for :categorizers, allow_destroy: true

end
