class TradesController < ApplicationController
  def index
    @trade_delivery = TradeDelivery.new
  end
end
