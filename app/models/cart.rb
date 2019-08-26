class Cart < ApplicationRecord
  belongs_to :user
  STATUS = %w[pending paid denied].freeze
  has_many :stock_products
  has_many :options, through: :cart_options
  validates :paid, presence: true, inclusion: { in: STATUS }

  monetize :total_price_cents

  STATUS.each do |state|
    define_method "#{state}?" do
      paid == state
    end
  end
end
