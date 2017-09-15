class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :msg, presence: true
end
