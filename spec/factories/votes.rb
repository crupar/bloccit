FactoryGirl.define do

  factory :vote do
    value { Faker::Number.between(-5, 5).value }
  end


end
