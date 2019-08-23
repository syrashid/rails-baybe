class CartsController < ApplicationController
  before_action :find_info, only: [:index, :current, :show, :sum_total]
  after_action :sum_total

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
    @rel_products = Product.all.sample(4)
  end

  private

  def sum_total
    stockproducts = @currentcart.stock_products
    @currentcart.total_price = stockproducts.sum do |stockproduct|
      stockproduct.product.price * stockproduct.condition.buy_ratio
    end
    @currentcart.save
  end

  def find_info
    @user = current_user
    @carts = Cart.where("user_id=?", @user.id)
    @currentcart = @carts.find_by(paid: "Pending")
  end

end
