class Park < ApplicationRecord
  has_many :attractions, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :park_opening_hours, dependent: :destroy
  has_many :ticket_types, dependent: :destroy
  # has_many :users, through: :bookings

  #validations
  validates :park_name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :capacity, presence: true
  validates :availability, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["availability", "capacity", "created_at", "description", "id", "park_name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["attractions", "bookings", "park_opening_hours"]
  end
end
