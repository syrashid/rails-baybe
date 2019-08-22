class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :confirm]

  def index
    @boxes = Box.where("user_id=?", current_user.id)
  end

  def show
    @stockproducts = @box.stock_products
  end

  def confirm
    @box.update_attributes(status: "confirmed")
    redirect_to boxes_path
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end
end
