class CartsController < ApplicationController
  def index
    @carts = Cart.where("user_id=?", current_user.id)
  end

  def show
    @cart = Cart.find(params[:id])
    @stockproducts = @cart.stock_products
  end
end
