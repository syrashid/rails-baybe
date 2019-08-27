module ApplicationHelper
  def theme
    if params[:controller] == "sell_products" || params[:controller] == "boxes"
      return "selling"
    else
      return ""
    end
  end
end
