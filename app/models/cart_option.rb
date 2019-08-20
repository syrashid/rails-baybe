class CartOption < ApplicationRecord
  belongs_to :option
  belongs_to :cart

end
