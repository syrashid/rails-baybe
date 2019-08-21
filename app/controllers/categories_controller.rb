class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @products = Category.find(params[:id]).products
  end
end
