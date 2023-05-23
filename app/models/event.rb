class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one_attached :image
  has_many :subscriptions, dependent: :delete_all
  has_many :subscribers, through: :subscriptions, source: :user
  validates :title, presence: true, length: {maximum: 40}
  validates :event_type, presence: true
  validates :date, presence: true
  validates :time, presence: true

  def datetime
    DateTime.new(self.date.year, self.date.month, self.date.day, self.time.hour, self.time.min, self.time.sec, self.time.zone)
  end

  def not_expired?
    Time.now < self.datetime
  end
end
