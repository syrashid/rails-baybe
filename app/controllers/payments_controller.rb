class PaymentsController < ApplicationController
  before_action :set_cart

  def new
  end

  def show
  end

  def create
    user = Stripe::User.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     user.id,   # You should store this customer id and re-use it.
      amount:       @cart.total_price_cents,
      description:  "Payment for cart #{@cart.id}",
      currency:     @cart.total_price.currency
    )

    @cart.update(payment: charge.to_json, state: 'paid')
    redirect_to carts_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to carts_path
  end

  private

  def set_cart
    @cart = current_user.carts.where(state: 'pending').find(params[:cart_id])
  end
end
