FactoryGirl.define do
  factory :user do
    rank "10k"
    review_period 10
    password "password"

    sequence :email do |n|
        "test_#{n}@example.com"
    end

    sequence :display_name do |n|
        "test_#{n}"
    end

    after(:build) {|u| u.password_confirmation = u.password}
  end
end
