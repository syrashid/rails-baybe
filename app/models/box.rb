class Box < ApplicationRecord
  STATUS = %w[shipping pending accepted rejected].freeze
  belongs_to :user
  has_many :stock_products
  validates :status, presence: true, inclusion: { in: STATUS }

  STATUS.each do |state|
    define_method "#{state}?" do
      status == state
    end
  end
end
