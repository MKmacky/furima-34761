class Item < ApplicationRecord

  belongs_to :user
  has_one    :buy_item
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery
  
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_price
    validates :user
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end
  
end
