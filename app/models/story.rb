class Story < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy

  mount_uploader :photo, ImageUploader
end
