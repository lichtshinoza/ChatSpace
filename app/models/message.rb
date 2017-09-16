class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :msg_or_image, presence: true

  mount_uploader :image, ImageUploader

  private
    def msg_or_image
      msg.presence or image.presence
    end
end
