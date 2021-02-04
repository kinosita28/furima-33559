require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品が出来ない時' do
      it '商品名が空では登録出来ない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が空では登録出来ない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報が空では登録出来ない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'カテゴリーの情報が---では登録出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態の情報が空では登録出来ない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end

      it '商品の状態の情報が---では登録出来ない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end

      it '配送料の負担の情報が空では登録出来ない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee is not a number')
      end

      it '配送料の情報が---では登録出来ない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 1')
      end

      it '発送元の地域の情報が空では登録出来ない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end

      it '発送元の地域位の情報が---では登録出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '発送までの日数の情報が空では登録出来ない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Day is not a number')
      end

      it '発送までの日数の情報が---では登録出来ない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end

      it '価格の情報が空では登録出来ない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end

      it '価格は半角数字でないと登録出来ない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank", 'Selling price is not a number')
      end

      it '価格が¥300以下では登録出来ない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end

      it '価格が¥9,999,999より大きいと登録出来ない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end

      it '画像が空では登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
    context '商品出品が出来る時' do
      it '商品出品が正常に出来る' do
        expect(@item).to be_valid
      end
    end
  end
end
