class Product < ApplicationRecord
  belongs_to :category
  has_many :stock_products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :brand, presence: true
  mount_uploader :photo, PhotoUploader
end
