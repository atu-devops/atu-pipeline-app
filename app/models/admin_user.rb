class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  #validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }


  # Define your associations here if needed

  # If you want to allow searching on specific attributes, define ransackable_attributes method
  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at] # Include attributes that you want to allow searching
  end

  # If you have associations and want to allow searching on them, define ransackable_associations method
  def self.ransackable_associations(auth_object = nil)
    [] # Define your associations here
  end
end
