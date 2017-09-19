FactoryGirl.define do
  factory :message do
    msg Faker::Lorem.sentence
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.png'))
    group
    user
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(1.days.ago, Time.now, :all) }

  end
end
