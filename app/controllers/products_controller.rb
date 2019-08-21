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
  end
end
