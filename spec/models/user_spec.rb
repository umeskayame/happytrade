require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do 
      it 'nicknameとemail、passwordとpassword_confirmation、氏名（全角とカナ）、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end  
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに@がなければ登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'a111'
        @user.password_confirmation = 'a111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが無効です。 半角英数字混合で入力してください")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが無効です。 半角英数字混合で入力してください")
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = 'あ11111'
        @user.password_confirmation = 'あ11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが無効です。 半角英数字混合で入力してください")
      end
      it 'パスワードとパスワード（確認）が不一致の場合登録できない' do
        @user.password = 'a11111'
        @user.password_confirmation = 'a22222'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名を入力してください", "氏名が無効です。全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it 'firsr_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前が無効です。全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名が無効です。全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前が無効です。全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
        ("氏名（カナ）を入力してください" )
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
        ("名前（カナ）を入力してください" )
      end
      it 'kana_last_nameが全角（カタカナ）以外だと登録できない' do
        @user.kana_last_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名（カナ）が無効です。全角（カタカナ）で入力してください")
      end
      it 'kana_first_nameが全角（カタカナ）以外だと登録できない' do
        @user.kana_first_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）が無効です。全角（カタカナ）で入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end