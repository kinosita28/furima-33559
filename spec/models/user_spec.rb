require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザー新規登録に異常がある時" do
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
        @user.email = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "emailが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
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
      it "ユーザー本名は全角でないと保存ができない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
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
      it "ユーザー本名のフリガナは、名字と名前でそれぞれ入力がないと登録できない" do
        @user.k_first = "テスト"
        @user.k_last = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "K last can't be blank", "K last is invalid"
      end
      it "ユーザー本名のフリガナは、全角でないと登録できない" do
        @user.k_first = "aaa"
        @user.k_last = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "K first is invalid", "K last is invalid"
      end
      it "誕生日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end  

    context "正常にユーザー登録ができる" do
     it "新規登録ができる時" do
      expect(@user).to be_valid
     end 
    end 
  end
end
