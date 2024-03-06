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

  def save
    # 交換情報を保存し、変数tradeに代入する
    trade = Trade.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # trade_idには、変数tradeのidと指定する
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone: phone, trade_id: trade.id)
  end
end