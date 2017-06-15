class Event < ApplicationRecord
  belongs_to :story

  mount_uploader :photo, ImageUploader
end
