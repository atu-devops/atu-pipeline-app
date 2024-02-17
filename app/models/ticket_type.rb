class TicketType < ApplicationRecord
  belongs_to :park

  #validations
  validates :description, :type_name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["description", "type_name", "price", "id", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["park"]
  end

end