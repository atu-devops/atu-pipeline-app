class ParkOpeningHour < ApplicationRecord
  belongs_to :park

  #validations
  validates :day_of_week, presence: true
  validates :opening_time, presence: true
  validates :closing_time, presence: true
  validates :start_month, presence: true
  validates :end_month, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["closing_time", "created_at", "day_of_week", "end_month", "id", "opening_time", "park_id", "start_month", "updated_at"]
  end
end
