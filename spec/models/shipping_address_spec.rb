require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  
  describe '商品購入機能' do
    before do
      @shipping_address = FactoryBot.build(:shipping_address)
    end
  end
  
  context '購入ができるとき' do
    
    it 'すべての値が正しく入力されていれば購入できる' do
      expect(@donation_address).to be_valid
    end

    it 'buildingは空でも保存できること' do
      @shipping_address.building = ''
      expect(@donation_address).to be_valid
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

    it 'prefectureを選択していないと保存できないこと' do
      @shipping_address.prefecture = 0
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
    
  end
  
end
