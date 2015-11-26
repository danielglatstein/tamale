class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
  end

  def checkout
    cart = Cart.find(session[:cart_id])
    order = Order.create_from_cart(cart)
    order.change_order_status
    order.change_inventory
    session.clear
    redirect_to "/"
  end
end
