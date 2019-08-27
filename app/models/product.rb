class Product < ApplicationRecord
  belongs_to :category
  has_many :stock_products, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  # validates :brand, presence: true, allow_nil: true
  # validates :price, presence: true, allow_nil: true
  # validates :age_min, presence: true, allow_blank: false, numericality: { only_integer: true }
  # validates :age_max, presence: true, allow_blank: false, numericality: { only_integer: true }
  # validates :gender, presence: true, allow_nil: true
  mount_uploader :photo, PhotoUploader

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
