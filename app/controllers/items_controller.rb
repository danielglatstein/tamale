class ItemsController < ApplicationController
  
  private

  def item_params
    params.require(:item).permit(:title, :price)
  end

end
