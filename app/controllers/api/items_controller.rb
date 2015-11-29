class Api::ItemsController < ApiController
  def index
    @items = Item.all
    if request.xhr?
      items_view_hash = @items.map do |item|
        item.as_json
      end
      render json: {items: items_view_hash}
    end
  end

  def show
    @item = Item.find(params[:id])
    if request.xhr?
      item_view_hash = @item.as_json
      render json: {item: item_view_hash}
    end
  end

end
