class TradesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @trade_delivery = TradeDelivery.new
  end
end
