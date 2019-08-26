class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :confirm]
  layout "applicationseller"

  def index
    @boxes = Box.where("user_id=?", current_user.id)
  end

  def show
    @stockproducts = @box.stock_products
  end

  def confirm
    @box.update_attributes(status: "pending")
    current_user.current_box
    redirect_to boxes_path
  end

  def current
    @boxes = Box.where("user_id=?", current_user.id)
    @currentbox = current_user.current_box
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end
end
