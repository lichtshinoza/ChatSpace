require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with msg, image, group_id, user_id" do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end
  end

  describe '#create' do
    it "is valid without msg" do
      message = build(:message, msg: nil)
      message.valid?
      expect(message).to be_valid
    end
  end

  describe '#create' do
    it "is valid without image" do
      message = build(:message, image: nil)
      message.valid?
      expect(message).to be_valid
    end
  end

  describe '#create' do
    it "is invalid without msg, image" do
      message = build(:message, msg: nil, image: nil)
      message.valid?
      expect(message.errors[:msg_or_image]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end
  end

  describe '#create' do
    it "is invalid without group_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end
  end
end

