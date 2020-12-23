FactoryBot.define do
  factory :user do
    nickname        {Faker::Name.last_name}
    last_name       {"鈴木"}
    first_name      {"太郎"}
    last_read_name  {"スズキ"}
    first_read_name {"タロウ"}
    email           {Faker::Internet.free_email}
    password        {"1234qwer"}
    password_confirmation  { password }
    birthday        {Date.new(2000, 11, 12)}
  end
end