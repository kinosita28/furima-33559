require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buy = FactoryBot.build(:buy, item_id: @item, user_id: @user)
    sleep(1)
  end 

  describe '商品購入' do
    context '商品購入に異常がある時' do
      it "user_idがないと購入出来ない" do
        @buy.user_id = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end  
      it "item_idがないと購入出来ない" do
        @buy.item_id = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end
      it "郵便番号が空では購入出来ない" do
        @buy.postal_code = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end  
      it "郵便番号に-がないと購入出来ない" do
        @buy.postal_code = "1111111"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code is invalid")
      end  
      it "都道府県が---では購入出来ない" do
        @buy.prefecture_id = 1
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture must be other than 1")
      end  
      it "市区町村が空では購入出来ない" do
        @buy.municipality = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Municipality can't be blank", "Municipality is invalid")
      end  
      it "市区町村が全角でないと購入出来ない" do
        @buy.municipality = "aaa"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Municipality is invalid")
      end  
      it "番地が空だと購入出来ない" do
        @buy.address = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address can't be blank")
      end  
      it "電話番号が空では購入出来ない" do
        @buy.phone_number = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end 
      it "電話番号が12ケタ以上では購入出来ない" do
        @buy.phone_number = "111111111111"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number is invalid")
      end  
      it "電話番号が数字のみでないと登録出来ないこと" do
        @buy.phone_number = "111aaa"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number is invalid")
      end
      it "全角数字だと登録出来ないこと" do
        @buy.phone_number = "１１１"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number is invalid")
      end    
      it "tokenが空だと登録出来ない" do
        @buy.token = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
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
      it "販売価格とtokenがあれば保存出来る" do
        expect(@buy).to be_valid
      end   
    end  
  end  
end