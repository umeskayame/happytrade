class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アイドル' },
    { id: 3, name: 'アニメ' },
    { id: 4, name: 'ゲーム' },
    { id: 5, name: 'その他キャラクター' },
    { id: 6, name: '乗り物系' },
    { id: 7, name: 'ガチャガチャ' },
  ]

  include ActiveHash::Associations
  has_many :items
  end