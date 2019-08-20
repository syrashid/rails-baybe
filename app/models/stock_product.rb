class StockProduct < ApplicationRecord
  belongs_to :condition
  belongs_to :cart
  belongs_to :product
  belongs_to :box
  has_many :photos, dependent: :destroy
end
