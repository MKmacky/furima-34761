FactoryBot.define do
  factory :buy_item do
    association :user
    association :item
   
  end
end
