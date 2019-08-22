class StockProductsController < ApplicationController
  def destroy
    @stockproduct = StockProduct.find(params[:id])
    parent = params[:parent]
    if parent == "box"
      @stockproduct.update_attributes(box_id: nil)
    elsif parent == "cart"
      @stockproduct.update_attributes(cart_id: nil)
    end
    redirect_back(fallback_location: root_path)
  end
end
