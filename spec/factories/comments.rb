FactoryGirl.define do

  factory :comment do
    user
    post
    body RandomData.random_paragraph
  end


end
