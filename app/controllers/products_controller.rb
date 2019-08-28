class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :prod_vars, only: [:index, :show]
  before_action :find_prod, only: [:addToCart, :show, :edit, :update]


  def index
    @max_buy_ratio = Condition.find_by("name=?", "Like New").buy_ratio
    @min_buy_ratio = Condition.find_by("name=?", "Acceptable").buy_ratio
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

    @user = current_user
    @carts = Cart.where("user_id=?", @user.id)
    @currentcart = @carts.find_by(paid: "pending")
  end

  def filter_transport
    @max_buy_ratio = Condition.find_by("name=?", "Like New").buy_ratio
    @min_buy_ratio = Condition.find_by("name=?", "Acceptable").buy_ratio
    if params[:query].present?
      @searchprods = Product.search_by_name_and_description(params[:query]).includes(:category)
    end
    @products = @searchprods.select { |prod| prod.category.description == "Transport" }
    respond_to do |format|
      format.js { render :filtertransport}
    end
  end

  def filter_bedroom
  end

  def filter_clothes
  end

  def filter_toys
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to review_products_path
    else
      render :edit
    end
  end
  def review_products
    @products = Product.where(public: false)
  end

  def addToCart
    stock_product = StockProduct.new
    stock_product.product = @product

    condition = Condition.find_by("name=?", stock_product_params[:condition])
    stock_product.condition = condition

    usercart = current_user.current_cart
    stock_product.cart = usercart

    stock_product.color = stock_product_params[:color]
    stock_product.size = stock_product_params[:size]
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
end
