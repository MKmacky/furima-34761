require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end

      it '販売価格が300円から9,999,999円の間なら登録できる' do
        @item.item_price = 4000
        expect(@item).to be_valid
      end

      it '販売価格が半角数字なら登録できる' do
        @item.item_price = 4000
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'item_nameが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_infoが空だと出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it 'category_idが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'sales_status_idが未選択だと出品できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be other than 1')
      end

      it 'shipping_fee_status_idが未選択だと出品できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
      end

      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'scheduled_delivery_idが未選択だと出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
      end

      it 'item_priceが空だと出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_priceが全角数字だと登録できない' do
        @item.item_price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it 'item_priceが300円以下だと登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end

      it 'item_priceが9,999,999円以上だと登録できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end

      it 'item_priceが英数混合だと登録できない' do
        @item.item_price = '40as'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it 'item_priceが半角英数だと登録できない' do
        @item.item_price = 'asdf'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
    end
  end
end
