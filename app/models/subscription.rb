class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true

  enum status: { active: 0, cancelled: 1 }

  belongs_to :customer
  has_many :tea_subscriptions
end
