class Event < ApplicationRecord
  belongs_to :story
  has_many :eventphotos, dependent: :destroy
  accepts_nested_attributes_for :eventphotos
end
