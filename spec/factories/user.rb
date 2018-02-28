FactoryBot.define do
  factory :user, class: User  do
    name "test user"
    email "test@example.com"
    password "testtest"
    password_confirmation "testtest"
  end
  factory :admin, class: User  do
    name "admin user"
    email "admin@example.com"
    password "testtest"
    password_confirmation "testtest"
    admin true
  end
end
