class CartsController < ApplicationController
  def index
    @user = current_user
    @carts = Cart.where("user_id=?", @user.id)
    @currentcart = @carts.find_by(paid: "Pending")
    @newcart = Cart.create(paid: "Pending", user: @user)
    @currentcart.update(paid: "Paid")
  end

  def show
    @cart = Cart.find(params[:id])
    @stockproducts = @cart.stock_products
  end
end
