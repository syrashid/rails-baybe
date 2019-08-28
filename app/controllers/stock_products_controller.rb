class StockProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def destroy
    @stockproduct = StockProduct.find(params[:id])
    parent = params[:parent]
    if parent == "box"
      @stockproduct.update_attributes(box_id: nil)
    elsif parent == "cart"
      @stockproduct.update_attributes(cart_id: nil)
    end
    @stockproduct.destroy
    respond_to do |format|
      format.js {
            render :template => 'carts/destroy.js.erb', :layout => false
        }
      format.html{ redirect_to root_path }
    end
    #redirect_back(fallback_location: root_path)
  end
end
