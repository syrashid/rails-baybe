class CartsController < ApplicationController
  def index
    @cart = @current_cart
  end

  def show
    @cart = @current_cart
  end

  def total_price
    self.quantity * self.product.price
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end



