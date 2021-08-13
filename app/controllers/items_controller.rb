class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_show,:category_id, :condition_id, :shipping_charge_id, :prefecture_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

end
