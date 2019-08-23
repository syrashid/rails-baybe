class SellProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @rel_products = Product.all.sample(4)
    @age_groups = ['0 - 3', '3 - 6', '6 - 9', '9 - 12']
    @condition_groups = ['Like New', 'Very Good', 'Good', 'Acceptable']
    @color_groups = ['Red', 'Black', 'Blue', 'Braun']
  end

  def current

  end


  def addToBox
    # @stock_product = findStockProduct(params)
    stock_product = StockProduct.new

    product = Product.find(params[:id])
    stock_product.product = product

    condition = Condition.find_by("name=?", stock_product_params[:condition])
    stock_product.condition = condition

    # FIND CURRENT USER BOX
    userbox = current_user.boxes.find_by("status=?", "Pending")
    stock_product.box = userbox

    stock_product.color = stock_product_params[:color]

    stock_product.size = stock_product_params[:size]

    stock_product.save!
    raise
    redirect_to current_box_path(userbox)
  end

  def findStockProduct
      # CREATE A NEW STOCK PRODUCT WITH GIVEN PARAMS
  end

  private

  def stock_product_params
    params.require(:stock_product).permit(:color, :size, :condition)
  end
end
