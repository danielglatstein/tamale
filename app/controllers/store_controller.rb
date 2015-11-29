class StoreController < ApplicationController
  def show
    if !!session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    end
    @items = Item.all
    if request.xhr?
      items_view_hash = @items.map do |item|
        item.as_json
      end
      render json: {items: items_view_hash}
    end
  end

end
