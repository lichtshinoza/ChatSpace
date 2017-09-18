FactoryGirl.define do
  pass = Faker::Internet.password(8)

  factory :user do
    id 1
    name                  Faker::Name.name
    email                 Faker::Internet.email
    # name "testfdsa"
    # email "aaa@gmail.com"
    password              pass
    password_confirmation pass

    # after(:build) do |user|
    #   create(:member, user: user, group: create(:group))
    # end
  end
end
