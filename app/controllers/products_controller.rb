class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :prod_vars, only: [:index, :show]
  before_action :find_prod, only: [:add_to_cart, :show, :edit, :update]
  before_action :load_ratios, only: [:index, :filter_category, :filter_condition]

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
    @ratio = Condition.find_by("name=?", "Like New").buy_ratio

    @rel_products = Product.all.sample(4)
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
      format.js { render :filtercategory }
    end
  end

  def filter_condition
    if params[:query].present?
      @searchprods = Product.search_by_name_and_description(params[:query]).includes(:stock_products)
      @products = @searchprods.select do |product|
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

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save ? (redirect_to root_path) : (render :new)
  end

  def edit
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

  def prod_vars
    @age_groups = ['0 - 3', '3 - 6', '6 - 9', '9 - 12']
    @condition_groups = ['Like New', 'Very Good', 'Good', 'Acceptable']
    @color_groups = ['Red', 'Black', 'Blue', 'Braun']
  end

  def find_prod
    @product = Product.find(params[:id])
  end

  def load_ratios
    @max_buy_ratio = Condition.find_by("name=?", "Like New").buy_ratio
    @min_buy_ratio = Condition.find_by("name=?", "Acceptable").buy_ratio
  end
end
