class CartsController < ApplicationController
  before_action :find_info, only: [:index, :current, :show, :sum_total]
  before_action :find_stock, only: [:show, :current, :sum_total]
  after_action :sum_total, only: :show
  before_action :sum_total, only: [:current, :show]
  before_action :rel_and_savings, only: [:show, :current]

  def index
    @activecarts = @carts.active
  end

  def show
  end

  def current
  end

  def confirm
    @cart = current_user.current_cart
    user = Stripe::Customer.create(source: params[:stripeToken], email: params[:stripeEmail])

    charge = Stripe::Charge.create(customer: user.id, amount: @cart.total_price_cents,
      description: "Payment for cart #{@cart.id}", currency: @cart.total_price.currency)

    order_info

    @cart.update(payment: charge.to_json, paid: 'paid')

    redirect_to carts_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to carts_path
  end

  private

  def find_stock
    @stockproducts = @currentcart.stock_products
  end

  def sum_total
    @currentcart.total_price = @stockproducts.sum do |stockproduct|
      stockproduct.product.price * stockproduct.condition.buy_ratio
    end
    @currentcart.save
  end

  def find_info
    @user = current_user
    @carts = Cart.where("user_id=?", @user.id)
    @currentcart = current_user.current_cart
  end

  def savings
    saving = 0
    @stockproducts.each do |stockprod|
      saving += ((1 - stockprod.condition.buy_ratio) * stockprod.product.price)
    end
    saving
  end

  def rel_and_savings
    @rel_products = Product.all.sample(4)
    @cart_savings = savings
  end

  def order_info
    # CART OPTIONS PART
    # if params[:gift] == "on"
    #   @gift_option = Option.find_by("name=?", "gift")

    #   @cart_gift_option = CartOption.new
    #   @cart_gift_option.cart = @cart
    #   @cart_gift_option.option = @gift_option

    #   @cart_gift_option.save!
    # end

    @address_option = Option.find_by("name=?", "address")

    @cart_address_option = CartOption.new
    @cart_address_option.cart = @cart
    @cart_address_option.option = @address_option

    params[:delivery_place] == "home" ? @address = current_user.address : @address = "#{params[:address]}, #{params[:address2]}, #{params[:city]}, #{params[:country]}, #{params[:zip]}"

    @cart_address_option.content = @address
    @cart_address_option.save!
  end
end
