FactoryBot.define do
  factory :buy_item do
    association :user
    association :item
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
