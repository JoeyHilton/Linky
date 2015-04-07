FactoryGirl.define do
  factory :link do
      url "http://www.google.com"
      title "Test"
      category "cute"
      association :user, factory: :owner
    factory :first_link do
      votes 200
    end
    factory :boss_link do
      association :user, factory: :boss
    end
  end

end
