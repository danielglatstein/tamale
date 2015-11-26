class StoreController < ApplicationController
  def index
    @items = Item.all
    if !!session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    end
  end
end
