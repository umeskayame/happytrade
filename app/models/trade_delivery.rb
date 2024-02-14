class TradeDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :buyer_user_id, :buyer_item_id, :trade_id, :postcode, :prefecture, :city, :house_number, :building, :phone
end