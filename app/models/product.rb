class Product < ApplicationRecord
  belongs_to :category
  has_many :stock_products, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
