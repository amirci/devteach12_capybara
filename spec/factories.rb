FactoryGirl.define do
  factory :project do
    name        { Faker::Company.name }
    description { Faker::Company.bs   }
    active      false
  end

end