class ProductsController < ApplicationController
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
    @product = Product.find(params[:id])
    @rel_products = Product.all.sample(4)
    @age_groups = ['0 - 3', '3 - 6', '6 - 9', '9 - 12']
    @condition_groups = ['Like New', 'Very Good', 'Good', 'Acceptable']
    @color_groups = ['Red', 'Black', 'Blue', 'Braun']
    @user = current_user
    @carts = Cart.where("user_id=?", @user.id)
    @currentcart = @carts.find_by(paid: "Pending")
  end

  def addToCart
    stock_product = StockProduct.new

    product = Product.find(params[:id])
    stock_product.product = product

    condition = Condition.find_by("name=?", stock_product_params[:condition])
    stock_product.condition = condition

    usercart = current_user.carts.find_by(paid: "Pending")
    stock_product.cart = usercart

    stock_product.color = stock_product_params[:color]
    stock_product.size = stock_product_params[:size]
    stock_product.save

    redirect_to current_cart_path(usercart)
  end

  def stock_product_params
    params.require(:stock_product).permit(:color, :size, :condition)
  end
end
