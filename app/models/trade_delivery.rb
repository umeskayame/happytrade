class TradeDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :buyer_user_id, :buyer_item_id, :trade_id, :postcode, :prefecture, :city, :house_number, :building, :phone

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :buyer_user_id
    validates :buyer_item_id
  end
end