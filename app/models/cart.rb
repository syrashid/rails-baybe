class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_options, dependent: :destroy
  has_many :stock_products
end
