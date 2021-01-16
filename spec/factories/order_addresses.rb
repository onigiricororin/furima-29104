FactoryBot.define do
  factory :order_address do
    postal_code     {"123-4567"}
    prefecture_id   {2}
    city            {Faker::Address.city}
    house_number    {Faker::Address.street_address}
    building_name   {Faker::Name.name}
    phone_number    {Faker::PhoneNumber.cell_phone.to_i}
    user_id         {Faker::Number.unique.number(1)}
    item_id         {Faker::Number.unique.number(1)}
    token           {"EjHsthSNWVcq8TatNrZcjCcpZB2De86KBAesy3gnBIKb8xQZMV0Lb+G+/2EsviSlt6YXHMVnGiT1pBbmFP4FNg=="}
  end
end


# :user_id,:item_id,:order_id,:postal_code,
# :prefecture_id,:city,
# :house_number,:building_name,:phone_number