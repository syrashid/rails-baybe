class Cart < ApplicationRecord
  belongs_to :user
  STATUS = %w[pending paid denied].freeze
  has_many :stock_products
  has_many :options, through: :cart_options

  validates :paid, presence: true, inclusion: { in: %w[Pending Paid Denied] }

  # monetize :total_price

  validates :paid, presence: true, inclusion: { in: STATUS }

  STATUS.each do |state|
    define_method "#{state}?" do
      paid == state
    end
  end
end
