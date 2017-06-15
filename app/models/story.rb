class Story < ApplicationRecord
  belongs_to :user
  has_many :events

  mount_uploader :photo, ImageUploader
end
