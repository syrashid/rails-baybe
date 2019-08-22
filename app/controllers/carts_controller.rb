class CartsController < ApplicationController
  def index
    @carts = Cart.where("user_id=?", current_user.id)
  end
end
