class SellProductsController < ApplicationController
  before_action :filter_load, only: [ :index, :show ]
  layout "applicationseller"

  def index
    @categories = Category.all
    # Do I need to do some protection
    if params[:query].present?
      @products = Product.search_by_name_and_description(params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @conditions = Condition.all
    @ratio = Condition.find_by("name=?", "Like New").sell_ratio
    @product = Product.find(params[:id])
  end

  def current
  end

  def filter_category
    if params[:query].present?
      @searchprods = Product.search_by_name_and_description(params[:query]).includes(:category)
      @products = @searchprods.select { |prod| prod.category.description == params[:cat] }
    else
      @products = Category.find_by(description: params[:cat]).products
    end
    @cat = params[:cat]
    respond_to do |format|
      format.js { render :sellfiltercategory }
    end
  end

  def addToBox
    stock_product = StockProduct.new

    product = Product.find(params[:id])
    stock_product.product = product

    condition = Condition.find_by("name=?", stock_product_params[:condition])
    stock_product.condition = condition

    # FIND CURRENT USER BOX
    userbox = current_user.current_box
    stock_product.box = userbox

    stock_product.color = stock_product_params[:color]

    stock_product.size = stock_product_params[:size]

    stock_product.save!

    redirect_to current_box_path(userbox)
  end

  def findStockProduct
      # CREATE A NEW STOCK PRODUCT WITH GIVEN PARAMS
  end

  private

  def stock_product_params
    params.require(:stock_product).permit(:color, :size, :condition)
  end

  def filter_load
    @rel_products = Product.all.sample(4)
    @age_groups = ['0 - 3', '3 - 6', '6 - 9', '9 - 12']
    @condition_groups = ['Like New', 'Very Good', 'Good', 'Acceptable']
    @color_groups = ['Red', 'Black', 'Blue', 'Braun']
  end
end
