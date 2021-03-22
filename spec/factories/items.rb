FactoryBot.define do
  factory :item do
    item_name              { 'name' }
    item_info              { '説明文' }
    item_price             { 4000 }
    category_id            { 2 }
    sales_status_id        { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    scheduled_delivery_id  { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
