require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム出品' do
    context 'アイテムの出品ができる場合' do
      it '商品の出品ができるとき' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("アイテム名を入力してください")
      end
      it '商品説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("アイテム説明を入力してください")
      end
      it 'カテゴリで「---」が選択されている場合は登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリを入力してください")
      end
      it 'アイテムの状態で「---」が選択されている場合は登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("アイテムの状態を入力してください")
      end
      it '発送元の地域で「---」が選択されている場合は登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '発送までの日数で「---」が選択されている場合は登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end

