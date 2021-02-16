require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buy = FactoryBot.build(:buy, item_id: @item.id, user_id: @user.id)
    sleep(1)
  end 

  describe '商品購入' do
    context '商品購入に異常がある時' do
      it "user_idがないと購入出来ない" do
        @buy.user_id = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("ユーザーを入力してください")
      end  
      it "item_idがないと購入出来ない" do
        @buy.item_id = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("アイテムを入力してください")
      end
      it "郵便番号が空では購入出来ない" do
        @buy.postal_code = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("郵便番号を入力してください")
      end  
      it "郵便番号に-がないと購入出来ない" do
        @buy.postal_code = "1111111"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("郵便番号は不正な値です")
      end  
      it "都道府県が---では購入出来ない" do
        @buy.prefecture_id = 1
        @buy.valid?
        expect(@buy.errors.full_messages).to include("都道府県を選んでください")
      end  
      it "市区町村が空では購入出来ない" do
        @buy.municipality = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("市区町村を入力してください")
      end  
      it "番地が空だと購入出来ない" do
        @buy.address = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("番地を入力してください")
      end  
      it "電話番号が空では購入出来ない" do
        @buy.phone_number = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("電話番号を入力してください")
      end 
      it "電話番号が12ケタ以上では購入出来ない" do
        @buy.phone_number = "111111111111"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("電話番号は不正な値です")
      end  
      it "電話番号が数字のみでないと登録出来ないこと" do
        @buy.phone_number = "111aaa"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "全角数字だと登録出来ないこと" do
        @buy.phone_number = "１１１"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("電話番号は不正な値です")
      end    
      it "tokenが空だと登録出来ない" do
        @buy.token = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("クレジットカード情報を入力してください")
      end  
    end  
  
    context "正常に商品が購入出来る時" do
      it "商品購入が正常にできる" do
        expect(@buy).to be_valid
      end
      it "建物名が空でも購入出来る" do
        @buy.building = ""
        expect(@buy).to be_valid
      end   
    end  
  end  
end