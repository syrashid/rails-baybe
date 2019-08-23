class CartsController < ApplicationController
  before_action :find_info, only: [:index, :current]

  def index
    @newcart = Cart.create(paid: "Pending", user: @user)
    @currentcart.update(paid: "Paid")
  end

  def show
    @cart = Cart .find(params[:id])
    @stockproducts = @cart.stock_products
    @rel_products = Product.all.sample(4)
  end

  def current
  end

  private

  def find_info
    @user = current_user
    @carts = Cart.where("user_id=?", @user.id)
    @currentcart = @carts.find_by(paid: "Pending")
  end

end
