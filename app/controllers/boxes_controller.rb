class BoxesController < ApplicationController
  def index
    @boxes = Box.where("user_id=?", current_user.id)
  end

  def show
    @box = Box.find(params[:id])
    @stockproducts = @box.stock_products
  end
end
