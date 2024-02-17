class Attraction < ApplicationRecord
  belongs_to :park

  #validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :availability, presence: true
  validates :age_limit, presence: true
  validates :height_limit, presence: true
  validates :park_id, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["age_limit", "availability", "created_at", "description", "height_limit", "id", "name", "park_id", "updated_at"]
  end
end
