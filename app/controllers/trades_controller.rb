class TradesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :create]
  before_action :set_item , only: [:index, :create]

  def index
    if user_signed_in? && @item.trade == nil
      @trade = Trade.new
    else
      redirect_to root_path
    end
  end

  def create
    if user_signed_in? && @item.trade == nil
      @trade = Trade.create(trade_params)
      redirect_to root_path
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

