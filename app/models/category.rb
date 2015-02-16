class Category < ActiveRecord::Base
  has_many :categorizers, dependent: :destroy
  has_many :columns, through: :categorizers
end
