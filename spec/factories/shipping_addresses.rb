FactoryBot.define do
  factory :shipping_address do
    postal_code   {123-1234}
    prefecture_id {6}
    city          {city1}
    addresses     {234}
    building      {23}
    phone_number  {09076543212}
    association :user
    association :item
    association :buy_item
  end
end
