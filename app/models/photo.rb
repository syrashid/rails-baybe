class Photo < ApplicationRecord
  belongs_to :stock_product
  mount_uploader :photolink, PhotoUploader
end
