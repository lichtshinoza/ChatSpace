FactoryGirl.define do
  factory :message do
    msg Faker::Lorem.sentence
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.png'))
    group
    user
  end
end
