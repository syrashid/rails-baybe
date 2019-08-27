class CartsController < ApplicationController
  before_action :find_info, only: [ :index, :current, :show, :sum_total]
  after_action :sum_total, only: [ :current, :show ]

  def index
    @activecarts = @carts.active
  end

  def show
    @cart = Cart .find(params[:id])
    @stockproducts = @cart.stock_products
    @rel_products = Product.all.sample(4)
  end

  def current
    @rel_products = Product.all.sample(4)
  end

  def confirm
    @cart = current_user.current_cart

    user = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     user.id, # You should store this customer id and re-use it.
      amount:       @cart.total_price_cents,
      description:  "Payment for cart #{@cart.id}",
      currency:     @cart.total_price.currency
    )

    cart_options = CartOption.new()

    @cart.update(payment: charge.to_json, paid: 'paid')
    redirect_to carts_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to carts_path
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
    @currentcart = current_user.current_cart
  end
end
