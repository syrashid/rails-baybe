class Box < ApplicationRecord
  belongs_to :user
  has_many :stock_products
end
