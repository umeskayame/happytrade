class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :comments
  has_many :trades

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX , message: "が無効です。 半角英数字混合で入力してください"}
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name, format: {
    with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message:"が無効です。全角（漢字・ひらがな・カタカナ）で入力してください"
  },on: :create
  validates :first_name, format: {
    with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message:"が無効です。全角（漢字・ひらがな・カタカナ）で入力してください"
  },on: :create
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, format: {
    with: /\A[ァ-ヶー－]+\z/, message:"が無効です。全角（カタカナ）で入力してください"
  },on: :create
  validates :kana_first_name, format: {
    with: /\A[ァ-ヶー－]+\z/, message:"が無効です。全角（カタカナ）で入力してください"
  },on: :create
  validates :postcode, presence: true
  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "が無効です。以下のように入力してください。 (e.g. 123-4567)" }
  validates :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone, presence: true
  validates :phone, format: { with: /\A\d{10,11}\z/ }
  validates :birthday, presence: {message:"を入力してください"}
end
