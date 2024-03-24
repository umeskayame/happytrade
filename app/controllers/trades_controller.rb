class TradesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :create, :show]
  before_action :set_item , only: [:index, :create]

  def index
    if user_signed_in? && @item.trade == nil
      @trade = Trade.new
    else
      redirect_to root_path
    end
  end

  def create
    @trade = Trade.new(trade_params)
    if user_signed_in? && @item.trade == nil
      @trade.save
      redirect_to "/items/#{@item.id}/trades/#{@trade.id}"
    else
      redirect_to root_path
    end
  end

  def show
    @trade = Trade.find(params[:id])
    if current_user.id == @trade.user_id
      @item = Item.find(params[:item_id])
    else
      redirect_to root_path
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end