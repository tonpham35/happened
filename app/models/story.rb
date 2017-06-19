class Story < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :story_members
  mount_uploader :photo, ImageUploader
end
