class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping_day
  
  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :status_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :wanted_item, presence: true

end
