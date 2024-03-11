require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do 
      it 'nicknameとemail、passwordとpassword_confirmation、氏名（全角とカナ）、生年月日、住所が存在すれば登録できる' do
        expect(@user).to be_valid
        sleep 1
      end
      it '建物名は空でも保存できること' do
        @user.building =''
        expect(@user).to be_valid
        sleep 1
      end
    end  
    
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        sleep 1
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
        sleep 1
      end
      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        sleep 1
      end
      it 'emailに@がなければ登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
        sleep 1
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
        sleep 1
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'a111'
        @user.password_confirmation = 'a111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        sleep 1
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが無効です。 半角英数字混合で入力してください")
        sleep 1
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが無効です。 半角英数字混合で入力してください")
        sleep 1
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = 'あ11111'
        @user.password_confirmation = 'あ11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが無効です。 半角英数字混合で入力してください")
        sleep 1
      end
      it 'パスワードとパスワード（確認）が不一致の場合登録できない' do
        @user.password = 'a11111'
        @user.password_confirmation = 'a22222'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        sleep 1
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名を入力してください", "氏名が無効です。全角（漢字・ひらがな・カタカナ）で入力してください")
        sleep 1
      end
      it 'firsr_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前が無効です。全角（漢字・ひらがな・カタカナ）で入力してください")
        sleep 1
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名が無効です。全角（漢字・ひらがな・カタカナ）で入力してください")
        sleep 1
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前が無効です。全角（漢字・ひらがな・カタカナ）で入力してください")
        sleep 1
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
        ("氏名（カナ）を入力してください" )
        sleep 1
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
        ("名前（カナ）を入力してください" )
        sleep 1
      end
      it 'kana_last_nameが全角（カタカナ）以外だと登録できない' do
        @user.kana_last_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名（カナ）が無効です。全角（カタカナ）で入力してください")
        sleep 1
      end
      it 'kana_first_nameが全角（カタカナ）以外だと登録できない' do
        @user.kana_first_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）が無効です。全角（カタカナ）で入力してください")
        sleep 1
      end
      it '郵便番号が空だと保存できない' do
        @user.postcode = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("郵便番号を入力してください")
        sleep 1
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できない' do
        @user.postcode = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("郵便番号が無効です。以下のように入力してください。 (e.g. 123-4567)")
        sleep 1
      end
      it '都道府県を選択していないと保存できない' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("都道府県を入力してください")
        sleep 1
      end
      it '市区町村が空だと保存できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("市区町村を入力してください")
        sleep 1
      end
      it '番地が空だと保存できない' do
        @user.house_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("番地を入力してください")
        sleep 1
      end
      it '電話番号が空だと保存できない' do
        @user.phone = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号を入力してください")
        sleep 1
      end
      it '電話番号にハイフンを含むと保存できない' do
        @user.phone = '090-1234-5678'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は不正な値です")
        sleep 1
      end
      it '電話番号が9桁以下の場合登録できない' do
        @user.phone = '09012345'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は不正な値です")
        sleep 1
      end
      it '電話番号が12桁以上の場合登録できない' do
        @user.phone = '0901234567890123'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号は不正な値です")
        sleep 1
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
        sleep 1
      end
    end
  end
end