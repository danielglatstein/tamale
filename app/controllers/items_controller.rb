class ItemsController < ApplicationController
  
  def show
    @item = Item.find_by(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :price)
  end

end
