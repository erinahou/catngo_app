class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cat

  enum status:  [:pending, :accepted, :declined]

end
