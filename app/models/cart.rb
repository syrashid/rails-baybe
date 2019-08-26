class Cart < ApplicationRecord
  belongs_to :user
  has_many :stock_products
  has_many :options, through: :cart_options
  validates :paid, presence: true, inclusion: { in: %w[Pending Paid Denied] }

  # monetize :total_price
end
