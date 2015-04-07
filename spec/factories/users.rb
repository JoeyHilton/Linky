FactoryGirl.define do
  factory :user do
    name "User"
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    factory :owner do
      name "Link owner"
    end
    factory :boss do
      name "boss"
    end
  end

end
