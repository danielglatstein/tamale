class ItemLinesController < ApplicationController

  def create
    unless session[:cart_id]
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart = Cart.find(session[:cart_id])
    item = Item.find(params[:item_id])
    cart.add_item(item.id)
    cart.save
    redirect_to "/carts/#{cart.id}"
  end

end
