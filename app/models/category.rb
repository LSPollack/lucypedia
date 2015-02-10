class Category < ActiveRecord::Base
  has_many :columns, through: :categorizers
  has_many :categorizers, dependent: :destroy
end
