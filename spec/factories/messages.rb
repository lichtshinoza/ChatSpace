FactoryGirl.define do
  factory :message do
    msg "hello!"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.png'))
    group
    user
  end
end
