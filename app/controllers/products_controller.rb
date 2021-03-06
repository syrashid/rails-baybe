class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :filter_category, :filter_condition]
  before_action :find_prod, only: [:add_to_cart, :show, :edit, :update]
  before_action :load_ratios, only: [:index, :filter_category, :filter_condition]

  def index
    @categories = Category.all
    @condition_groups = ['Like New', 'Very Good', 'Good', 'Acceptable']
    if params[:query].present?
      @products = Product.search_by_name_and_description(params[:query])
    elsif params[:cat].present?
      @products = Category.find_by(description: params[:cat]).products
    else
      @products = Product.all
    end
    @cat = params[:cat]
    session[:category] = params[:cat]
  end

  def show
    @conditions = Condition.all
    @ratio = Condition.find_by("name=?", "Like New").buy_ratio

    @age_groups = ['0 - 3', '3 - 6', '6 - 9', '9 - 12']
    @color_groups = ['Red', 'Black', 'Blue', 'Brown']
    @condition_groups = @product.stock_products.map do |stock_product|
      stock_product.condition.name
    end.uniq

    @rel_products = Product.all.sample(4)
  end

  def filter_condition
    if params[:query].present?
      @searchprods = Product.search_by_name_and_description(params[:query]).includes(:stock_products)
      @products = @searchprods.select do |product|
        product.stock_products.find { |stock_product| stock_product.condition.name == params[:con] }
      end
    elsif session[:category].present?
      @categoryproducts = Category.find_by(description: session[:category]).products
      @products = @categoryproducts.select do |product|
        product.stock_products.find { |stock_product| stock_product.condition.name == params[:con] }
      end
    else
      @products = Product.all.select do |product|
        product.stock_products.find { |stock_product| stock_product.condition.name == params[:con] }
      end
    end
    @con = params[:con]
    respond_to do |format|
      format.js { render :filtercondition }
    end
  end

  def create
    redirect_to root_path
  end

  def update
    @product.update_attributes(product_params) ? (redirect_to review_products_path) : (render :edit)
  end

  def review_products
    @products = Product.where(public: false)
  end

  def add_to_cart
    condition = Condition.find_by("name=?", stock_product_params[:condition])
    usercart = current_user.current_cart

    stock_product = StockProduct.new(
      product: @product,
      color: stock_product_params[:color],
      size: stock_product_params[:size],
      condition: condition, cart: usercart
    )

    stock_product.save
    redirect_to current_cart_path(usercart)
  end

  private

  def stock_product_params
    params.require(:stock_product).permit(:color, :size, :condition)
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :public, :gender, :age_min, :photo, :age_max, :brand, :category_id)
  end

  def find_prod
    @product = Product.find(params[:id])
  end

  def load_ratios
    @max_buy_ratio = Condition.find_by("name=?", "Like New").buy_ratio
    @min_buy_ratio = Condition.find_by("name=?", "Acceptable").buy_ratio
  end
end
