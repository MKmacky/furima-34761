FactoryBot.define do
  factory :buy_item_shipping_address do
    postal_code   {'123-1234'}
    prefecture_id {6}
    city          {'city1'}
    addresses     {'234'}
    building      {'23'}
    phone_number  {'09076543212'}
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
