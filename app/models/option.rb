class Option < ApplicationRecord
  has_many :cart_options, dependent: :destroy
  validates :name, presence: true
end
