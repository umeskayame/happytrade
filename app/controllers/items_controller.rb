class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :prefecture_id, :shipping_day_id, :wanted_item).merge(user_id: current_user.id)
  end
end
