class Option < ApplicationRecord
  has_many :cart_options, dependent: :destroy
end
