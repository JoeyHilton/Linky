FactoryGirl.define do
  factory :link do
      url "http://www.google.com"
      title "Test"
      category "cute"
      association :user, factory: :user
    factory :first_link do
      votes 200
    end
  end

end
