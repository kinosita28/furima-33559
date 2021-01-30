require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "ニックネームが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空だと登録できない" do
     @user.email = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "emailは＠が含まれないと登録できない" do
      @user.email = "@"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "パスワードが空だと登録できない" do
     @user.password = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "パスワードが6文字以上でないと登録できない" do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "パスワードとパスワード（確認用）が一致しないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password:半角英数混合（半角英語のみ）" do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "ファーストネームが空だと登録できない" do
     @user.first_name = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "ラストネームが空だと登録できない" do
     @user.last_name = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "ファーストネーム（カタカナ）が空だと登録できない" do
     @user.k_first = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "K first can't be blank"
    end
     it "ラストネーム（カタカナ）が空だと登録できない" do
     @user.k_last = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "K last can't be blank"
    end
    it "誕生日が空だと登録できない" do
     @user.birthday = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end  
end
