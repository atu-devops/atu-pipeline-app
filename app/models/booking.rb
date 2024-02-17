class Booking < ApplicationRecord
  belongs_to :park
  belongs_to :ticket_type
  belongs_to :user

  #validations
  validates :booking_datetime, presence: true
  # validates :booking_status_id, presence: true
  validates :user_id, presence: true
  validates :park_id, presence: true
  validates :ticket_type_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["booking_datetime", "booking_status_id", "created_at", "id", "park_id", "updated_at", "user_id", "ticket_type_id"]
  end
end
