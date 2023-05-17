class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one_attached :image
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  validates :title, presence: true, length: {maximum: 40}
  validates :event_type, presence: true
  validates :datetime, presence: true

  def not_expired?
    Time.now < self.datetime
  end
end
