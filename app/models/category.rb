class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :description, presence: true
end
