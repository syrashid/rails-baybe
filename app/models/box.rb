class Box < ApplicationRecord
  belongs_to :user
  has_many :stock_products
  validates :status, presence: true, inclusion: { in: %w[Shipping Pending Accepted Rejected] }
end
