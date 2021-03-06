require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it "全ての項目の入力が存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "passwordとpassword_confirmationが半角英数6文字以上であれば登録できる" do
          @user.password = "00000a"
          @user.password_confirmation = "00000a"
          expect(@user).to be_valid
        end
      end

       context '新規登録できないとき' do
         it "nicknameが空では登録できない" do
           @user.nickname = nil
           @user.valid?
           expect(@user.errors.full_messages).to include("Nickname can't be blank")
         end
         it "emailが空では登録できない" do
           @user.email = nil
           @user.valid?
           expect(@user.errors.full_messages).to include("Email can't be blank")
         end
         it "passwordが空では登録できない" do
           @user.password = nil
           @user.valid?
           expect(@user.errors.full_messages).to include("Password can't be blank")
         end
         it "passwordが存在してもpassword_confirmationが空では登録できない" do
           @user.password_confirmation = nil
           @user.valid?
           expect(@user.errors.full_messages).to include("Password confirmation can't be blank", "Password confirmation is invalid")
         end
         it "passwordとpassword_confirmationが不一致では登録できない" do
           @user.password = "00000a"
           @user.password_confirmation = "00000b"
           @user.valid?
           expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
         end
         it "重複したemailが存在する場合は登録できない" do
           @user.save
           another_user = FactoryBot.build(:user)
           another_user.email = @user.email
           another_user.valid?
           expect(another_user.errors.full_messages).to include("Email has already been taken")
         end
         it "mailに＠が含まれていなければ登録できない" do
           @user.email = "aaaa.com"
           @user.valid?
           expect(@user.errors.full_messages).to include("Email is invalid")
         end
         it "passwordが5文字以下では登録できない" do
           @user.password = "00000"
           @user.password_confirmation = "00000"
           @user.valid?
           expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
         end
         it "passwordは半角英語のみでは登録できない" do
           @user.password = 'aaaaaaa'
           @user.valid?
           expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
         end
         it "passwordが半角数字のみでは登録できない" do
           @user.password = '123456'
           @user.valid?
           expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
         end
         it "passwordが全角では登録できない" do
           @user.password = '１２３４５６'
           @user.valid?
           expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
         end
         it "profileが空では登録できない" do
           @user.profile = nil
           @user.valid?
           expect(@user.errors.full_messages).to include("Profile can't be blank")
         end
       end
    end
end
