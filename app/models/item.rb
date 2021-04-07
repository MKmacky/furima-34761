class Item < ApplicationRecord
  belongs_to :user
  has_one    :buy_item
  has_many_attached :images
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
  has_many :messages
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :images
    validates :item_name
    validates :item_info
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                           format: { with: /\A[0-9]+\z/ }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end

  def self.search(search)
    if search != ''
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
