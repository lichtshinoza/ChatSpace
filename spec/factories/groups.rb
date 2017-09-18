FactoryGirl.define do
  factory :group do
    id 1
    name "aaa"
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(1.days.ago, Time.now, :all) }
  end
end
