class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @stoc
  end

  def show
    @product = Product.find(params[:id])
  end
end
