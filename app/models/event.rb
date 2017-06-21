class Event < ApplicationRecord
  belongs_to :story
  has_many :eventphotos, dependent: :destroy
  accepts_nested_attributes_for :eventphotos

  def self.search(search)
    if search
      where("what ILIKE ?", "%#{search}%")
    end
  end
end
