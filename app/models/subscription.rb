class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true

  belongs_to :customer
  has_many :tea_subscriptions
end
