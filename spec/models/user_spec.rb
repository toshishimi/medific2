require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "すべての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "nameが半角では登録できない" do
        @user.name = "ﾄﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it "name_kanaが空では登録できない" do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end

      it "name_kanaがひらがなでは登録できない" do
        @user.name_kana = 'とと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana is invalid")
      end

      it "name_kanaが漢字では登録できない" do
        @user.name_kana = '都都'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana is invalid")
      end
      
      it "name_kanaが半角では登録できない" do
        @user.name_kana = "ﾄﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana is invalid")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

     it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
     end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下だと登録できない" do
        @user.password = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "半角数字のみでは登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it "半角英字のみでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "全角文字を含むパスワードでは登録できない" do
        @user.password = '111aa１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end      
    end
  end
end

