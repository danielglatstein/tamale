class Api::CartsController < ApiController
  def update
    unless session[:cart_id]
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart = Cart.find(session[:cart_id])
    item = Item.find(params[:item_id])
    cart.add_item(item.id)
    cart.save
    if request.xhr?
      items_hash = cart.item_lines.as_json
      render json: {cart: items_hash}
    end
  end
end
