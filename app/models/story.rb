class Story < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :story_members
  mount_uploader :photo, ImageUploader

  def self.search(search)
    if search
      where("title ILIKE ?", "%#{search}%")
    end
  end
end
