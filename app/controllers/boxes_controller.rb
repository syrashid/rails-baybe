class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :confirm]
  before_action :find_box, only: [:index, :current]
  before_action :find_info, only: [:show, :sum_total, :current]
  layout "applicationseller"

  def index
  end

  def show
    @stockproducts = @box.stock_products
    sum_total
  end

  def confirm
    @box.update_attributes(status: "pending")
    current_user.current_box
    redirect_to boxes_path
  end

  def current
    sum_total
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def sum_total
    @stockproducts = @currentbox.stock_products
    @currentbox.expected_price = @stockproducts.sum do |stockproduct|
      stockproduct.product.price * stockproduct.condition.sell_ratio
    end
    @currentbox.save
  end

  def find_info
    @user = current_user
    @boxes = Box.where("user_id=?", @user.id)
    @currentbox = current_user.current_box
  end

  def find_box
    @boxes = Box.where("user_id=?", current_user.id)
  end
end
