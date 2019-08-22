class BoxesController < ApplicationController
  def index
    @boxes = Box.where("user_id=?", current_user.id)
  end

  def show
    @stockproducts = Box.find(params[:id]).stock_products
  end
end
