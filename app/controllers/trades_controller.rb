class TradesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      redirect_to root_path
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

