require 'rails_helper'

RSpec.describe BuyItemShippingAddress, type: :model do
  
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep(1)
      @shipping_address = FactoryBot.build(:buy_item_shipping_address, user_id: user.id, item_id: item.id)
    end
  
  context '購入ができるとき' do
    
    it 'すべての値が正しく入力されていれば購入できる' do
      expect(@shipping_address).to be_valid
    end

    it 'buildingは空でも保存できること' do
      @shipping_address.building = ''
      expect(@shipping_address).to be_valid
    end

    it 'postal_codeが半角数字であれば保存できる' do
      @shipping_address.postal_code = '123-4567'
      expect(@shipping_address).to be_valid
    end



  end

  context '購入ができないとき' do

    it 'postal_codeが空だと購入できない' do
      @shipping_address.postal_code = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角ハイフンを含まないと購入できない' do
      @shipping_address.postal_code = '1234567'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idを選択していないと保存できないこと' do
      @shipping_address.prefecture_id = 1
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'cityが空では保存できないこと' do
      @shipping_address.city = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesが空では保存できないこと' do
      @shipping_address.addresses = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Addresses can't be blank")
    end
    
    it 'phone_numberが空では保存できないこと' do
      @shipping_address.phone_number = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが11桁以上なら保存できない' do
      @shipping_address.phone_number = '1234567891011'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが数字のみでなければ保存できない' do
      @shipping_address.phone_number = '090asdf4576'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'tokenが空では保存できないこと' do
      @shipping_address.token = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では保存できないこと' do
      @shipping_address.user_id = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では保存できないこと' do
      @shipping_address.item_id = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Item can't be blank")
    end
  end
  end
end
