class StockProductsController < ApplicationController
  def destroy
    @stockproduct = StockProduct.find(params[:id])
    @parent = params[:parent]

    update_parent

    respond_to do |format|
      format.js
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  def update_parent
    if @parent == "box"
      @stockproduct.update_attributes(box_id: nil)
    elsif @parent == "cart"
      @stockproduct.update_attributes(cart_id: nil)
    end
  end
end
