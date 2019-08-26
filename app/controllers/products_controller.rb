class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :prod_vars, only: [:index, :show]
  before_action :find_prod, only: [:addToCart, :show]


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
    @rel_products = Product.all.sample(4)

    @user = current_user
    @carts = Cart.where("user_id=?", @user.id)
    @currentcart = @carts.find_by(paid: "pending")
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
    params.require(:product).permit(:name, :description, :price, :gender, :age_min, :photo, :age_max, :brand, :category_id)
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
