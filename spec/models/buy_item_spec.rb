require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  before do
    @buy_tem = FactoryBot.build(:buy_item)
  end

  it 'ユーザー情報と商品情報とtokunがあれば保存できる' do
    expect(@order).to be_valid
  end

  it 'ユーザー情報が空では保存できない' do
    @buy_item.user = ''
    @buy_item.valid?
    expect(@buy_item.errors.full_messages).to include("User can't be blank")
  end

  it '商品情報が空では保存できない' do
    @buy_item.item = ''
    @buy_item.valid?
    expect(@buy_item.errors.full_messages).to include("Item can't be blank")
  end

  it 'tokunが空では保存できない' do
    @buy_item.tokun = ''
    @buy_item.valid?
    expect(@buy_item.errors.full_messages).to include("Tokun can't be blank")
  end
end
