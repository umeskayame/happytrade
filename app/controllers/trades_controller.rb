class TradesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyer_item = @item
    @buyer = @buyer_item.user
    @user = current_user
    @trade_delivery = TradeDelivery.new(
      user_id: @user.id,
      item_id: @item.id,
      buyer_user_id: @buyer.id,
      buyer_item_id: @buyer_item.id
    )
  end

  def create
    @trade_delivery = TradeDelivery.new(trade_delivery_params)
    if @purchase_delivery.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def trade_delivery_params
    params.require(:trade_delivery).permit(:user_id, :item_id, :buyer_user_id, :buyer_item_id, :postcode, :prefecture_id, :city, :house_number, :building, :phone)
  end
end

