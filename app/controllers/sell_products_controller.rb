class SellProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :filter_category, :filter_condition]
  before_action :filter_load, only: [:index, :show]
  before_action :find_prod, only: [:show, :add_to_box]
  layout "applicationseller"

  def index
    @categories = Category.all
    if params[:query].present?
      @products = Product.search_by_name_and_description(params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @conditions = Condition.all
    @ratio = Condition.find_by("name=?", "Like New").sell_ratio
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

  def add_to_box
    condition = Condition.find_by("name=?", stock_product_params[:condition])
    userbox = current_user.current_box

    stock_product = StockProduct.new(
      product: @product, color: stock_product_params[:color],
      size: stock_product_params[:size],
      condition: condition, box: userbox
    )

    stock_product.save!
    redirect_to current_box_path(userbox)
  end

  private

  def stock_product_params
    params.require(:stock_product).permit(:color, :size, :condition)
  end

  def filter_load
    @rel_products = Product.all.sample(4)
    @age_groups = ['0 - 3', '3 - 6', '6 - 9', '9 - 12']
    @condition_groups = ['Like New', 'Very Good', 'Good', 'Acceptable']
    @color_groups = ['Red', 'Black', 'Blue', 'Brown']
  end

  def find_prod
    @product = Product.find(params[:id])
  end
end
