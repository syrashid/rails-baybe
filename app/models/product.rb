class Product < ApplicationRecord
  belongs_to :category
  has_many :stock_products, dependent: :destroy
  # has_many :reviews, dependent: :destroy  TO DO: IMPLEMENT REVIEWS DOWN LINE

  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
