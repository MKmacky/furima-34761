class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @message = Message.new
    @messages = @item.messages
  end

  def edit
    redirect_to root_path if @item.buy_item
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    return nil if params[:keyword] == ''

    item = Item.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: item }
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :category_id, :sales_status_id,
                                 :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
