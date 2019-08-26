class Box < ApplicationRecord
  STATUS = %w[pending shipping accepted rejected].freeze
  belongs_to :user
  has_many :stock_products
  validates :status, presence: true, inclusion: { in: STATUS }

  STATUS.each do |state|
    define_method "#{state}?" do
      status == state
    end
  end
end
