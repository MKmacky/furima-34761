class BuyItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_id, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]

  def index
    @buy_item_shipping_address = BuyItemShippingAddress.new
  end

  def create
    @buy_item_shipping_address = BuyItemShippingAddress.new(buy_item_params)
    if @buy_item_shipping_address.valid?
      pay_item
      @buy_item_shipping_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_item_params
    params.require(:buy_item_shipping_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: buy_item_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_root
    redirect_to root_path if current_user.id == @item.user_id || @item.buy_item
  end
end
