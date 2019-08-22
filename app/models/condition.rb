class Condition < ApplicationRecord
  has_many :stock_products
  validates :name, presence: true, inclusion: { in: ["Like New", "Very Good", "Good", "Acceptable"] }
  validates :buy_ratio, presence: true
  validates :sell_ratio, presence: true
end
