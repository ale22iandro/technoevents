class Event < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true, length: {maximum: 40}
  validates :event_type, presence: true
  validates :datetime, presence: true
end
