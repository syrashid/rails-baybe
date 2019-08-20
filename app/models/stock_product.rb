class StockProduct < ApplicationRecord
  belongs_to :condition
  belongs_to :cart, optional: true
  belongs_to :product
  belongs_to :box, optional: true
  has_many :photos, dependent: :destroy
end
