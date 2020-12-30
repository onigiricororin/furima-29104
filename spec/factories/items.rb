FactoryBot.define do
  factory :item do
    association :user
    name             {Faker::Name.name}      
    summary          {Faker::Lorem.sentence}
    price            {1234}   
    category_id      {2}
    condition_id     {2}  
    burden_id        {2}   
    prefecture_id    {2}
    days_to_ship_id  {2}
  end
end
