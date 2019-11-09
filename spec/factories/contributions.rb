FactoryBot.define do
  factory :contribution do
    category { 1 }
    status { 1 }
    context { "MyText" }
    user_id { 1 }
    name { "MyString" }
    email { "MyString" }
    ip_address { "MyString" }
  end
end
