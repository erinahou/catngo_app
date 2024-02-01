class Cat < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :name, presence:  true, length: { maximum: 255 }
  validates :description, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
end
