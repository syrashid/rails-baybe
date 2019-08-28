class Cart < ApplicationRecord
  belongs_to :user
  STATUS = %w[pending paid denied].freeze
  has_many :stock_products
  has_many :cart_options
  has_many :options, through: :cart_options

  validates :paid, presence: true, inclusion: { in: STATUS }

  scope :active, -> { joins(:stock_products).group("carts.id") }
  scope :paid, -> { where(paid: "paid") }

  # after_update :set_current_cart

  monetize :total_price_cents

  STATUS.each do |state|
    define_method "#{state}?" do
      paid == state
    end
  end

  # private

  # def set_current_cart
  #   if saved_change_to_paid? && paid?
  #     Cart.create(
  #       paid: 'pending',
  #       user: user
  #     )
  #   end
  # end
end
